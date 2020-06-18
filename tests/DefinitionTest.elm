module DefinitionTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
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
                    |> Query.contains [ Html.text (t DefinitionTitle) ]
        , test "Definition view has 3 nav links" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 3)
        , test "Definition view has nav link to stats resource" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t StatsOnEconomicAbuseHref)) ]
                    |> Query.has [ text (t DefinitionMoreLink) ]
        , test "Definition view has nav link to get-help" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t GetHelpPageSlug)) ]
                    |> Query.has [ text (t ToGetHelpFromDefinitionLink) ]
        , test "Definition view has nav link to help-self" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t HelpSelfPageSlug)) ]
                    |> Query.has [ text (t ToHelpSelfFromDefinitionLink) ]
        ]
