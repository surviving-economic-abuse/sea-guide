module Page.Definition exposing (Model, Msg, view)

import Css exposing (..)
import Html.Styled exposing (Html, a, div, h1, h2, header, li, p, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, pageHeading)


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
            [ h1 [ css [ pageHeading ] ] [ text "[cCc] What is Economic Abuse?" ]
            , p [ css [ pageDescription ] ] [ text "[cCc] A concise definition of economic abuse in accessible language, and that spans a few sentences so that a small intro paragraph doesn't look strange here.", text " ", a [ href "/[cCc]somewhere" ] [ text "[cCc] more information" ] ]
            ]
        , ul []
            [ li [ css [ category ] ] [ h2 [] [ text "[cCc] A Category" ] ]
            , li [ css [ category ] ] [ h2 [] [ text "[cCc] A Category" ] ]
            , li [ css [ category ] ] [ h2 [] [ text "[cCc] A Category" ] ]
            ]
        ]


category : Style
category =
    Css.batch
        [ margin2 (rem 2) zero ]


pageDescription : Style
pageDescription =
    Css.batch
        [ color colours.purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , margin2 (rem 2) zero
        ]
