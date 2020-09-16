module Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed, update)

import Analytics exposing (updateAnalytics, updateAnalyticsEvent)
import Browser.Dom as Dom
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Task
import Theme exposing (green, orange, pink)


type alias Model =
    { revealedJourney : Maybe JourneyCard
    }


type Msg
    = NoOp
    | ScrollTo
    | ToggleJourney Bool JourneyCard


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ScrollTo ->
            -- setViewport to a large number forces it to the bottom of the page
            ( model, Task.perform (always NoOp) (Dom.setViewport 0 99999) )

        ToggleJourney hasConsented journeyCardPosition ->
            let
                revealedCardData =
                    -- We've clicked a revealed card
                    if journeyIsRevealed model journeyCardPosition then
                        { action = "closed"
                        , position = Nothing
                        }

                    else
                        { action = "opened"
                        , position = Just journeyCardPosition
                        }
            in
            ( { model | revealedJourney = revealedCardData.position }
            , updateAnalytics hasConsented
                (updateAnalyticsEvent
                    { category = "survivor-story"
                    , action = revealedCardData.action
                    , label = labelFromCardPosition journeyCardPosition
                    }
                )
            )


journeyIsRevealed : Model -> JourneyCard -> Bool
journeyIsRevealed model journeyCard =
    model.revealedJourney == Just journeyCard


type alias JourneyContent =
    { teaser : Key
    , image : Key
    , relatable : Key
    , hopeful : Key
    , statement : Key
    , color : String
    }



-- We have 6 cards


type JourneyCard
    = JourneyCard1
    | JourneyCard2
    | JourneyCard3
    | JourneyCard4
    | JourneyCard5
    | JourneyCard6


labelFromCardPosition : JourneyCard -> String
labelFromCardPosition cardPosition =
    t (journeyContentFromCardPosition cardPosition).teaser


journeyContentFromCardPosition : JourneyCard -> JourneyContent
journeyContentFromCardPosition cardPosition =
    case cardPosition of
        JourneyCard1 ->
            { teaser = Journey1Teaser
            , image = Journey1Image
            , relatable = Journey1Relatable
            , hopeful = Journey1Hopeful
            , statement = Journey1Statement
            , color = pink.string
            }

        JourneyCard2 ->
            { teaser = Journey2Teaser
            , image = Journey2Image
            , relatable = Journey2Relatable
            , hopeful = Journey2Hopeful
            , statement = Journey2Statement
            , color = green.string
            }

        JourneyCard3 ->
            { teaser = Journey3Teaser
            , image = Journey3Image
            , relatable = Journey3Relatable
            , hopeful = Journey3Hopeful
            , statement = Journey3Statement
            , color = orange.string
            }

        JourneyCard4 ->
            { teaser = Journey4Teaser
            , image = Journey4Image
            , relatable = Journey4Relatable
            , hopeful = Journey4Hopeful
            , statement = Journey4Statement
            , color = green.string
            }

        JourneyCard5 ->
            { teaser = Journey5Teaser
            , image = Journey5Image
            , relatable = Journey5Relatable
            , hopeful = Journey5Hopeful
            , statement = Journey5Statement
            , color = orange.string
            }

        JourneyCard6 ->
            { teaser = Journey6Teaser
            , image = Journey6Image
            , relatable = Journey6Relatable
            , hopeful = Journey6Hopeful
            , statement = Journey6Statement
            , color = pink.string
            }
