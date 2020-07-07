module Page.HelpSelfGrid exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, gridStyle, navItemStyles, navLinkStyle, navListStyle, pageHeadingStyle, threeColumn, twoColumn, verticalSpacing)


view : Html never
view =
    div []
        [ header []
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
                    [ a [ href (t GetHelpPageSlug), css [ navLinkStyle ] ]
                        [ span [] [ text (t ToGetHelpFromHelpSelfLink) ] ]
                    ]
                , li [ css navItemStyles ]
                    [ a [ href (t NotAlonePageSlug), css [ navLinkStyle ] ]
                        [ span [] [ text (t ToNotAloneFromHelpSelfLink) ] ]
                    ]
                , li [ css navItemStyles ]
                    [ a [ href (t DefinitionPageSlug), css [ navLinkStyle ] ]
                        [ span [] [ text (t ToDefinitionFromHelpSelfLink) ] ]
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
    li
        [ css
            [ cardStyle
            , withMedia [ only screen [ Media.minWidth (px 576) ] ]
                [ flex3 zero zero threeColumn ]
            ]
        ]
        [ a [ css [ blockLinkStyle ], href path ] [ div [] [ text linkName ] ]
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
