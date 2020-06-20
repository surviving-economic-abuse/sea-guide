module Page.HelpSelfGrid exposing (Category(..), categoryFromString, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, gridStyle, pageHeadingStyle, threeColumn, twoColumn)


type Category
    = COVID
    | NotCOVID


categoryFromString : String -> Category
categoryFromString category =
    case category of
        "covid" ->
            COVID

        _ ->
            NotCOVID


view : Html never
view =
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
infoLink linkName linkHref =
    li
        [ css
            [ cardStyle
            , withMedia [ only screen [ Media.minWidth (px 576) ] ]
                [ flex3 zero zero threeColumn ]
            ]
        ]
        [ a [ css [ blockLinkStyle ], href linkHref ] [ div [] [ text linkName ] ]
        ]


blockLinkStyle : Style
blockLinkStyle =
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
