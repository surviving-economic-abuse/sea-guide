module View.NotAlone exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (easeOut, transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id)
import Html.Styled.Events exposing (onClick)
import Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed)
import Theme exposing (colours, gridStyle, navLinkStyle, oneColumn, pageHeadingStyle, twoColumn, verticalSpacing)


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t NotAloneTitle) ]
            , button [ onClick ScrollTo, css [ emergencyButtonStyle ] ] [ text (t EmergencyButton) ]
            ]
        , div [ css [ gridStyle ] ]
            [ card model JourneyCard1
            , card model JourneyCard2
            , card model JourneyCard3
            , card model JourneyCard4
            , card model JourneyCard5
            , card model JourneyCard6
            ]
        , verticalSpacing
        , div [ css [ emergencyContactStyle ], id "emergency" ]
            [ p [] [ text (t EmergencyReassure) ]
            , p [] [ text (t EmergencyContactInfo) ]
            ]
        ]


card : Model -> JourneyCard -> Html Msg
card model journeyCardPosition =
    div
        [ css cardStyles
        ]
        (renderCard model journeyCardPosition)


renderCard : Model -> JourneyCard -> List (Html Msg)
renderCard model journeyCardPosition =
    if journeyIsRevealed model journeyCardPosition then
        renderRevealedCard journeyCardPosition

    else
        renderInitCard journeyCardPosition


renderInitCard : JourneyCard -> List (Html Msg)
renderInitCard journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    [ p [ css [ quoteStyle ] ] [ text (t journeyContent.relatable) ]
    , div [ css [ closedStyle ] ]
        [ p [ css [ quoteStyle ] ] [ text (t journeyContent.hopeful) ]
        , p [ css [ quoteStyle ] ] [ text (t journeyContent.statement) ]
        ]
    , p [ css [ detailsStyle ] ] [ text ("- " ++ t journeyContent.name ++ ", " ++ t journeyContent.age) ]
    , verticalSpacing
    , button [ css [ continueButtonStyle ], onClick (ToggleJourney journeyCardPosition) ]
        [ span [ css [ continueTextStyle ] ] [ text (t ExpandQuoteButton) ]
        ]
    , div [ css [ closedStyle ] ]
        [ p []
            [ text (t ToDefinitionReassuringText) ]
        , a
            [ href (t DefinitionPageSlug) ]
            [ span [] [ text (t ToDefinitionFromNotAloneLink) ] ]
        ]
    ]


renderRevealedCard : JourneyCard -> List (Html msg)
renderRevealedCard journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    [ p [ css [ quoteStyle ] ] [ text (t journeyContent.relatable) ]
    , div [ css [ openStyle ] ]
        [ p [ css [ quoteStyle ] ] [ text (t journeyContent.hopeful) ]
        , p [ css [ quoteStyle ] ] [ text (t journeyContent.statement) ]
        ]
    , p [ css [ detailsStyle ] ] [ text ("- " ++ t journeyContent.name ++ ", " ++ t journeyContent.age) ]
    , div [ css [ openStyle ] ]
        [ p [ css [ reassuringStyle ] ]
            [ text (t ToDefinitionReassuringText) ]
        , a
            [ href (t DefinitionPageSlug), css [ navLinkStyle ] ]
            [ span [] [ text (t ToDefinitionFromNotAloneLink) ] ]
        ]
    ]


cardStyles : List Style
cardStyles =
    [ batch
        [ backgroundColor colours.lightgrey
        , border3 (px 1) solid colours.midgrey
        , borderRadius (rem 1)
        , flex3 zero zero oneColumn
        , height auto
        , margin (rem 1)
        , padding (rem 1)
        , textAlign left
        ]
    , withMedia [ only screen [ Media.minWidth (px 576) ] ]
        [ flex3 zero zero twoColumn
        , padding (rem 2)
        ]
    ]


closedStyle : Style
closedStyle =
    batch
        [ maxHeight zero
        , overflow hidden
        , display none
        , transition
            [ Css.Transitions.maxHeight3 0 0 easeOut
            ]
        ]


openStyle : Style
openStyle =
    batch
        [ maxHeight (px 500)
        , height auto
        , marginTop (rem 1)
        , overflow hidden
        , transition
            [ Css.Transitions.maxHeight3 1000 0 easeOut
            ]
        ]


quoteStyle : Style
quoteStyle =
    batch
        [ fontSize (rem 1.1)
        , fontWeight (int 300)
        , before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
        ]


continueButtonStyle : Style
continueButtonStyle =
    batch
        [ backgroundColor colours.lightgrey
        , border zero
        , display block
        , margin auto
        , after [ property "content" "' →'" ]
        ]


continueTextStyle : Style
continueTextStyle =
    batch
        [ textDecoration underline
        , color colours.grey
        ]


detailsStyle : Style
detailsStyle =
    batch
        [ textAlign right
        , marginInlineEnd (rem 1)
        , color colours.purple
        , fontWeight (int 700)
        ]


emergencyButtonStyle : Style
emergencyButtonStyle =
    batch
        [ backgroundColor colours.grey
        , padding2 (rem 0.5) (rem 1)
        , borderRadius (rem 0.5)
        , color colours.white
        , fontWeight (int 400)
        , margin auto
        , border zero
        ]


emergencyContactStyle : Style
emergencyContactStyle =
    batch
        [ margin auto
        , maxWidth (pct 100)
        , backgroundColor colours.grey
        , color colours.white
        , padding (rem 1)
        ]


reassuringStyle : Style
reassuringStyle =
    batch
        [ flex3 zero zero oneColumn
        , textAlign center
        , marginBottom (rem 1)
        ]
