module Main exposing (main)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Page.Definition as Definition
import Page.GetHelp as GetHelp
import Page.HelpSelf as HelpSelf
import Page.NotAlone as NotAlone
import Theme exposing (globalStyles)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = viewDocument
        }


type alias Model =
    { page : Page }


type Page
    = Definition Definition.Model
    | GetHelp
    | HelpSelf HelpSelf.Model
    | NotAlone NotAlone.Model


init : () -> ( Model, Cmd Msg )
init _ =
    ( { page = NotAlone NotAlone.Model }
    , Cmd.none
    )


type Msg
    = NoOp
    | DefinitionMsg Definition.Msg
    | HelpSelfMsg HelpSelf.Msg
    | NotAloneMsg NotAlone.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        DefinitionMsg subMsg ->
            ( model, Cmd.none )

        HelpSelfMsg subMsg ->
            ( model, Cmd.none )

        NotAloneMsg subMsg ->
            ( model, Cmd.none )


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = "[cCc] SEA-MAP App", body = [ view model |> Html.Styled.toUnstyled ] }


view : Model -> Html Msg
view model =
    case model.page of
        Definition definition ->
            layout [] [ globalStyles, Html.Styled.map DefinitionMsg (Definition.view definition) ]

        GetHelp ->
            layout [] [ globalStyles, Html.Styled.map (\_ -> NoOp) GetHelp.view ]

        HelpSelf helpSelf ->
            layout [] [ globalStyles, Html.Styled.map HelpSelfMsg (HelpSelf.view helpSelf) ]

        NotAlone notAlone ->
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
