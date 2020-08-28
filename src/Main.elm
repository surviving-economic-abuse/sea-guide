module Main exposing (main)

import Browser
import Browser.Dom
import Browser.Navigation
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Page.Definition
import Page.HelpSelfSingle
import Page.NotAlone
import PageTemplate
import Route exposing (Route(..))
import Set
import Task
import Url
import View.Definition
import View.GetHelp
import View.HelpSelfGrid
import View.HelpSelfSingle
import View.NotAlone


main : Program () Model Msg
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
    }


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key, page = pageFromMaybeRoute (Route.fromUrl url) }, Cmd.none )


type Page
    = DefinitionPage Page.Definition.Model
    | GetHelpPage
    | HelpSelfGridPage
    | HelpSelfSinglePage Page.HelpSelfSingle.Model String
    | NotAlonePage Page.NotAlone.Model


pageFromMaybeRoute : Maybe Route -> Page
pageFromMaybeRoute route =
    case route of
        Just Route.Definition ->
            DefinitionPage { openCategories = Set.empty }

        Just Route.GetHelp ->
            GetHelpPage

        Just Route.HelpSelfGrid ->
            HelpSelfGridPage

        Just (Route.HelpSelfSingle string) ->
            HelpSelfSinglePage { openResources = Set.empty } string

        -- Always fall back to home if route does not exist
        _ ->
            NotAlonePage { revealedJourney = Nothing }



-- UPDATE


type Msg
    = NoOp
    | PageLinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | DefinitionMsg Page.Definition.Msg
    | HelpSelfSingleMsg Page.HelpSelfSingle.Msg
    | NotAloneMsg Page.NotAlone.Msg


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
                newPage =
                    pageFromMaybeRoute (Route.fromUrl url)
            in
            ( { model | page = newPage }, resetViewportTop )

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



-- VIEW


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = t SiteTitle, body = [ view model |> Html.Styled.toUnstyled ] }


view : Model -> Html Msg
view model =
    case model.page of
        DefinitionPage definition ->
            Html.Styled.map DefinitionMsg (PageTemplate.page (View.Definition.view definition))

        GetHelpPage ->
            Html.Styled.map (\_ -> NoOp) (PageTemplate.page View.GetHelp.view)

        HelpSelfGridPage ->
            Html.Styled.map (\_ -> NoOp) (PageTemplate.page View.HelpSelfGrid.view)

        HelpSelfSinglePage helpSelfSingle category ->
            Html.Styled.map HelpSelfSingleMsg (PageTemplate.page (View.HelpSelfSingle.view category helpSelfSingle))

        NotAlonePage notAlone ->
            Html.Styled.map NotAloneMsg (PageTemplate.page (View.NotAlone.view notAlone))
