module Page.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, pageHeadingStyle)


view : Html never
view =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t GetHelpTitle) ]
            ]
        , div [ css [ columnStyle ] ]
            [ card (t GetHelpSection1Title) (t GetHelpSection1Link) (t SeaSurvivorForumHref)
            , card (t GetHelpSection2Title) (t GetHelpSection2Link) (t SeaMapFinancialSupportHref)
            , card (t GetHelpSection3Title) (t GetHelpSection3Link) (t SeaOrganisationsResourceHref)
            ]
        , a [ href (t HelpSelfPageSlug) ] [ text (t ToHelpSelfFromGetHelpLink) ]
        ]


columnStyle : Style
columnStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        ]


card : String -> String -> String -> Html msg
card title linkName linkHref =
    div [ css [ cardStyle ] ]
        [ h2 []
            [ text title ]
        , a
            [ href linkHref ]
            [ text linkName ]
        ]


cardStyle : Style
cardStyle =
    batch
        [ border3 (px 2) solid Theme.colours.grey
        , borderRadius (rem 1)
        , maxWidth (pct 100)
        , Css.width (rem 24)
        , padding (rem 1)
        , margin2 (rem 1) zero
        ]
