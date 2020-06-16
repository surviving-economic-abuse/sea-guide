module NotAloneTest exposing (suite)

import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.NotAlone exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)


suite : Test
suite =
    describe "NotAlone View"
        [ test "NotAlone view has title" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text "Not Alone page" ]
        , test "NotAlone view has 1 nav link" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 1)
        , test "NotAlone view has nav link to get-help" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "definition") ]
                    |> Query.has [ text "Find out more about Economic Abuse" ]
        ]
