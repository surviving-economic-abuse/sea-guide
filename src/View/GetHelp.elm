module View.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Page.GetHelp exposing (CallToAction(..))
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (container, grey, navListStyle, oneColumn, pageHeadingStyle, pink, pureWhite, purple, shadowGrey, verticalSpacing, white)


view : Html never
view =
    div []
        [ container
            [ header []
                [ h1 [ css [ pageHeadingStyle ] ] [ text (t GetHelpTitle) ]
                ]
            , div [ css [ columnStyle ] ]
                [ card (t GetHelpSection1Title) (t GetHelpSection1Quote) (t GetHelpSection1Description) JoinForum
                , card (t GetHelpSection2Title) (t GetHelpSection2Quote) (t GetHelpSection2Description) CallSupport
                , card (t GetHelpSection3Title) (t GetHelpSection3Quote) (t GetHelpSection3Description) SeeOrgs
                ]
            , verticalSpacing 2
            , nav [ css [ navListStyle ] ]
                [ p [ css [ reassuringStyle ] ]
                    [ text (t ToHelpSelfReassuringText) ]
                , renderNavLink Forward HelpSelfGrid ToHelpSelfFromGetHelpLink
                ]
            ]
        ]


renderCallToAction : CallToAction -> Html msg
renderCallToAction call =
    case call of
        JoinForum ->
            a
                [ href (t SeaSurvivorForumHref), css [ linkStyle ] ]
                [ span [] [ text (t GetHelpSection1CallToAction) ]
                ]

        CallSupport ->
            div [ css [ infoStyle ] ]
                [ p [] [ text (t GetHelpSection2CallToAction1) ]
                , p [] [ text (t GetHelpSection2CallToAction2) ]
                , verticalSpacing 1
                ]

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
        , flexWrap wrap
        , flexDirection column
        , justifyContent spaceBetween
        , withMedia [ only screen [ Media.minWidth (px 769) ] ]
            [ alignItems flexStart
            , flexDirection row
            , flexWrap noWrap
            ]
        ]


card : String -> String -> String -> CallToAction -> Html msg
card title quote description call =
    div [ css [ cardStyle ] ]
        [ h2 [ css [ cardHeadingStyle ] ] [ text title ]
        , verticalSpacing 1.5
        , blockquote []
            [ p [ css [ quoteStyle ] ] [ text quote ] ]
        , verticalSpacing 1
        , p [] [ text description ]
        , verticalSpacing 1.5
        , renderCallToAction call
        ]


cardStyle : Style
cardStyle =
    batch
        [ backgroundColor pureWhite
        , borderRadius (rem 2.5)
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , margin (rem 1)
        , maxWidth (rem 22)
        , padding (rem 1)
        , withMedia [ only screen [ Media.minWidth (px 769) ] ]
            [ flexDirection row
            , margin2 zero (rem 0.5)
            , flex3 zero (int 1) (rem 22)
            ]
        ]


cardHeadingStyle : Style
cardHeadingStyle =
    batch
        [ color grey
        , textAlign center
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ borderLeft3 (px 1) solid pink
        , paddingLeft (rem 1)
        , before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
        ]


linkStyle : Style
linkStyle =
    batch
        [ backgroundColor purple
        , borderRadius (rem 0.5)
        , color white
        , display block
        , padding (rem 0.5)
        , textAlign center
        , textDecoration none
        , hover
            [ backgroundColor purple
            ]
        ]


infoStyle : Style
infoStyle =
    batch
        [ color purple
        , fontSize (rem 1.1)
        ]


reassuringStyle : Style
reassuringStyle =
    batch
        [ flex3 zero zero oneColumn
        , textAlign center
        , marginBottom (rem 1)
        ]
