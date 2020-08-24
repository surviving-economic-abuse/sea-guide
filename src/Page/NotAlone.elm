module Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed, update)

import Browser.Dom as Dom
import Copy.Keys exposing (Key(..))
import Task


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
                    if journeyIsRevealed model journeyCardPosition then
                        Nothing

                    else
                        Just journeyCardPosition
            in
            ( { model | revealedJourney = revealedCard }, Cmd.none )


journeyIsRevealed : Model -> JourneyCard -> Bool
journeyIsRevealed model journeyCard =
    model.revealedJourney == Just journeyCard


type alias JourneyContent =
    { teaser : Key
    , relatable : Key
    , hopeful : Key
    , statement : Key
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
            { teaser = Journey1Teaser
            , relatable = Journey1Relatable
            , hopeful = Journey1Hopeful
            , statement = Journey1Statement
            }

        JourneyCard2 ->
            { teaser = Journey2Teaser
            , relatable = Journey2Relatable
            , hopeful = Journey2Hopeful
            , statement = Journey2Statement
            }

        JourneyCard3 ->
            { teaser = Journey4Teaser
            , relatable = Journey3Relatable
            , hopeful = Journey3Hopeful
            , statement = Journey3Statement
            }

        JourneyCard4 ->
            { teaser = Journey4Teaser
            , relatable = Journey4Relatable
            , hopeful = Journey4Hopeful
            , statement = Journey4Statement
            }

        JourneyCard5 ->
            { teaser = Journey5Teaser
            , relatable = Journey5Relatable
            , hopeful = Journey5Hopeful
            , statement = Journey5Statement
            }

        JourneyCard6 ->
            { teaser = Journey6Teaser
            , relatable = Journey6Relatable
            , hopeful = Journey6Hopeful
            , statement = Journey6Statement
            }
