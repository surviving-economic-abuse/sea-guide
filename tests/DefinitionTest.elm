module DefinitionTest exposing (suite)

import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.Definition exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)


suite : Test
suite =
    describe "Definition View"
        [ test "Definition view has title" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text "[cCc] What is Economic Abuse?" ]
        , test "Definition view has 2 nav links" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "li" ]
                    |> Query.count (Expect.equal 2)
        , test "Definition view has nav link to get-help" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "get-help") ]
                    |> Query.has [ text "Get help" ]
        , test "Definition view has nav link to help-self" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "help-self") ]
                    |> Query.has [ text "Find out more" ]
        ]
