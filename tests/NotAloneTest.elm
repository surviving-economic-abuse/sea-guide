module NotAloneTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Page.NotAlone exposing (Msg(..), view)
import Test exposing (Test, describe, test, todo)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, id, tag, text)
import TestUtils exposing (..)


suite : Test
suite =
    let
        initModel =
            { revealedJourney = Nothing }
    in
    describe "NotAlone View"
        [ test "NotAlone view has title" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.contains [ Html.text (t NotAloneTitle) ]
        , test "NotAlone view has 1 nav link" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 1)
        , test "NotAlone view has nav link to definition" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t DefinitionPageSlug)) ]
                    |> Query.has [ text (t ToDefinitionFromNotAloneLink) ]
        , test "NotAlone view has emergency contact information" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.find [ id "emergency" ]
                    |> Query.has
                        [ tag "p"
                        , containing [ text (t EmergencyReassure) ]
                        , tag "p"
                        , containing [ text (t EmergencyContactInfo) ]
                        ]
        , test "When I click the Emergency button, the NotAlone page scrolls to #emergency" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.find [ tag "button", containing [ text (t EmergencyButton) ] ]
                    |> Event.simulate Event.click
                    |> Event.expect ScrollTo

        -- todo "I can toggle journey content from hidden to revealed"
        -- todo "I can toggle journey content from revealed to hidden"
        -- todo "More coverage?"
        ]
