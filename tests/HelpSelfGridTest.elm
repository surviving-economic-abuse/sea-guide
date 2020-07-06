module HelpSelfGridTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Page.HelpSelfGrid exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    describe "HelpSelfGrid View"
        [ test "HelpSelfGrid view has title" <|
            \() ->
                queryFromStyledHtml view
                    |> Query.contains [ Html.text (t HelpSelfTitle) ]
        , test "HelpSelfGrid view has nav link to get-help" <|
            \() ->
                queryFromStyledHtml view
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t GetHelpPageSlug)) ]
                    |> Query.has [ text (t ToGetHelpFromHelpSelfLink) ]
        , test "HelpSelfGrid view has nav link to not-alone" <|
            \() ->
                queryFromStyledHtml view
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t NotAlonePageSlug)) ]
                    |> Query.has [ text (t ToNotAloneFromHelpSelfLink) ]
        , test "HelpSelfGrid view has nav link to definition" <|
            \() ->
                queryFromStyledHtml view
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t DefinitionPageSlug)) ]
                    |> Query.has [ text (t ToDefinitionFromHelpSelfLink) ]
        , test "HelpSelfGrid view has 8 links (5 categories, 3 navigation)" <|
            \() ->
                queryFromStyledHtml view
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 8)
        ]
