module View.NotAlone exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, css, id, src, tabindex)
import Html.Styled.Attributes.Aria exposing (ariaLive)
import Html.Styled.Events exposing (onClick)
import Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed)
import Quotes exposing (open)
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (container, containerContent, green, grey, lightGreen, lightPurple, navListStyle, oneColumn, pageHeadingStyle, pureWhite, purple, shadowGrey, threeColumn, twoColumn, verticalSpacing, white, withMediaDesktop, withMediaTabletOrDesktop)


view : Bool -> Model -> Html Msg
view hasConsented model =
    div []
        [ containerContent
            [ header []
                [ h1 [ css [ pageHeadingStyle ], id "focus-target", tabindex -1 ] [ text (t NotAloneTitle) ]
                ]
            ]
        , container
            [ ul [ css [ gridStyle ], ariaLive "polite" ]
                [ card hasConsented model JourneyCard1
                , card hasConsented model JourneyCard2
                , card hasConsented model JourneyCard3
                , card hasConsented model JourneyCard4
                , card hasConsented model JourneyCard5
                , card hasConsented model JourneyCard6
                ]
            ]
        , verticalSpacing 2
        , containerContent
            [ nav [ css [ navListStyle ] ]
                [ renderNavLink Forward Definition ToDefinitionFromNotAloneLink
                ]
            ]
        , verticalSpacing 2
        ]


card : Bool -> Model -> JourneyCard -> Html Msg
card hasConsented model journeyCardPosition =
    renderCard hasConsented model journeyCardPosition


renderCard : Bool -> Model -> JourneyCard -> Html Msg
renderCard hasConsented model journeyCardPosition =
    if journeyIsRevealed model journeyCardPosition then
        renderRevealedCard hasConsented journeyCardPosition

    else
        renderInitCard hasConsented journeyCardPosition


renderInitCard : Bool -> JourneyCard -> Html Msg
renderInitCard hasConsented journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    li [ css [ cardStyle, closedStyle, backgroundImage (url (t journeyContent.image)) ] ]
        [ div [ css [ innerCardStyle ] ]
            [ h2 [ css [ teaserStyle ] ] [ text (t journeyContent.teaser) ]
            , fromUnstyled (open journeyContent.color)
            , div [ css [ greenDividerStyle ] ] []
            , button [ css [ buttonStyle ], onClick (ToggleJourney hasConsented journeyCardPosition) ]
                [ span [ css [ whiteSpace noWrap ] ] [ text (t ExpandQuoteButton) ]
                , img [ src "/Arrow.svg", alt "", css [ forwardArrowStyle ] ] []
                ]
            ]
        ]


renderRevealedCard : Bool -> JourneyCard -> Html Msg
renderRevealedCard hasConsented journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    li [ css [ cardStyle, openStyle ] ]
        [ div []
            [ button [ css [ closeJourneyButtonStyle ], onClick (ToggleJourney hasConsented journeyCardPosition) ]
                [ img [ css [ height (px 44), margin auto ], src "/Close.svg", alt (t CloseButton) ] []
                ]
            , p [ css [ quoteStyle ] ] [ text (t journeyContent.relatable) ]
            , p [ css [ quoteStyle ] ] [ text (t journeyContent.hopeful) ]
            , p [ css [ quoteStyle ] ] [ text (t journeyContent.statement) ]
            ]
        , div []
            [ div [ css [ highlightStyle ] ]
                [ p [] [ text (t ToDefinitionReassuringText) ]
                ]
            , div [ css [ padding2 zero (rem 1) ] ]
                [ renderNavLink Forward Definition ToDefinitionFromNotAloneLink
                ]
            ]
        ]


gridStyle : Style
gridStyle =
    batch
        [ displayFlex
        , flexWrap wrap
        , alignItems start
        , minHeight (px 500)
        ]


cardStyle : Style
cardStyle =
    batch
        [ flex3 zero zero oneColumn
        , margin (rem 1)
        , minHeight (px 450)
        , position relative
        , withMediaTabletOrDesktop
            [ flex3 zero zero twoColumn
            ]
        , withMediaDesktop
            [ flex3 zero zero threeColumn
            , nthOfType "3n-1"
                [ marginTop (rem 6)
                ]
            ]
        ]


closedStyle : Style
closedStyle =
    batch
        [ backgroundPosition center
        , backgroundRepeat noRepeat
        , padding (rem 2)
        ]


innerCardStyle : Style
innerCardStyle =
    batch
        [ backgroundColor pureWhite
        , borderRadius (rem 1.8)
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , padding (rem 0.5)
        , position relative
        , top (px 168)
        , textAlign center
        , minHeight (px 192)
        , displayFlex
        , flexDirection column
        , justifyContent spaceAround
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


closeJourneyButtonStyle : Style
closeJourneyButtonStyle =
    batch
        [ backgroundColor purple
        , border zero
        , borderRadius (rem 100)
        , float right
        , height (px 44)
        , marginLeft (rem 0.25)
        , marginRight (rem 1)
        , width (px 44)
        ]


teaserStyle : Style
teaserStyle =
    batch
        [ color grey
        , fontSize (px 18)
        , padding2 zero (rem 2)
        ]


greenDividerStyle : Style
greenDividerStyle =
    batch
        [ borderTop3 (px 1) solid green.colour
        , margin2 zero auto
        , width (pct 80)
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
        , marginLeft (rem 1)
        , marginRight (rem 1)
        ]


highlightStyle : Style
highlightStyle =
    batch
        [ backgroundColor lightGreen
        , margin2 (rem 1) zero
        , padding2 (rem 0.5) (rem 1)
        ]


buttonStyle : Style
buttonStyle =
    batch
        [ alignItems center
        , backgroundColor purple
        , border zero
        , borderRadius (rem 100)
        , color white
        , displayFlex
        , fontSize (rem 1)
        , fontWeight (int 700)
        , justifyContent center
        , margin2 zero auto
        , padding2 (rem 0.5) (rem 2)
        , textAlign center
        , hover
            [ backgroundColor lightPurple
            , color grey
            ]
        , transition
            [ Css.Transitions.backgroundColor 200
            , Css.Transitions.color 200
            ]
        ]


forwardArrowStyle : Style
forwardArrowStyle =
    batch
        [ height (rem 1.25)
        , marginLeft (rem 1.2)
        ]
