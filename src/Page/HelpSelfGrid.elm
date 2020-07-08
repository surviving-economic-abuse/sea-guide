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
            [ infoLink (t HelpSelfCategory1Link) (t HelpSelfCategory1Slug)
            , infoLink (t HelpSelfCategory2Link) (t HelpSelfCategory2Slug)
            , infoLink (t HelpSelfCategory3Link) (t HelpSelfCategory3Slug)
            , infoLink (t HelpSelfCategory4Link) (t HelpSelfCategory4Slug)
            , infoLink (t HelpSelfCategory5Link) (t HelpSelfCategory5Slug)
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
    li [ css [ gridItemStyle ] ]
        [ a
            [ css [ gridCardStyle ], href path ]
            [ span [] [ text linkName ] ]
        ]


gridCardStyle : Style
gridCardStyle =
    batch
        [ backgroundColor colours.lightgrey
        , border3 (px 1) solid colours.midgrey
        , borderRadius (rem 1)
        , color colours.purple
        , displayFlex
        , flexDirection column
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , justifyContent center
        , minHeight (px 150)
        , textAlign center
        , textDecoration none
        , hover
            [ borderColor colours.purple
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
