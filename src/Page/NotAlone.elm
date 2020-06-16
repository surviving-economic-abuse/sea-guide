module Page.NotAlone exposing (Model, Msg, view)

import Css exposing (..)
import Css.Transitions exposing (flex2)
import Html.Attributes exposing (height)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
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
        , div [ css [ grid ] ] [ card, card, card ]
        ]


grid : Style
grid =
    batch
        [ displayFlex
        , flexWrap wrap
        ]


card : Html msg
card =
    div [ css [ cardStyle ] ]
        [ span [ css [ quote ] ] [ text "A nice long quote about a recognisable experience" ]
        , span [ css [ details ] ] [ text "- My Name, 99" ]
        ]


cardStyle : Style
cardStyle =
    batch
        [ flex3 (int 1) zero (px 400)
        , margin2 (rem 1) zero
        , Css.height (px 200)
        , border3 (px 2) solid Theme.colours.grey
        , borderRadius (rem 1)
        , textAlign center
        , displayFlex
        , flexDirection column
        , padding (rem 0.5)
        ]


quote : Style
quote =
    batch
        [ Css.flex3 (int 1) zero (pct 75)
        ]


details : Style
details =
    batch
        [ Css.flex3 (int 1) zero (pct 25)
        ]
