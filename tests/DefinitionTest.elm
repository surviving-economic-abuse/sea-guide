module DefinitionTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Page.Definition exposing (Msg(..), update)
import PageTemplate exposing (page)
import Set
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)
import TestUtils exposing (queryFromStyledHtml)
import View.Definition exposing (view)


suite : Test
suite =
    let
        initModel =
            { openCategories = Set.empty }

        definition2expandedModel =
            { openCategories = Set.fromList [ t DefinitionCategory2Title ] }

        stringPartialToFirstSquareBracket text =
            Maybe.withDefault text (List.head (String.split "[" text))

        pageViewInitModel =
            page (view initModel)
    in
    describe "Definition Page"
        [ describe "View tests"
            [ test "Definition view has title" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.contains [ Html.text (t DefinitionTitle) ]
            , test "Definition view has 5 nav links (2 navigation, 3 emergency)" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.findAll [ tag "a" ]
                        |> Query.count (Expect.equal 5)
            , test "Definition view has nav link to get-help" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.find [ tag "nav", containing [ tag "a", attribute (Html.Attributes.href (t GetHelpPageSlug)) ] ]
                        |> Query.has [ text (t ToGetHelpFromDefinitionLink) ]
            , test "Definition view has nav link to help-self" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.find [ tag "a", attribute (Html.Attributes.href (t HelpSelfGridPageSlug)) ]
                        |> Query.has [ text (t ToHelpSelfFromDefinitionLink) ]
            , test "Definition view has 6 category expander buttons" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.findAll
                            [ tag "button"
                            , containing
                                [ tag "h2"
                                ]
                            ]
                        |> Query.count (Expect.equal 6)
            , test "An open expander shows definition info and quotes" <|
                \() ->
                    queryFromStyledHtml (page (view definition2expandedModel))
                        |> Query.find
                            [ tag "div"
                            , containing
                                [ tag "div"
                                , containing [ tag "button", containing [ text (t DefinitionCategory2Title) ] ]
                                ]
                            ]
                        |> Query.has
                            [ text (stringPartialToFirstSquareBracket (t DefinitionCategory2Info))
                            , text (stringPartialToFirstSquareBracket (t DefinitionCategory2Quote1))
                            , text (stringPartialToFirstSquareBracket (t DefinitionCategory2Quote2))
                            ]
            , test "An open expander does not show info for a different category" <|
                \() ->
                    queryFromStyledHtml (page (view definition2expandedModel))
                        |> Query.find
                            [ tag "div"
                            , containing [ tag "button", containing [ text (t DefinitionCategory2Title) ] ]
                            ]
                        |> Query.hasNot
                            [ text (stringPartialToFirstSquareBracket (t DefinitionCategory3Info))
                            ]
            , test "I can toggle a closed expander" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.find
                            [ tag "button"
                            , containing [ text (t DefinitionCategory2Title) ]
                            ]
                        |> Event.simulate Event.click
                        |> Event.expect (ToggleCategory DefinitionCategory2Title)
            , test "I can toggle an open expander" <|
                \() ->
                    queryFromStyledHtml (page (view definition2expandedModel))
                        |> Query.find
                            [ tag "button"
                            , containing [ text (t DefinitionCategory2Title) ]
                            ]
                        |> Event.simulate Event.click
                        |> Event.expect (ToggleCategory DefinitionCategory2Title)
            , test "When all expanders closed, I cannot see info and quotes" <|
                \() ->
                    queryFromStyledHtml pageViewInitModel
                        |> Query.findAll
                            [ tag "dl" ]
                        |> Query.each
                            (Expect.all
                                -- Look for title and one arbitrary item from each of the categories
                                [ Query.has [ text (t DefinitionCategory1Title) ]
                                , Query.hasNot [ text (t DefinitionCategory1Info) ]
                                , Query.has [ text (t DefinitionCategory2Title) ]
                                , Query.hasNot [ text (t DefinitionCategory2Quote1) ]
                                , Query.has [ text (t DefinitionCategory3Title) ]
                                , Query.hasNot [ text (t DefinitionCategory3Quote2) ]
                                , Query.has [ text (t DefinitionCategory4Title) ]
                                , Query.hasNot [ text (t DefinitionCategory4Quote2) ]
                                , Query.has [ text (t DefinitionCategory5Title) ]
                                , Query.hasNot [ text (t DefinitionCategory5Info) ]
                                ]
                            )
            ]
        , describe "Update tests"
            [ test "Toggling a closed category adds it to the set of openCategories" <|
                \() ->
                    initModel
                        |> update (ToggleCategory DefinitionCategory1Title)
                        |> Expect.equal
                            ( { openCategories = Set.fromList [ t DefinitionCategory1Title ] }
                            , Cmd.none
                            )
            , test "Toggling an open category removes it from the set of openCategories" <|
                \() ->
                    { initModel
                        | openCategories = Set.insert (t DefinitionCategory1Title) initModel.openCategories
                    }
                        |> update (ToggleCategory DefinitionCategory1Title)
                        |> Expect.equal
                            ( { openCategories = Set.empty }
                            , Cmd.none
                            )
            ]
        ]
