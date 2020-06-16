module HelpSelfTest exposing (suite)

import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.HelpSelf exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)


suite : Test
suite =
    describe "HelpSelf View"
        [ test "HelpSelf view has title" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text "Help Self page - grid and singles" ]
        , test "HelpSelf view has 3 nav links" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 3)
        , test "HelpSelf view has nav link to get-help" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "get-help") ]
                    |> Query.has [ text "Get Help" ]
        , test "HelpSelf view has nav link to not-alone" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "not-alone") ]
                    |> Query.has [ text "Read about others" ]
        , test "HelpSelf view has nav link to definition" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "definition") ]
                    |> Query.has [ text "What is Economic Abuse" ]
        ]
