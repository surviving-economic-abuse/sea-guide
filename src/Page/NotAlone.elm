module Page.NotAlone exposing (Model, Msg, init, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, gridStyle, oneColumn, pageHeadingStyle, twoColumn)


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
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t NotAloneTitle) ]
            ]
        , div [ css [ gridStyle ] ]
            [ card (t QuoteRelatable1) (t QuoteName1) (t QuoteAge1)
            , card (t QuoteRelatable2) (t QuoteName2) (t QuoteAge2)
            , card (t QuoteRelatable3) (t QuoteName3) (t QuoteAge3)
            , card (t QuoteRelatable4) (t QuoteName4) (t QuoteAge4)
            , card (t QuoteRelatable5) (t QuoteName5) (t QuoteAge5)
            , card (t QuoteRelatable6) (t QuoteName6) (t QuoteAge6)
            ]
        , a [ href (t DefinitionPageSlug) ] [ text (t ToDefinitionFromNotAloneLink) ]
        ]


card : String -> String -> String -> Html msg
card quote name age =
    div
        [ css
            [ cardStyle
            , withMedia [ only screen [ Media.minWidth (px 576) ] ]
                [ flex3 zero zero twoColumn ]
            ]
        ]
        [ span [ css [ quoteStyle ] ] [ text quote ]
        , span [ css [ detailsStyle ] ] [ text ("- " ++ name ++ ", " ++ age) ]
        ]


cardStyle : Style
cardStyle =
    batch
        [ border3 (px 2) solid Theme.colours.grey
        , borderRadius (rem 1)
        , flex3 zero zero oneColumn
        , displayFlex
        , flexDirection column
        , justifyContent center
        , margin (rem 1)
        , padding (rem 1)
        , Css.minHeight (px 200)
        , textAlign center
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ Css.flex3 zero zero (pct 60)
        ]


detailsStyle : Style
detailsStyle =
    batch
        [ alignSelf flexEnd
        , Css.flex3 zero zero (pct 20)
        ]
