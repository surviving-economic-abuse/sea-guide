module Main exposing (main)

import Browser
import Browser.Navigation
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Page.Definition as Definition
import Page.GetHelp as GetHelp
import Page.HelpSelf as HelpSelf
import Page.NotAlone as NotAlone
import Theme exposing (globalStyles)
import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, top)


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


type Page
    = DefinitionPage Definition.Model
    | GetHelpPage
    | HelpSelfPage HelpSelf.Model
    | NotAlonePage NotAlone.Model


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    toUrl url
        { key = key
        , page = NotAlonePage NotAlone.Model
        }



-- UPDATE


type Msg
    = NoOp
    | PageLinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | DefinitionMsg Definition.Msg
    | HelpSelfMsg HelpSelf.Msg
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
            toUrl url model

        DefinitionMsg subMsg ->
            ( model, Cmd.none )

        HelpSelfMsg subMsg ->
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

        HelpSelfPage helpSelf ->
            layout [] [ globalStyles, Html.Styled.map HelpSelfMsg (HelpSelf.view helpSelf) ]

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
        , padding2 zero (rem 2)
        ]



-- ROUTER


toUrl : Url.Url -> Model -> ( Model, Cmd Msg )
toUrl url model =
    let
        parser =
            Parser.oneOf
                [ route Parser.top
                    (toNotAlone model (NotAlone.init ()))
                , route (Parser.s (t DefinitionPageSlug))
                    (toDefinition model (Definition.init ()))
                , route (Parser.s (t GetHelpPageSlug))
                    (toGetHelp model)
                , route (Parser.s (t HelpSelfPageSlug))
                    (toHelpSelf model (HelpSelf.init ()))

                -- The "sea-map" alternatives are to support gh-pages url nesting
                , route (Parser.s "sea-map" </> Parser.s (t DefinitionPageSlug))
                    (toDefinition model (Definition.init ()))
                , route (Parser.s "sea-map" </> Parser.s (t GetHelpPageSlug))
                    (toGetHelp model)
                , route (Parser.s "sea-map" </> Parser.s (t HelpSelfPageSlug))
                    (toHelpSelf model (HelpSelf.init ()))
                ]
    in
    case Parser.parse parser url of
        Just aPage ->
            aPage

        Nothing ->
            ( { model | page = NotAlonePage NotAlone.Model }
            , Cmd.none
            )


toNotAlone : Model -> ( NotAlone.Model, Cmd NotAlone.Msg ) -> ( Model, Cmd Msg )
toNotAlone model ( notAloneModel, cmds ) =
    ( { model | page = NotAlonePage NotAlone.Model }
    , Cmd.map NotAloneMsg cmds
    )


toDefinition : Model -> ( Definition.Model, Cmd Definition.Msg ) -> ( Model, Cmd Msg )
toDefinition model ( definitionModel, cmds ) =
    ( { model | page = DefinitionPage Definition.Model }
    , Cmd.map DefinitionMsg cmds
    )


toGetHelp : Model -> ( Model, Cmd Msg )
toGetHelp model =
    ( { model | page = GetHelpPage }
    , Cmd.none
    )


toHelpSelf : Model -> ( HelpSelf.Model, Cmd HelpSelf.Msg ) -> ( Model, Cmd Msg )
toHelpSelf model ( helpSelfModel, cmds ) =
    ( { model | page = HelpSelfPage HelpSelf.Model }
    , Cmd.map HelpSelfMsg cmds
    )


route : Parser.Parser a b -> a -> Parser.Parser (b -> c) c
route parser handler =
    Parser.map handler parser
