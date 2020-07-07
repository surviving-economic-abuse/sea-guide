module HelpSelfSingleTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Page.HelpSelfSingle exposing (Msg(..), update, view)
import Set
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        initModel =
            { openResources = Set.empty }

        resource2expandedModel =
            { openResources = Set.fromList [ t HelpSelfCategory2Resource1Title ] }
    in
    describe "HelpSelfSingle View"
        [ describe "View tests"
            [ test "HelpSelfSingle view has title" <|
                \() ->
                    queryFromStyledHtml (view (t HelpSelfCategory1Slug) initModel)
                        |> Query.contains [ Html.text (t HelpSelfCategory1Title) ]
            , test "HelpSelfSingle view has nav link to get-help" <|
                \() ->
                    queryFromStyledHtml (view (t HelpSelfCategory1Slug) initModel)
                        |> Query.find [ tag "a", attribute (Html.Attributes.href ("../" ++ t HelpSelfGridPageSlug)) ]
                        |> Query.has [ text (t ToHelpSelfFromSingleCategoryLink) ]
            , test "HelpSelfSingle view can have well formed resources" <|
                \() ->
                    queryFromStyledHtml (view (t HelpSelfCategory2Slug) resource2expandedModel)
                        |> Query.find [ tag "li", containing [ text (t HelpSelfCategory2Resource1Title) ] ]
                        |> Query.has
                            [ text (t HelpSelfCategory2Resource1Quote1)
                            , text (t HelpSelfCategory2Resource1Quote2)
                            , text (t HelpSelfCategory2Resource1Summary)
                            , text (t HelpSelfCategory2Resource1Link)
                            , attribute (Html.Attributes.href (t HelpSelfCategory2Resource1Href))
                            ]
            ]
        , describe "Update tests"
            [ test "Toggling a closed resource adds it to the set of openResources" <|
                \() ->
                    initModel
                        |> update (ToggleResource HelpSelfCategory2Resource1Title)
                        |> Expect.equal
                            ( { openResources = Set.fromList [ t HelpSelfCategory2Resource1Title ] }
                            , Cmd.none
                            )
            , test "Toggling an open resource removes it from the set of openResources" <|
                \() ->
                    resource2expandedModel
                        |> update (ToggleResource HelpSelfCategory2Resource1Title)
                        |> Expect.equal
                            ( { openResources = Set.empty }
                            , Cmd.none
                            )
            ]
        ]
