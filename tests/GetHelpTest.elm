module GetHelpTest exposing (suite)

import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.GetHelp exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)


suite : Test
suite =
    describe "GetHelp View"
        [ test "GetHelp view has title" <|
            \() ->
                view
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text "Get Help page" ]
        , test "GetHelp view has 1 nav link" <|
            \() ->
                view
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 1)
        , test "GetHelp view has nav link to help-self" <|
            \() ->
                view
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "help-self") ]
                    |> Query.has [ text "Find out more" ]
        ]
