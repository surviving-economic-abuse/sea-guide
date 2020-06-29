module DefinitionTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.Definition exposing (view)
import Set
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)


suite : Test
suite =
    let
        initModel =
            { openCategories = Set.empty }
    in
    describe "Definition View"
        [ test "Definition view has title" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text (t DefinitionTitle) ]
        , test "Definition view has 3 nav links" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 3)
        , test "Definition view has nav link to stats resource" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t StatsOnEconomicAbuseHref)) ]
                    |> Query.has [ text (t DefinitionMoreLink) ]
        , test "Definition view has nav link to get-help" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t GetHelpPageSlug)) ]
                    |> Query.has [ text (t ToGetHelpFromDefinitionLink) ]
        , test "Definition view has nav link to help-self" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t HelpSelfGridPageSlug)) ]
                    |> Query.has [ text (t ToHelpSelfFromDefinitionLink) ]
        , test "Definition view has 5 category expander buttons" <|
            \() ->
                view initModel
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "button" ]
                    |> Query.count (Expect.equal 5)
        , test "An open expander shows definition info and quotes" <|
            \() ->
                view
                    { initModel
                        | openCategories = Set.insert (t DefinitionCategory2Title) initModel.openCategories
                    }
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find
                        [ tag "li"
                        , containing [ tag "button", containing [ text (t DefinitionCategory2Title) ] ]
                        ]
                    |> Query.has
                        [ text (t DefinitionCategory2Info)
                        , text (t DefinitionCategory2Quote1)
                        , text (t DefinitionCategory2Quote2)
                        , text (t DefinitionCategory2Quote3)
                        ]
        , test "An open expander does not show info for a different category" <|
            \() ->
                view { initModel | openCategories = Set.insert (t DefinitionCategory2Title) initModel.openCategories }
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find
                        [ tag "li"
                        , containing [ tag "button", containing [ text (t DefinitionCategory2Title) ] ]
                        ]
                    |> Query.hasNot
                        -- Kind of arbitrary, not very useful test
                        [ text (t DefinitionCategory1Info)
                        ]

        --, test "I can toggle an expander"
        --, test "When all expanders closed, I cannot see info and quotes"
        --, test "I can open more than one expander at a time"
        ]
