module Main exposing (main)

import Browser
import Browser.Dom
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
import Task
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
    ( { key = key, page = Maybe.withDefault (NotAlonePage { revealedJourney = Nothing }) maybePage }, Cmd.none )



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
                    -- If not a page default to NotAlone
                    Maybe.withDefault (NotAlonePage { revealedJourney = Nothing }) (pageFromUrl url)
            in
            ( { model | page = newPage }, resetViewportTop )

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



-- VIEW


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = t SiteTitle, body = [ view model |> Html.Styled.toUnstyled ] }


view : Model -> Html Msg
view model =
    case model.page of
        DefinitionPage definition ->
            Html.Styled.map DefinitionMsg (Definition.view definition)

        GetHelpPage ->
            Html.Styled.map (\_ -> NoOp) GetHelp.view

        HelpSelfGridPage ->
            Html.Styled.map (\_ -> NoOp) HelpSelfGrid.view

        HelpSelfSinglePage helpSelfSingle category ->
            Html.Styled.map HelpSelfSingleMsg (HelpSelfSingle.view category helpSelfSingle)

        NotAlonePage notAlone ->
            Html.Styled.map NotAloneMsg (NotAlone.view notAlone)



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
        [ Parser.map (NotAlonePage { revealedJourney = Nothing }) Parser.top
        , Parser.map (DefinitionPage (Definition.Model Set.empty)) (Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage (HelpSelfSingle.Model Set.empty)) (Parser.s "help-self" </> string)

        -- Hardcoded to include staging prefix
        , Parser.map (DefinitionPage (Definition.Model Set.empty)) (Parser.s "sea-map" </> Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s "sea-map" </> Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s "sea-map" </> Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage (HelpSelfSingle.Model Set.empty)) (Parser.s "sea-map" </> Parser.s "help-self" </> string)
        ]


pageFromUrl : Url.Url -> Maybe Page
pageFromUrl url =
    { url | path = url.path }
        |> Parser.parse routeParser


resetViewportTop : Cmd Msg
resetViewportTop =
    Task.perform (\_ -> NoOp) (Browser.Dom.setViewport 0 0)
