module View.NotAlone exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, css, src)
import Html.Styled.Events exposing (onClick)
import Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed)
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (container, containerContent, green, grey, lightGreen, lightPurple, navListStyle, oneColumn, page, pageHeadingStyle, pureWhite, purple, shadowGrey, threeColumn, twoColumn, verticalSpacing, white)


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
        [ div [ css [ innerCardStyle ] ]
            [ h2 [ css [ teaserStyle ] ] [ text (t journeyContent.teaser) ]
            , div [ css [ subTeaserStyle ] ] [ text (t ExpandQuoteReassuringText) ]
            , button [ css [ buttonStyle ], onClick (ToggleJourney journeyCardPosition) ]
                [ span [ css [ whiteSpace noWrap ] ] [ text (t ExpandQuoteButton) ]
                , img [ src "Arrow.svg", alt "", css [ forwardArrowStyle ] ] []
                ]
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
        , minHeight (px 500)
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
        [ backgroundImage (url "temp.png")
        , backgroundPosition center
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
        , top (px 192)
        , textAlign center
        , minHeight (px 192)
        , displayFlex
        , flexDirection column
        , justifyContent spaceBetween
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


teaserStyle : Style
teaserStyle =
    batch
        [ color grey
        , fontSize (px 18)
        , padding2 zero (rem 2)
        ]


subTeaserStyle : Style
subTeaserStyle =
    batch
        [ borderTop3 (px 2) solid green
        , margin auto
        , paddingTop (rem 1)
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
        , margin auto
        , minHeight (rem 3)
        , padding2 (rem 0.5) (rem 2)
        , textAlign center
        , width (pct 60)
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
