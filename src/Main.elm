module Main exposing (main)

import Analytics exposing (updateAnalytics, updateAnalyticsPage)
import Browser
import Browser.Dom
import Browser.Navigation
import CookieContent exposing (CookieState, renderCookieContent, saveConsent)
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import EmergencyContent exposing (renderEmergencyButton, renderEmergencyPanel, renderExitButton)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Message exposing (CookieButton(..), Msg(..))
import Meta exposing (metaFromPage, setMetaDescription)
import Page exposing (Page(..))
import Page.Definition
import Page.HelpSelfSingle
import Page.NotAlone
import Route exposing (Route(..))
import Task
import Theme exposing (..)
import Url
import View.Definition
import View.GetHelp
import View.HelpSelfGrid
import View.HelpSelfSingle
import View.NotAlone


main : Program String Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = viewDocument
        , onUrlRequest = PageLinkClicked
        , onUrlChange = UrlChanged
        }



-- MODEL


type alias Model =
    { key : Browser.Navigation.Key
    , page : Page
    , viewportWidth : Float
    , emergencyPopupIsOpen : Bool
    , cookieState : CookieState
    }


init : String -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init hasConsentedString url key =
    -- make a Bool out of cookie consent session string
    let
        page =
            Page.fromRoute (Maybe.withDefault NotAlone (Route.fromUrl url))

        hasConsented =
            if hasConsentedString == "true" then
                True

            else
                -- for null false & undefined, we assume no consent
                False

        viewCookieBannerContent =
            if hasConsentedString == "null" then
                True

            else
                -- user has previously stated a preference, info should be collapsed
                False
    in
    ( { key = key
      , page = page
      , viewportWidth = 800
      , emergencyPopupIsOpen = False
      , cookieState =
            { cookieBannerIsOpen = viewCookieBannerContent
            , privacyInfoIsOpen = False -- always start collapsed
            , hasConsentedToCookies = hasConsented
            }
      }
    , Cmd.batch
        [ Task.perform GotViewport Browser.Dom.getViewport
        , setMetaDescription (metaFromPage page).description
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        PageLinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Browser.Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Browser.Navigation.load href
                    )

        UrlChanged url ->
            let
                route =
                    Maybe.withDefault NotAlone (Route.fromUrl url)

                newPage =
                    Page.fromRoute route

                hasConsented =
                    model.cookieState.hasConsentedToCookies
            in
            ( { model | page = newPage }
            , Cmd.batch
                [ resetFocusTop
                , resetViewportTop
                , setMetaDescription (metaFromPage newPage).description
                , updateAnalytics hasConsented (updateAnalyticsPage (Route.toString route))
                ]
            )

        GotViewport viewport ->
            ( { model | viewportWidth = Maybe.withDefault model.viewportWidth (Just viewport.scene.width) }, Cmd.none )

        EmergencyButtonClicked ->
            ( { model | emergencyPopupIsOpen = not model.emergencyPopupIsOpen }, Cmd.none )

        CookieButtonClicked button ->
            let
                newCookieState =
                    case button of
                        ViewCookieSettings ->
                            { privacyInfoIsOpen = False
                            , cookieBannerIsOpen = True
                            , hasConsentedToCookies = model.cookieState.hasConsentedToCookies
                            }

                        ViewPrivacy ->
                            { privacyInfoIsOpen = not model.cookieState.privacyInfoIsOpen
                            , cookieBannerIsOpen = True
                            , hasConsentedToCookies = model.cookieState.hasConsentedToCookies
                            }

                        -- When we accept or decline, collapse privacy info too.
                        AcceptCookies ->
                            { privacyInfoIsOpen = False
                            , cookieBannerIsOpen = False
                            , hasConsentedToCookies = True
                            }

                        DeclineCookies ->
                            { privacyInfoIsOpen = False
                            , cookieBannerIsOpen = False
                            , hasConsentedToCookies = False
                            }

                cmdMsg =
                    if button == AcceptCookies then
                        Cmd.batch
                            [ updateAnalyticsPage (Page.toString model.page)
                            , saveConsent newCookieState.hasConsentedToCookies
                            ]

                    else
                        saveConsent newCookieState.hasConsentedToCookies
            in
            ( { model | cookieState = newCookieState }, cmdMsg )

        DefinitionMsg subMsg ->
            case model.page of
                DefinitionPage definition ->
                    updateDefinition model (Page.Definition.update subMsg definition)

                _ ->
                    ( model, Cmd.none )

        HelpSelfSingleMsg subMsg ->
            case model.page of
                HelpSelfSinglePage helpSelf category ->
                    updateHelpSelfSingle model category (Page.HelpSelfSingle.update subMsg helpSelf)

                _ ->
                    ( model, Cmd.none )

        NotAloneMsg subMsg ->
            case model.page of
                NotAlonePage notAlone ->
                    updateNotAlone model (Page.NotAlone.update subMsg notAlone)

                _ ->
                    ( model, Cmd.none )



-- Internal update helpers


updateDefinition : Model -> ( Page.Definition.Model, Cmd Page.Definition.Msg ) -> ( Model, Cmd Msg )
updateDefinition model ( definition, cmds ) =
    ( { model | page = DefinitionPage definition }
    , Cmd.map DefinitionMsg cmds
    )


updateHelpSelfSingle : Model -> String -> ( Page.HelpSelfSingle.Model, Cmd Page.HelpSelfSingle.Msg ) -> ( Model, Cmd Msg )
updateHelpSelfSingle model category ( helpSelf, cmds ) =
    ( { model | page = HelpSelfSinglePage helpSelf category }
    , Cmd.map HelpSelfSingleMsg cmds
    )


updateNotAlone : Model -> ( Page.NotAlone.Model, Cmd Page.NotAlone.Msg ) -> ( Model, Cmd Msg )
updateNotAlone model ( notAlone, cmds ) =
    ( { model | page = NotAlonePage notAlone }
    , Cmd.map NotAloneMsg cmds
    )


resetViewportTop : Cmd Msg
resetViewportTop =
    Task.perform (\_ -> NoOp) (Browser.Dom.setViewport 0 0)


resetFocusTop : Cmd Msg
resetFocusTop =
    Task.attempt (\_ -> NoOp) (Browser.Dom.focus "focus-target")



-- VIEW


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = (metaFromPage model.page).title
    , body = [ view model |> Html.Styled.toUnstyled ]
    }


view : Model -> Html Msg
view model =
    div [ css [ minHeight (vh 100), waveStyle ] ]
        [ globalStyles
        , renderExitButton
        , pageModelToHtmlMsg model
        , if model.emergencyPopupIsOpen then
            renderEmergencyPanel model.viewportWidth

          else
            renderEmergencyButton
        , renderCookieContent model.cookieState
        ]


pageModelToHtmlMsg : Model -> Html Msg
pageModelToHtmlMsg model =
    let
        hasConsented =
            model.cookieState.hasConsentedToCookies
    in
    case model.page of
        DefinitionPage definition ->
            Html.Styled.map DefinitionMsg (View.Definition.view hasConsented definition)

        GetHelpPage ->
            Html.Styled.map (\_ -> NoOp) (View.GetHelp.view model.viewportWidth)

        HelpSelfGridPage ->
            Html.Styled.map (\_ -> NoOp) View.HelpSelfGrid.view

        HelpSelfSinglePage helpSelfSingle category ->
            Html.Styled.map HelpSelfSingleMsg (View.HelpSelfSingle.view hasConsented category helpSelfSingle)

        NotAlonePage notAlone ->
            Html.Styled.map NotAloneMsg (View.NotAlone.view hasConsented notAlone)
