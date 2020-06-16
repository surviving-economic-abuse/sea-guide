module Main exposing (main)

import Browser
import Css exposing (..)
import Css.Global exposing (everything, global, typeSelector)
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
    layout []
        [ globalStyles
        , whatisea
        ]


layout : List (Attribute msg) -> List (Html msg) -> Html msg
layout =
    styled div
        [ margin2 zero auto
        , maxWidth (px 800)
        , width (pct 100)
        , backgroundColor (hex "fff")
        , displayFlex
        , flexDirection column
        , minHeight (vh 100)
        ]


whatisea : Html msg
whatisea =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyles ] ] [ text "What is Economic Abuse?" ]
            , p [ css [ pageDescriptionStyles ] ] [ text "A concise definition of economic abuse in accessible language. ", a [ href "/somewhere" ] [ text "somewhere" ] ]
            ]
        , ul []
            [ li [] [ text "A Category" ]
            , li [] [ text "A Category" ]
            , li [] [ text "A Category" ]
            ]
        ]


eacategories : Html msg
eacategories =
    div [] []


pageHeadingStyles : Style
pageHeadingStyles =
    Css.batch
        [ color Theme.colours.purple
        , fontFamilies [ "Raleway-ExtraBold", "sansSerif" ]
        , fontSize (rem 2.5)
        , margin (rem 2)
        , textAlign center
        ]


pageDescriptionStyles : Style
pageDescriptionStyles =
    Css.batch
        [ color Theme.colours.purple
        , fontFamilies [ "Raleway-Bold", "sansSerif" ]
        , fontSize (rem 1.8)
        ]


globalStyles : Html msg
globalStyles =
    global
        [ typeSelector "body" [ backgroundColor (hex "eee") ]
        , everything [ color Theme.colours.grey, fontFamilies [ "sansSerif" ] ]
        ]
