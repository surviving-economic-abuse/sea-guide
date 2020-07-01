module Page.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import String
import Theme exposing (colours, pageHeadingStyle, verticalSpacing)


view : Html never
view =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t GetHelpTitle) ]
            ]
        , div [ css [ columnStyle ] ]
            [ card (t GetHelpSection1Title) (t GetHelpSection1Quote1) (t GetHelpSection1Description) (t GetHelpSection1Link) (t SeaSurvivorForumHref)
            , card (t GetHelpSection2Title) (t GetHelpSection2Quote1) (t GetHelpSection2Description) (t GetHelpSection2Link) (t SeaMapFinancialSupportHref)
            , card (t GetHelpSection3Title) (t GetHelpSection3Quote1) (t GetHelpSection3Description) (t GetHelpSection3Link) (t SeaOrganisationsResourceHref)
            ]
        , a [ href (t HelpSelfGridPageSlug) ] [ text (t ToHelpSelfFromGetHelpLink) ]
        ]


columnStyle : Style
columnStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        ]



-- There is currently only one quote in the copy, so a second paragraph is only displayed if one is added


card : String -> String -> String -> String -> String -> Html msg
card title quote1 description linkName linkHref =
    div [ css cardStyle ]
        [ h2 []
            [ text title ]
        , verticalSpacing
        , blockquote [ css [ quoteStyle ] ]
            [ p [] [ text quote1 ] ]
        , verticalSpacing
        , p [] [ text description ]
        , verticalSpacing
        , if String.length linkHref > 0 then
            a
                [ href linkHref, css [ linkStyle ] ]
                [ span [] [ text linkName ]
                ]

          else
            div [ css [ infoStyle ] ] [ text linkName ]
        ]


cardStyle : List Style
cardStyle =
    [ batch
        [ backgroundColor colours.lightgrey
        , borderRadius (rem 1)
        , margin2 (rem 1) zero
        , maxWidth (pct 100)
        , padding (rem 1)
        , Css.width (rem 30)
        ]

    -- Allow more padding space on larger screens
    , withMedia [ only screen [ Media.minWidth (px 576) ] ]
        [ padding (rem 2) ]
    ]


quoteStyle : Style
quoteStyle =
    batch
        [ fontSize (rem 1.1)
        , fontWeight (int 300)
        ]


linkStyle : Style
linkStyle =
    batch
        [ backgroundColor colours.purple
        , Css.borderRadius (rem 0.5)
        , color colours.white
        , display block
        , padding (rem 0.5)
        , textAlign center
        , textDecoration none
        ]


infoStyle : Style
infoStyle =
    batch
        [ color colours.purple
        , fontSize (rem 1.35)
        , fontWeight (int 700)
        , textAlign center
        ]
