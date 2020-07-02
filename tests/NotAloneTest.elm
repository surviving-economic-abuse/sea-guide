module NotAloneTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.NotAlone exposing (Msg(..), view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)


suite : Test
suite =
    describe "NotAlone View"
        [ test "NotAlone view has title" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text (t NotAloneTitle) ]
        , test "NotAlone view has 1 nav link" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 1)
        , test "NotAlone view has nav link to definition" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t DefinitionPageSlug)) ]
                    |> Query.has [ text (t ToDefinitionFromNotAloneLink) ]
        , test "When I click the Emergency button, the NotAlone page scrolls to #emergency" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "button", containing [ text (t EmergencyButton) ] ]
                    |> Event.simulate Event.click
                    |> Event.expect ScrollTo
        ]
