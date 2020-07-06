module NotAloneTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.NotAlone exposing (Msg(..), view)
import Test exposing (Test, describe, test, todo)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, id, tag, text)


suite : Test
suite =
    let
        initModel =
            { revealedJourney = Nothing }
    in
    describe "NotAlone View"
        [ test "NotAlone view has title" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text (t NotAloneTitle) ]
        , test "NotAlone view has 7 nav links" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 7)
        , test "NotAlone view has nav links to definition" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a", attribute (Html.Attributes.href (t DefinitionPageSlug)) ]
                    |> Query.each (Query.has [ text (t ToDefinitionFromNotAloneLink) ])
        , test "NotAlone view has emergency contact information" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ id "emergency" ]
                    |> Query.has
                        [ tag "p"
                        , containing [ text (t EmergencyReassure) ]
                        , tag "p"
                        , containing [ text (t EmergencyContactInfo) ]
                        ]
        , test "When I click the Emergency button, the NotAlone page scrolls to #emergency" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "button", containing [ text (t EmergencyButton) ] ]
                    |> Event.simulate Event.click
                    |> Event.expect ScrollTo

        -- todo "I can toggle journey content from hidden to revealed"
        -- todo "I can toggle journey content from revealed to hidden"
        -- todo "More coverage?"
        ]
