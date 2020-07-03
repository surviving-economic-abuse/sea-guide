module Page.NotAlone exposing (Model, Msg(..), update, view)

import Browser.Dom as Dom
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id)
import Html.Styled.Events exposing (onClick)
import Task
import Theme exposing (colours, gridStyle, navItemStyles, navLinkStyle, navListStyle, oneColumn, pageHeadingStyle, twoColumn, verticalSpacing)


type alias Model =
    {}


type Msg
    = NoOp
    | ScrollTo


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ScrollTo ->
            ( model, Task.perform (always NoOp) (Dom.setViewport 0 500) )


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t NotAloneTitle) ]
            , button [ onClick ScrollTo, css [ emergencyButtonStyle ] ] [ text (t EmergencyButton) ]
            ]
        , div [ css [ gridStyle ] ]
            [ card (t Journey1Relatable) (t Journey1Name) (t Journey1Age)
            , card (t Journey2Relatable) (t Journey2Name) (t Journey2Age)
            , card (t Journey3Relatable) (t Journey3Name) (t Journey3Age)
            , card (t Journey4Relatable) (t Journey4Name) (t Journey4Age)
            , card (t Journey5Relatable) (t Journey5Name) (t Journey5Age)
            , card (t Journey6Relatable) (t Journey6Name) (t Journey6Age)
            ]
        , verticalSpacing
        , nav [ css [ navListStyle ] ]
            [ p [ css [ reassuringStyle ] ]
                [ text (t ToDefinitionReassuringText) ]
            , a
                [ href (t DefinitionPageSlug), css (navLinkStyle :: navItemStyles) ]
                [ span [] [ text (t ToDefinitionFromNotAloneLink) ] ]
            ]
        , verticalSpacing
        , div [ css [ emergencyContactStyle ], id "emergency" ]
            [ p [] [ text (t EmergencyReassure) ]
            , p [] [ text (t EmergencyContactInfo) ]
            ]
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


emergencyButtonStyle : Style
emergencyButtonStyle =
    batch
        [ backgroundColor colours.grey
        , padding2 (rem 0.5) (rem 1)
        , borderRadius (rem 0.5)
        , color colours.white
        , fontWeight (int 400)
        , margin auto
        , border zero
        ]


emergencyContactStyle : Style
emergencyContactStyle =
    batch
        [ margin auto
        , maxWidth (pct 100)
        , backgroundColor colours.grey
        , color colours.white
        , padding (rem 1)
        ]


reassuringStyle : Style
reassuringStyle =
    batch
        [ flex3 zero zero oneColumn
        , textAlign center
        , marginBottom (rem 1)
        ]
