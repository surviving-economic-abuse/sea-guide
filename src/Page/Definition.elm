module Page.Definition exposing (Model, Msg, init, view)

import Css exposing (..)
import Html.Styled exposing (Html, a, div, h1, h2, header, li, p, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, pageHeadingStyle)


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


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text "[cCc] What is Economic Abuse?" ]
            , p [ css [ introStyle ] ] [ text "[cCc] A concise definition of economic abuse in accessible language, and that spans a few sentences so that a small intro paragraph doesn't look strange here.", text " ", a [ href "/[cCc]somewhere" ] [ text "[cCc] more information" ] ]
            ]
        , ul []
            [ li [ css [ categoryStyle ] ] [ h2 [] [ text "[cCc] A Category" ] ]
            , li [ css [ categoryStyle ] ] [ h2 [] [ text "[cCc] A Category" ] ]
            , li [ css [ categoryStyle ] ] [ h2 [] [ text "[cCc] A Category" ] ]
            ]
        , ul []
            [ li [] [ a [ href "help-self" ] [ text "Find out more" ] ]
            , li [] [ a [ href "get-help" ] [ text "Get help" ] ]
            ]
        ]


categoryStyle : Style
categoryStyle =
    Css.batch
        [ margin2 (rem 2) zero ]


introStyle : Style
introStyle =
    Css.batch
        [ color colours.purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , margin2 (rem 2) zero
        ]
