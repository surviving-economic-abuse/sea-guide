module HelpSelfSingleTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.HelpSelfSingle exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)


suite : Test
suite =
    describe "HelpSelfSingle View"
        [ test "HelpSelfSingle view has title" <|
            \() ->
                view (t HelpSelfCategory1Slug) {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text (t HelpSelfCategory1Title) ]
        , test "HelpSelfSingle view has nav link to get-help" <|
            \() ->
                view (t HelpSelfCategory1Slug) {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href ("../" ++ t HelpSelfGridPageSlug)) ]
                    |> Query.has [ text (t ToHelpSelfFromSingleCategoryLink) ]
        ]
