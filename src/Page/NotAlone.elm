module Page.NotAlone exposing (JourneyCard(..), Model, Msg(..), journeyContentFromCardPosition, journeyIsRevealed, update)

import Browser.Dom as Dom
import Copy.Keys exposing (Key(..))
import Task


type alias Model =
    { revealedJourney : Maybe JourneyCard }


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
