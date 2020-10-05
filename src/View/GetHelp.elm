module View.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id, tabindex)
import Page.GetHelp exposing (CallToAction(..))
import Route exposing (Direction(..), Route(..), renderExternalNavLink, renderNavLink)
import Theme exposing (container, grey, maxMobile, navListStyle, oneColumn, pageHeadingStyle, pink, pureWhite, purple, shadowGrey, verticalSpacing, withMediaDesktop)


view : Float -> Html never
view viewportWidth =
    div []
        [ container
            [ header []
                [ h1 [ css [ pageHeadingStyle ], id "focus-target", tabindex -1 ] [ text (t GetHelpTitle) ]
                ]
            , div [ css [ columnStyle ] ]
                [ card viewportWidth (t GetHelpSection1Title) (t GetHelpSection1Quote) (t GetHelpSection1Description) JoinForum
                , card viewportWidth (t GetHelpSection2Title) (t GetHelpSection2Quote) (t GetHelpSection2Description) CallSupport
                , card viewportWidth (t GetHelpSection3Title) (t GetHelpSection3Quote) (t GetHelpSection3Description) SeeOrgs
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

        CallSupport ->
            div [ css [ infoStyle ] ]
                [ p []
                    [ text (t GetHelpSection2CallToAction1Prompt)
                    , text " "
                    , renderPhoneNumber viewportWidth (t GetHelpSection2CallToAction1Number)
                    ]
                , p [] [ text (t GetHelpSection2CallToAction2) ]
                , verticalSpacing 1
                ]

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


card : Float -> String -> String -> String -> CallToAction -> Html msg
card viewportWidth title quote description call =
    div [ css [ cardStyle ] ]
        [ h2 [ css [ cardHeadingStyle ] ] [ text title ]
        , verticalSpacing 1.5
        , blockquote []
            [ p [ css [ quoteStyle ] ] [ text quote ] ]
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


cardHeadingStyle : Style
cardHeadingStyle =
    batch
        [ color grey
        , textAlign center
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ borderLeft3 (px 1) solid pink.colour
        , paddingLeft (rem 1)
        , before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
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
