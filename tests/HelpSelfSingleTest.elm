module HelpSelfSingleTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.HelpSelfSingle exposing (view)
import Set
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)


suite : Test
suite =
    let
        initModel =
            { openResources = Set.empty }
    in
    describe "HelpSelfSingle View"
        [ test "HelpSelfSingle view has title" <|
            \() ->
                view (t HelpSelfCategory1Slug) initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text (t HelpSelfCategory1Title) ]
        , test "HelpSelfSingle view has nav link to get-help" <|
            \() ->
                view (t HelpSelfCategory1Slug) initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href ("../" ++ t HelpSelfGridPageSlug)) ]
                    |> Query.has [ text (t ToHelpSelfFromSingleCategoryLink) ]
        , test "HelpSelfSingle view can have well formed resources" <|
            \() ->
                view (t HelpSelfCategory2Slug) initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "div", containing [ text (t HelpSelfCategory2Resource1Title) ] ]
                    -- This is the 3rd div which contains the 1st resource
                    |> Query.index 2
                    |> Query.has
                        [ text (t HelpSelfCategory2Resource1Quote1)
                        , text (t HelpSelfCategory2Resource1Quote2)
                        , text (t HelpSelfCategory2Resource1Summary)
                        , text (t HelpSelfCategory2Resource1Link)
                        , attribute (Html.Attributes.href (t HelpSelfCategory2Resource1Href))
                        ]
        ]
