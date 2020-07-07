module Page.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, navItemStyles, navLinkStyle, navListStyle, oneColumn, pageHeadingStyle, verticalSpacing)


view : Html never
view =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t GetHelpTitle) ]
            ]
        , div [ css [ columnStyle ] ]
            [ card (t GetHelpSection1Title) (t GetHelpSection1Quote) (t GetHelpSection1Description) JoinForum
            , card (t GetHelpSection2Title) (t GetHelpSection2Quote) (t GetHelpSection2Description) CallSupport
            , card (t GetHelpSection3Title) (t GetHelpSection3Quote) (t GetHelpSection3Description) SeeOrgs
            ]
        , verticalSpacing
        , nav [ css [ navListStyle ] ]
            [ p [ css [ reassuringStyle ] ]
                [ text (t ToHelpSelfReassuringText) ]
            , a
                [ href (t HelpSelfGridPageSlug), css (navLinkStyle :: navItemStyles) ]
                [ span [] [ text (t ToHelpSelfFromGetHelpLink) ] ]
            ]
        ]


type CallToAction
    = JoinForum
    | CallSupport
    | SeeOrgs


renderCallToAction : CallToAction -> Html msg
renderCallToAction call =
    case call of
        JoinForum ->
            a
                [ href (t SeaSurvivorForumHref), css [ linkStyle ] ]
                [ span [] [ text (t GetHelpSection1CallToAction) ]
                ]

        CallSupport ->
            div [ css [ infoStyle ] ] [ text (t GetHelpSection2CallToAction) ]

        SeeOrgs ->
            a
                [ href (t SeaOrganisationsResourceHref), css [ linkStyle ] ]
                [ span [] [ text (t GetHelpSection3CallToAction) ]
                ]


columnStyle : Style
columnStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        ]


card : String -> String -> String -> CallToAction -> Html msg
card title quote description call =
    div [ css cardStyle ]
        [ h2 []
            [ text title ]
        , verticalSpacing
        , blockquote []
            [ p [ css [ quoteStyle ] ] [ text quote ] ]
        , verticalSpacing
        , p [] [ text description ]
        , verticalSpacing
        , renderCallToAction call
        ]


cardStyle : List Style
cardStyle =
    [ batch
        [ backgroundColor colours.lightgrey
        , border3 (px 1) solid colours.midgrey
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
        [ borderLeft3 (px 5) solid colours.midgrey
        , borderRadius (px 5)
        , fontSize (rem 1.1)
        , fontStyle italic
        , fontWeight (int 300)
        , paddingLeft (px 10)
        , before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
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


reassuringStyle : Style
reassuringStyle =
    batch
        [ flex3 zero zero oneColumn
        , textAlign center
        , marginBottom (rem 1)
        ]
