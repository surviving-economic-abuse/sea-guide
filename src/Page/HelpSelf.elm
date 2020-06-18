module Page.HelpSelf exposing (Model, Msg, init, view)

<<<<<<< HEAD
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
=======
import Copy.Keys exposing (..)
import Copy.Text exposing (t)
>>>>>>> release
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, gridStyle, oneColumn, pageHeadingStyle, threeColumn, twoColumn)


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
            [ h1 [ css [ pageHeadingStyle ] ] [ text "[cCc] Help Me With.." ]
            ]
        , ul [ css [ gridStyle ] ]
            [ infoLink "COVID-19" "#"
            , infoLink "Understanding Economic Abuse" "#"
            , infoLink "Banking" "#"
            , infoLink "Debt" "#"
            , infoLink "Housing" "#"
            ]
        , ul []
            [ li [] [ a [ href (t GetHelpPageSlug) ] [ text "Get Help" ] ]
            , li [] [ a [ href (t NotAlonePageSlug) ] [ text "Read about others" ] ]
            , li [] [ a [ href (t DefinitionPageSlug) ] [ text "What is Economic Abuse" ] ]
            ]
        ]


infoLink : String -> String -> Html msg
infoLink title link =
    li
        [ css
            [ cardStyle
            , withMedia [ only screen [ Media.minWidth (px 576) ] ]
                [ flex3 zero zero threeColumn ]
            ]
        ]
        [ a [ css [ blockLinks ], href link ] [ div [] [ text title ] ]
        ]


blockLinks : Style
blockLinks =
    batch
        [ color colours.purple
        , displayFlex
        , flexDirection column
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , Css.height (pct 100)
        , justifyContent center
        , textDecoration none
        , Css.width (pct 100)
        ]


cardStyle : Style
cardStyle =
    batch
        [ border3 (px 2) solid Theme.colours.grey
        , borderRadius (rem 1)
        , flex3 zero zero twoColumn
        , margin (rem 1)
        , Css.minHeight (px 150)
        , textAlign center
        ]
