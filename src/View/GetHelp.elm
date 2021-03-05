module View.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, css, href, id, src, tabindex)
import Page.GetHelp exposing (CallToAction(..))
import Quotes exposing (close, open)
import Route exposing (Direction(..), Route(..), renderExternalNavLink, renderNavLink)
import Theme exposing (container, green, grey, maxMobile, navListStyle, oneColumn, pageHeadingStyle, pink, pureWhite, purple, shadowGrey, teal, verticalSpacing, withMediaDesktop)


view : Float -> Html never
view viewportWidth =
    div []
        [ container
            [ header []
                [ h1 [ css [ pageHeadingStyle ], id "focus-target", tabindex -1 ] [ text (t GetHelpTitle) ]
                ]
            , div [ css [ columnStyle ] ]
                [ card viewportWidth (t GetHelpSection1Title) (t GetHelpSection1Icon) (t GetHelpSection1Quote) green.string (t GetHelpSection1Description) JoinForum
                , card viewportWidth (t GetHelpSection2Title) (t GetHelpSection2Icon) (t GetHelpSection2Quote) pink.string (t GetHelpSection2Description) ContactSupport
                , card viewportWidth (t GetHelpSection3Title) (t GetHelpSection3Icon) (t GetHelpSection3Quote) teal.string (t GetHelpSection3Description) SeeOrgs
                ]
            , verticalSpacing 2
            , nav [ css [ navListStyle ] ]
                [ p [ css [ reassuringStyle ] ]
                    [ text (t ToHelpSelfReassuringText) ]
                , renderNavLink None HelpSelfGrid ToHelpSelfFromGetHelpLink
                ]
            ]
        , verticalSpacing 2
        ]


renderCallToAction : Float -> CallToAction -> Html msg
renderCallToAction viewportWidth call =
    case call of
        JoinForum ->
            renderExternalNavLink SeaSurvivorForumHref GetHelpSection1CallToAction

        ContactSupport ->
            renderExternalNavLink FinancialSupportLineHref GetHelpSection2CallToAction

        SeeOrgs ->
            renderExternalNavLink SeaOrganisationsResourceHref GetHelpSection3CallToAction


renderPhoneNumber : Float -> String -> Html msg
renderPhoneNumber viewportWidth phoneNumber =
    if viewportWidth <= maxMobile then
        a [ href ("tel:" ++ String.replace " " "" phoneNumber) ] [ text phoneNumber ]

    else
        text phoneNumber


columnStyle : Style
columnStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexWrap wrap
        , flexDirection column
        , justifyContent spaceBetween
        , withMediaDesktop
            [ alignItems flexStart
            , flexDirection row
            , flexWrap noWrap
            ]
        ]



-- This function is a little bit eek!


card : Float -> String -> String -> String -> String -> String -> CallToAction -> Html msg
card viewportWidth title icon quote quoteColour description call =
    div [ css [ cardStyle ] ]
        [ img [ src icon, alt "", css [ iconStyle ] ] []
        , h2 [ css [ cardHeadingStyle ] ] [ text title ]
        , verticalSpacing 1
        , div [ css [ displayFlex, alignItems flexStart ] ]
            [ open quoteColour [ flex3 (int 0) (int 0) (rem 1.5), height (rem 1.5) ]
            , blockquote [ css [ quoteStyle ] ] [ text quote ]
            , close quoteColour [ flex3 (int 0) (int 0) (rem 1.5), height (rem 1.5) ]
            ]
        , verticalSpacing 1
        , p [] [ text description ]
        , verticalSpacing 1.5
        , renderCallToAction viewportWidth call
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
        , withMediaDesktop
            [ flexDirection row
            , margin2 zero (rem 0.5)
            , flex3 zero (int 1) (rem 22)
            ]
        ]


iconStyle : Style
iconStyle =
    batch
        [ float left
        , height (rem 2)
        , verticalAlign top
        , width (rem 2)
        ]


cardHeadingStyle : Style
cardHeadingStyle =
    batch
        [ color grey
        , display inlineBlock
        , textAlign center
        , width (calc (pct 100) minus (rem 2.5))
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ padding2 zero (rem 0.5)
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
        , width (pct 100)
        ]
