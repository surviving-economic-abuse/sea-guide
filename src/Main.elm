module Main exposing (main)

import Browser
import Browser.Navigation
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Page.Definition as Definition
import Page.GetHelp as GetHelp
import Page.HelpSelfGrid as HelpSelfGrid
import Page.HelpSelfSingle as HelpSelfSingle
import Page.NotAlone as NotAlone
import Set
import Theme exposing (globalStyles)
import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


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
    let
        maybePage =
            pageFromUrl url
    in
    -- If not a page default to NotAlone
    ( { key = key, page = Maybe.withDefault (NotAlonePage NotAlone.Model) maybePage }, Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | PageLinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | DefinitionMsg Definition.Msg
    | HelpSelfSingleMsg HelpSelfSingle.Msg
    | NotAloneMsg NotAlone.Msg


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
                    Maybe.withDefault (NotAlonePage {}) (pageFromUrl url)
            in
            -- If not a page default to NotAlone
            ( { model | page = newPage }, Cmd.none )

        DefinitionMsg subMsg ->
            case model.page of
                DefinitionPage definition ->
                    updateDefinition model (Definition.update subMsg definition)

                _ ->
                    ( model, Cmd.none )

        HelpSelfSingleMsg subMsg ->
            case model.page of
                HelpSelfSinglePage helpSelf category ->
                    updateHelpSelfSingle model category (HelpSelfSingle.update subMsg helpSelf)

                _ ->
                    ( model, Cmd.none )

        NotAloneMsg subMsg ->
            case model.page of
                NotAlonePage notAlone ->
                    updateNotAlone model (NotAlone.update subMsg notAlone)

                _ ->
                    ( model, Cmd.none )



-- Helpers to run updates from individual page modules


updateDefinition : Model -> ( Definition.Model, Cmd Definition.Msg ) -> ( Model, Cmd Msg )
updateDefinition model ( definition, cmds ) =
    ( { model | page = DefinitionPage definition }
    , Cmd.map DefinitionMsg cmds
    )


updateHelpSelfSingle : Model -> String -> ( HelpSelfSingle.Model, Cmd HelpSelfSingle.Msg ) -> ( Model, Cmd Msg )
updateHelpSelfSingle model category ( helpSelf, cmds ) =
    ( { model | page = HelpSelfSinglePage helpSelf category }
    , Cmd.map HelpSelfSingleMsg cmds
    )


updateNotAlone : Model -> ( NotAlone.Model, Cmd NotAlone.Msg ) -> ( Model, Cmd Msg )
updateNotAlone model ( notAlone, cmds ) =
    ( { model | page = NotAlonePage notAlone }
    , Cmd.map NotAloneMsg cmds
    )


updateDefinition : Model -> ( Definition.Model, Cmd Definition.Msg ) -> ( Model, Cmd Msg )
updateDefinition model ( notAlone, cmds ) =
    ( { model | page = DefinitionPage notAlone }
    , Cmd.map DefinitionMsg cmds
    )



-- VIEW


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = t SiteTitle, body = [ view model |> Html.Styled.toUnstyled ] }


view : Model -> Html Msg
view model =
    case model.page of
        DefinitionPage definition ->
            layout [] [ globalStyles, Html.Styled.map DefinitionMsg (Definition.view definition) ]

        GetHelpPage ->
            layout [] [ globalStyles, Html.Styled.map (\_ -> NoOp) GetHelp.view ]

        HelpSelfGridPage ->
            layout [] [ globalStyles, Html.Styled.map (\_ -> NoOp) HelpSelfGrid.view ]

        HelpSelfSinglePage helpSelfSingle category ->
            layout [] [ globalStyles, Html.Styled.map HelpSelfSingleMsg (HelpSelfSingle.view category helpSelfSingle) ]

        NotAlonePage notAlone ->
            layout [] [ globalStyles, Html.Styled.map NotAloneMsg (NotAlone.view notAlone) ]


layout : List (Attribute msg) -> List (Html msg) -> Html msg
layout =
    styled div
        [ margin2 zero auto
        , maxWidth (px 1000)
        , width (pct 100)
        , backgroundColor (hex "fff")
        , displayFlex
        , flexDirection column
        , minHeight (vh 100)
        , padding2 zero (rem 1)
        ]



-- ROUTING


type Page
    = DefinitionPage Definition.Model
    | GetHelpPage
    | HelpSelfGridPage
    | HelpSelfSinglePage HelpSelfSingle.Model String
    | NotAlonePage NotAlone.Model


routeParser : Parser (Page -> a) a
routeParser =
    oneOf
        [ Parser.map (NotAlonePage NotAlone.Model) Parser.top
        , Parser.map (DefinitionPage (Definition.Model Set.empty)) (Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage HelpSelfSingle.Model) (Parser.s "help-self" </> string)

        -- Hardcoded to include staging prefix
        , Parser.map (DefinitionPage (Definition.Model Set.empty)) (Parser.s "sea-map" </> Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s "sea-map" </> Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s "sea-map" </> Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage HelpSelfSingle.Model) (Parser.s "sea-map" </> Parser.s "help-self" </> string)
        ]


pageFromUrl : Url.Url -> Maybe Page
pageFromUrl url =
    { url | path = url.path }
        |> Parser.parse routeParser
