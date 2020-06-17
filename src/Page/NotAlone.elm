module Page.NotAlone exposing (Model, Msg, init, view)

import Css exposing (..)
import Css.Media as Media exposing (..)
import Html.Attributes exposing (height)
import Html.Styled exposing (..)
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
            [ h1 [ css [ pageHeading ] ] [ text "[cCc] You Are Not Alone" ]
            ]
        , div [ css [ grid ] ]
            [ card "[cCc] A medium quote about a recognisable experience. A medium quote about a recognisable experience." "My Name" "22"
            , card "[cCc] A short quote about a recognisable experience" "My Name" "33"
            , card "[cCc] A medium quote about a recognisable experience. A medium quote about a recognisable experience." "My Name" "62"
            , card "[cCc] A long quote about a recognisable experience. A long quote about a recognisable experience, A long quote about a recognisable experience." "My Name" "33"
            , card "[cCc] A short quote about a recognisable experience" "My Name" "55"
            , card "[cCc] A long quote about a recognisable experience. A long quote about a recognisable experience, A long quote about a recognisable experience." "My Name" "44"
            ]
        , div [] [ text "Not Alone page" ]
        , a [ href "definition" ] [ text "Find out more about Economic Abuse" ]
        ]


grid : Style
grid =
    batch
        [ displayFlex
        , flexWrap wrap
        , justifyContent spaceBetween
        ]


card : String -> String -> String -> Html msg
card quote name age =
    div
        [ css
            [ cardStyle
            , withMedia [ only screen [ Media.minWidth (px 576) ] ]
                [ flex3 zero zero desktopWidth ]
            ]
        ]
        [ span [ css [ quoteStyle ] ] [ text quote ]
        , span [ css [ details ] ] [ text ("- " ++ name ++ ", " ++ age) ]
        ]


desktopWidth =
    calc (pct 50) minus (rem 1)


mobileWidth =
    calc (pct 100) minus (rem 1)


cardStyle : Style
cardStyle =
    batch
        [ flex3 zero zero mobileWidth
        , margin2 (rem 1) zero
        , Css.minHeight (px 200)
        , border3 (px 2) solid Theme.colours.grey
        , borderRadius (rem 1)
        , textAlign center
        , displayFlex
        , flexDirection column
        , padding (rem 1)
        , justifyContent center
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ Css.flex3 zero zero (pct 60)
        ]


details : Style
details =
    batch
        [ Css.flex3 zero zero (pct 20)
        , alignSelf flexEnd
        ]
