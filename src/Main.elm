module Main exposing (main)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Theme exposing (colours)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = viewDocument
        }


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = "[cCc] SEA-MAP App", body = [ view model |> Html.Styled.toUnstyled ] }


view : Model -> Html Msg
view model =
    layout [] []


layout : List (Attribute msg) -> List (Html msg) -> Html msg
layout =
    styled div
        [ margin2 zero auto
        , maxWidth (px 800)
        , width (pct 100)
        , backgroundColor (hex "cCc")
        , displayFlex
        , flexDirection column
        , minHeight (vh 100)
        ]
