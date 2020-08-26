module View.HelpSelfGrid exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (globalStyles, grey, gridStyle, lightGrey, navItemStyles, navListStyle, pageHeadingStyle, purple, threeColumn, twoColumn, verticalSpacing)


view : Html never
view =
    div []
        [ globalStyles
        , header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t HelpSelfTitle) ]
            ]
        , ul [ css [ gridStyle ] ]
            [ infoLink (t HelpSelfBankingLink) (t HelpSelfBankingSlug)
            , infoLink (t HelpSelfDebtLink) (t HelpSelfDebtSlug)
            , infoLink (t HelpSelfHousingLink) (t HelpSelfHousingSlug)
            , infoLink (t HelpSelfFinancialLink) (t HelpSelfFinancialSlug)
            , infoLink (t HelpSelfCovidLink) (t HelpSelfCovidSlug)
            , infoLink (t HelpSelfInfoLawLink) (t HelpSelfInfoLawSlug)
            , infoLink (t HelpSelfSeparatingLink) (t HelpSelfSeparatingSlug)
            ]
        , verticalSpacing
        , nav []
            [ ul [ css [ navListStyle ] ]
                [ li [ css navItemStyles ]
                    [ renderNavLink Forward GetHelp ToGetHelpFromHelpSelfLink
                    ]
                , li [ css navItemStyles ]
                    [ renderNavLink Forward NotAlone ToNotAloneFromHelpSelfLink
                    ]
                , li [ css navItemStyles ]
                    [ renderNavLink Forward Definition ToDefinitionFromHelpSelfLink
                    ]
                ]
            ]
        ]


infoLink : String -> String -> Html msg
infoLink linkName linkHref =
    let
        path =
            t HelpSelfGridPageSlug ++ "/" ++ linkHref
    in
    li [ css [ gridItemStyle ] ]
        [ a
            [ css [ gridCardStyle ], href path ]
            [ span [] [ text linkName ] ]
        ]


gridCardStyle : Style
gridCardStyle =
    batch
        [ backgroundColor lightGrey
        , border3 (px 1) solid grey
        , borderRadius (rem 1)
        , color purple
        , displayFlex
        , flexDirection column
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , justifyContent center
        , minHeight (px 150)
        , textAlign center
        , textDecoration none
        , hover
            [ borderColor purple
            ]
        ]


gridItemStyle : Style
gridItemStyle =
    batch
        [ flex3 zero zero twoColumn
        , margin (rem 1)
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ flex3 zero zero threeColumn ]
        ]
