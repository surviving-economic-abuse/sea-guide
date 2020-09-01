module View.HelpSelfGrid exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (container, containerContent, green, gridStyle, navItemStyles, navListStyle, pageHeadingStyle, pureWhite, purple, shadowGrey, threeColumn, twoColumn, verticalSpacing)


view : Html never
view =
    div []
        [ containerContent
            [ header []
                [ h1 [ css [ pageHeadingStyle ] ] [ text (t HelpSelfTitle) ]
                ]
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
        , verticalSpacing 2
        , container
            [ nav []
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
        [ backgroundColor pureWhite
        , borderRadius (rem 1.8)
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , color purple
        , displayFlex
        , flexDirection column
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , justifyContent center
        , minHeight (px 150)
        , padding2 zero (rem 1)
        , textAlign center
        , textDecoration none
        , hover
            [ border3 (px 3) solid green
            ]
        , focus
            [ border3 (px 3) solid green
            , outline zero
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
