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
    { key : Browser.Navigation.Key, page : Page }


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        maybePage =
            pageFromUrl url { key = key, page = NotAlonePage NotAlone.Model }
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
                    Maybe.withDefault (NotAlonePage {}) (pageFromUrl url model)
            in
            -- If not a page default to NotAlone
            ( { model | page = newPage }, Cmd.none )

        DefinitionMsg subMsg ->
            ( model, Cmd.none )

        HelpSelfSingleMsg subMsg ->
            ( model, Cmd.none )

        NotAloneMsg subMsg ->
            ( model, Cmd.none )



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
        , Parser.map (DefinitionPage Definition.Model) (Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage HelpSelfSingle.Model) (Parser.s "help-self" </> string)
        ]


pageFromUrl : Url.Url -> Model -> Maybe Page
pageFromUrl url model =
    { url | path = url.path }
        |> Parser.parse routeParser
