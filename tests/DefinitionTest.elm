module DefinitionTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.Definition exposing (Msg(..), view)
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
    describe "Definition Page"
        [ describe "View tests"
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
                        |> Query.hasNot
                            -- This tests that all of them are not there - so if one were, it would still pass
                            -- A better test might use Query.each or a single item
                            [ text (t DefinitionCategory1Info)
                            , text (t DefinitionCategory3Info)
                            , text (t DefinitionCategory4Info)
                            , text (t DefinitionCategory5Info)
                            ]
            , test "I can toggle a closed expander" <|
                \() ->
                    view initModel
                        |> Html.Styled.toUnstyled
                        |> Query.fromHtml
                        |> Query.find
                            [ tag "button"
                            , containing [ text (t DefinitionCategory2Title) ]
                            ]
                        |> Event.simulate Event.click
                        |> Event.expect (ToggleCategory DefinitionCategory2Title)
            , test "I can toggle an open expander" <|
                \() ->
                    view
                        { initModel
                            | openCategories = Set.insert (t DefinitionCategory2Title) initModel.openCategories
                        }
                        |> Html.Styled.toUnstyled
                        |> Query.fromHtml
                        |> Query.find
                            [ tag "button"
                            , containing [ text (t DefinitionCategory2Title) ]
                            ]
                        |> Event.simulate Event.click
                        |> Event.expect (ToggleCategory DefinitionCategory2Title)
            , test "When all expanders closed, I cannot see info and quotes" <|
                \() ->
                    view initModel
                        |> Html.Styled.toUnstyled
                        |> Query.fromHtml
                        |> Query.findAll
                            [ tag "ul"

                            -- Use an arbitrary button to find the right ul
                            , containing [ tag "button", containing [ text (t DefinitionCategory2Title) ] ]
                            ]
                        |> Query.each
                            (Expect.all
                                -- Look for title and one arbitray item from each of the categories
                                [ Query.has [ text (t DefinitionCategory1Title) ]
                                , Query.hasNot [ text (t DefinitionCategory1Info) ]
                                , Query.has [ text (t DefinitionCategory2Title) ]
                                , Query.hasNot [ text (t DefinitionCategory2Quote1) ]
                                , Query.has [ text (t DefinitionCategory3Title) ]
                                , Query.hasNot [ text (t DefinitionCategory3Quote2) ]
                                , Query.has [ text (t DefinitionCategory4Title) ]
                                , Query.hasNot [ text (t DefinitionCategory4Quote3) ]
                                , Query.has [ text (t DefinitionCategory5Title) ]
                                , Query.hasNot [ text (t DefinitionCategory5Info) ]
                                ]
                            )
            ]
        , describe "Update tests"
            [ test "Toggling a closed category adds it to the set of openCategories" <|
                \() ->
                    initModel
                        |> Page.Definition.update (ToggleCategory DefinitionCategory1Title)
                        |> Expect.equal
                            ( { openCategories = Set.fromList [ t DefinitionCategory1Title ] }
                            , Cmd.none
                            )
            , test "Toggling an open category removes it from the set of openCategories" <|
                \() ->
                    { initModel
                        | openCategories = Set.insert (t DefinitionCategory1Title) initModel.openCategories
                    }
                        |> Page.Definition.update (ToggleCategory DefinitionCategory1Title)
                        |> Expect.equal
                            ( { openCategories = Set.empty }
                            , Cmd.none
                            )
            ]
        ]
