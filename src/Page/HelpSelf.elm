module Page.HelpSelf exposing (Model, Msg, init, view)

import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
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
            [ h1 [ css [ pageHeading ] ] [ text "[cCc] Help Me With.." ]
            ]
        , ul [ css [ grid ] ]
            [ li [ css [ cardStyle ] ] [ a [ css [ blockLinks ], href "#" ] [ div [] [ text "Stuff" ] ] ]
            , li [ css [ cardStyle ] ] [ a [ css [ blockLinks ], href "#" ] [ div [] [ text "Stuff" ] ] ]
            , li [ css [ cardStyle ] ] [ a [ css [ blockLinks ], href "#" ] [ div [] [ text "Stuff" ] ] ]
            , li [ css [ cardStyle ] ] [ a [ css [ blockLinks ], href "#" ] [ div [] [ text "Stuff" ] ] ]
            , li [ css [ cardStyle ] ] [ a [ css [ blockLinks ], href "#" ] [ div [] [ text "Stuff" ] ] ]
            ]
        , ul []
            [ li [] [ a [ href "get-help" ] [ text "Get Help" ] ]
            , li [] [ a [ href "not-alone" ] [ text "Read about others" ] ]
            , li [] [ a [ href "definition" ] [ text "What is Economic Abuse" ] ]
            ]
        ]


grid : Style
grid =
    batch
        [ displayFlex
        , flexWrap wrap
        , justifyContent spaceAround
        ]


blockLinks : Style
blockLinks =
    batch
        [ color colours.purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , display block
        , Css.height (pct 100)
        , Css.width (pct 100)
        ]


three =
    calc (pct 33) minus (rem 1)


cardStyle : Style
cardStyle =
    batch
        [ border3 (px 2) solid Theme.colours.grey
        , borderRadius (rem 1)
        , flex3 zero zero three
        , displayFlex
        , flexDirection column
        , justifyContent center
        , margin2 (rem 1) zero
        , Css.minHeight (px 150)
        , textAlign center
        ]
