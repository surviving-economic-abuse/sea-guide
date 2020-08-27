module View.NotAlone exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (easeOut, transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed)
import Route exposing (Direction(..), Route(..), renderNavLink, toString)
import Theme exposing (container, containerContent, grey, lightGreen, lightGrey, navListStyle, oneColumn, page, pageHeadingStyle, pureWhite, shadowGrey, threeColumn, twoColumn, verticalSpacing)


view : Model -> Html Msg
view model =
    page
        [ containerContent
            [ header []
                [ h1 [ css [ pageHeadingStyle ] ] [ text (t NotAloneTitle) ]
                ]
            ]
        , container
            [ ul [ css [ gridStyle ] ]
                [ card model JourneyCard1
                , card model JourneyCard2
                , card model JourneyCard3
                , card model JourneyCard4
                , card model JourneyCard5
                , card model JourneyCard6
                ]
            ]
        , verticalSpacing
        , containerContent
            [ nav [ css [ navListStyle ] ]
                [ renderNavLink Forward Definition ToDefinitionFromNotAloneLink
                ]
            ]
        , containerContent
            []
        ]


card : Model -> JourneyCard -> Html Msg
card model journeyCardPosition =
    renderCard model journeyCardPosition


renderCard : Model -> JourneyCard -> Html Msg
renderCard model journeyCardPosition =
    if journeyIsRevealed model journeyCardPosition then
        renderRevealedCard journeyCardPosition

    else
        renderInitCard journeyCardPosition


renderInitCard : JourneyCard -> Html Msg
renderInitCard journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    li [ css [ cardStyle, closedStyle ] ]
        [ p [ css [] ] [ text (t journeyContent.teaser) ]
        , verticalSpacing
        , button [ css [ continueButtonStyle ], onClick (ToggleJourney journeyCardPosition) ]
            [ span [ css [ continueTextStyle ] ] [ text (t ExpandQuoteButton) ]
            ]
        , div [ css [] ]
            [ p []
                [ text (t ToDefinitionReassuringText) ]
            , a
                [ href (Route.toString Definition) ]
                [ span [] [ text (t ToDefinitionFromNotAloneLink) ] ]
            ]
        ]


renderRevealedCard : JourneyCard -> Html msg
renderRevealedCard journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    li [ css [ cardStyle, openStyle ] ]
        [ div []
            [ p [ css [ quoteStyle ] ] [ text (t journeyContent.relatable) ]
            , p [ css [ quoteStyle ] ] [ text (t journeyContent.hopeful) ]
            , p [ css [ quoteStyle ] ] [ text (t journeyContent.statement) ]
            ]
        , div
            []
            [ div [ css [ highlightStyle ] ]
                [ p [] [ text (t ToDefinitionReassuringText) ]
                ]
            , div [ css [ padding2 zero (rem 1) ] ]
                [ renderNavLink Forward Definition ToHelpSelfFromGetHelpLink
                ]
            ]
        ]


gridStyle : Style
gridStyle =
    batch
        [ displayFlex
        , flexWrap wrap
        , alignItems start
        , minHeight (px 620)
        ]


cardStyle : Style
cardStyle =
    batch
        [ flex3 zero zero oneColumn
        , margin (rem 1)
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ flex3 zero zero twoColumn
            , withMedia [ only screen [ Media.minWidth (px 769) ] ]
                [ flex3 zero zero threeColumn
                ]
            ]
        ]


closedStyle : Style
closedStyle =
    batch
        [ backgroundColor (hex "888")
            , height (px 650)
        ]


openStyle : Style
openStyle =
    batch
        [ backgroundColor pureWhite
        , borderRadius (rem 2.5)
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , paddingTop (rem 1)
        , paddingBottom (rem 1)
        , displayFlex
        , flexDirection column
        , justifyContent spaceBetween
        , alignSelf center
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
        , marginLeft (rem 1)
        , marginRight (rem 1)
        ]


continueButtonStyle : Style
continueButtonStyle =
    batch
        [ backgroundColor lightGrey
        , border zero
        , display block
        , margin auto
        , after [ property "content" "' →'" ]
        ]


continueTextStyle : Style
continueTextStyle =
    batch
        [ textDecoration underline
        , color grey
        ]


highlightStyle : Style
highlightStyle =
    batch
        [ backgroundColor lightGreen
        , margin2 (rem 1) zero
        , padding2 (rem 0.5) (rem 1)
        ]
