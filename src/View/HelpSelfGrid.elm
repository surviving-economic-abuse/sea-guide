module View.HelpSelfGrid exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id, tabindex)
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (container, containerContent, green, gridStyle, navItemStyles, navListStyle, pageHeadingStyle, pureWhite, purple, shadowGrey, threeColumn, twoColumn, verticalSpacing, withMediaDesktop)


view : Html never
view =
    div []
        [ containerContent
            [ header []
                [ h1 [ css [ pageHeadingStyle ], id "focus-target", tabindex -1 ] [ text (t HelpSelfTitle) ]
                ]
            , ul [ css [ gridStyle, justifyContent center ] ]
                [ infoLink (t HelpSelfBankingLink) (t HelpSelfBankingSlug)
                , infoLink (t HelpSelfDebtLink) (t HelpSelfDebtSlug)
                , infoLink (t HelpSelfHousingLink) (t HelpSelfHousingSlug)
                , infoLink (t HelpSelfFinancialLink) (t HelpSelfFinancialSlug)
                , infoLink (t HelpSelfInfoLawLink) (t HelpSelfInfoLawSlug)
                , infoLink (t HelpSelfSeparatingLink) (t HelpSelfSeparatingSlug)
                ]
            , verticalSpacing 4
            ]
        , container
            [ nav []
                [ ul [ css [ navListStyle ] ]
                    [ li [ css navItemStyles ]
                        [ renderNavLink Home NotAlone ToNotAloneFromHelpSelfLink
                        ]
                    , li [ css navItemStyles ]
                        [ renderNavLink None Definition ToDefinitionFromHelpSelfLink
                        ]
                    , li [ css navItemStyles ]
                        [ renderNavLink None GetHelp ToGetHelpFromHelpSelfLink
                        ]
                    ]
                ]
            ]
        , verticalSpacing 2
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
        , border3 (px 3) solid transparent
        , borderRadius (rem 1.8)
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , color purple
        , displayFlex
        , flexDirection column
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , height (px 150)
        , justifyContent center
        , padding2 zero (rem 1)
        , textAlign center
        , textDecoration none
        , hover
            [ border3 (px 3) solid green.colour
            ]
        , focus
            [ border3 (px 3) solid green.colour
            , outline zero
            ]
        ]


gridItemStyle : Style
gridItemStyle =
    batch
        [ flex3 zero zero twoColumn
        , margin (rem 1)
        , position relative
        , withMediaDesktop
            [ flex3 zero zero threeColumn
            , top (rem 3)
            , width threeColumn

            -- nthOfType can take a formula, but as the 7th item is wrapping
            -- to the centre, it's easier to be explicit
            , nthOfType "2"
                [ top zero
                ]
            , nthOfType "5"
                [ top zero
                ]
            , nthOfType "7"
                [ top zero
                ]
            ]
        ]
