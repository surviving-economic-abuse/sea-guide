module Page.NotAlone exposing (Model, Msg(..), update, view)

import Browser.Dom as Dom
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (easeOut, transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id)
import Html.Styled.Events exposing (onClick)
import Task
import Theme exposing (colours, gridStyle, navLinkStyle, oneColumn, pageHeadingStyle, twoColumn, verticalSpacing)


type alias Model =
    { revealedJourney : Maybe JourneyCard
    }


type Msg
    = NoOp
    | ScrollTo
    | ToggleJourney JourneyCard


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ScrollTo ->
            -- setViewport to a large number forces it to the bottom of the page
            ( model, Task.perform (always NoOp) (Dom.setViewport 0 99999) )

        ToggleJourney journeyCardPosition ->
            let
                revealedCard =
                    -- We've clicked a revealed card
                    if isRevealed model journeyCardPosition then
                        Nothing

                    else
                        Just journeyCardPosition
            in
            ( { model | revealedJourney = revealedCard }, Cmd.none )


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
    if isRevealed model journeyCardPosition then
        renderRevealedCard journeyCardPosition

    else
        renderInitCard journeyCardPosition


renderInitCard : JourneyCard -> List (Html Msg)
renderInitCard journeyCardPosition =
    let
        journeyContent =
            journeyContentFromCardPosition journeyCardPosition
    in
    [ p [ css [ relatableQuoteStyle ] ] [ text (t journeyContent.relatable) ]
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
    [ p [ css [ relatableQuoteStyle ] ] [ text (t journeyContent.relatable) ]
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


isRevealed : Model -> JourneyCard -> Bool
isRevealed model journeyCard =
    model.revealedJourney == Just journeyCard


type alias JourneyContent =
    { relatable : Key
    , hopeful : Key
    , statement : Key
    , name : Key
    , age : Key
    }



-- We have 6 cards


type JourneyCard
    = JourneyCard1
    | JourneyCard2
    | JourneyCard3
    | JourneyCard4
    | JourneyCard5
    | JourneyCard6


journeyContentFromCardPosition : JourneyCard -> JourneyContent
journeyContentFromCardPosition cardPosition =
    case cardPosition of
        JourneyCard1 ->
            { relatable = Journey1Relatable
            , hopeful = Journey1Hopeful
            , statement = Journey1Statement
            , name = Journey1Name
            , age = Journey1Age
            }

        JourneyCard2 ->
            { relatable = Journey2Relatable
            , hopeful = Journey2Hopeful
            , statement = Journey2Statement
            , name = Journey2Name
            , age = Journey2Age
            }

        JourneyCard3 ->
            { relatable = Journey3Relatable
            , hopeful = Journey3Hopeful
            , statement = Journey3Statement
            , name = Journey3Name
            , age = Journey3Age
            }

        JourneyCard4 ->
            { relatable = Journey4Relatable
            , hopeful = Journey4Hopeful
            , statement = Journey4Statement
            , name = Journey4Name
            , age = Journey4Age
            }

        JourneyCard5 ->
            { relatable = Journey5Relatable
            , hopeful = Journey5Hopeful
            , statement = Journey5Statement
            , name = Journey5Name
            , age = Journey5Age
            }

        JourneyCard6 ->
            { relatable = Journey6Relatable
            , hopeful = Journey6Hopeful
            , statement = Journey6Statement
            , name = Journey6Name
            , age = Journey6Age
            }


cardStyles : List Style
cardStyles =
    [ batch
        [ backgroundColor colours.lightgrey
        , border3 (px 1) solid colours.midgrey
        , borderRadius (rem 1)
        , flex3 zero zero oneColumn
        , height auto
        , margin (rem 1)
        , minHeight (px 540)
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
        , transition
            [ Css.Transitions.maxHeight3 0 0 easeOut
            ]
        ]


openStyle : Style
openStyle =
    batch
        [ maxHeight (px 510)
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


relatableQuoteStyle : Style
relatableQuoteStyle =
    batch
        [ fontSize (rem 1.2)
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
