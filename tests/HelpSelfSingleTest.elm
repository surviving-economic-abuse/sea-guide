module HelpSelfSingleTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Page.HelpSelfSingle exposing (Msg(..), update)
import Set
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)
import TestUtils exposing (queryFromStyledHtml)
import View.HelpSelfSingle exposing (view)


suite : Test
suite =
    let
        initModel =
            { openResources = Set.empty }

        resource2expandedModel =
            { openResources = Set.fromList [ t HelpSelfDebtResource1Title ] }
    in
    describe "HelpSelfSingle View"
        [ describe "View tests"
            [ test "HelpSelfSingle view has title" <|
                \() ->
                    queryFromStyledHtml (view (t HelpSelfBankingSlug) initModel)
                        |> Query.contains [ Html.text (t HelpSelfBankingTitle) ]
            , test "HelpSelfSingle view has nav link to get-help" <|
                \() ->
                    queryFromStyledHtml (view (t HelpSelfBankingSlug) initModel)
                        |> Query.find [ tag "a", attribute (Html.Attributes.href (t HelpSelfGridPageSlug)) ]
                        |> Query.has [ text (t ToHelpSelfFromSingleCategoryLink) ]
            , test "HelpSelfSingle view can have well formed resources" <|
                \() ->
                    queryFromStyledHtml (view (t HelpSelfDebtSlug) resource2expandedModel)
                        |> Query.find [ tag "li", containing [ text (t HelpSelfDebtResource1Title) ] ]
                        |> Query.has
                            [ text (t HelpSelfDebtResource1Quote1)
                            , text (t HelpSelfDebtResource1Quote2)
                            , text (t HelpSelfDebtResource1Summary)
                            , text (t HelpSelfDebtResource1Link)
                            , attribute (Html.Attributes.href (t HelpSelfDebtResource1Href))
                            ]
            ]
        , describe "Update tests"
            [ test "Toggling a closed resource adds it to the set of openResources" <|
                \() ->
                    initModel
                        |> update (ToggleResource HelpSelfDebtResource1Title)
                        |> Expect.equal
                            ( { openResources = Set.fromList [ t HelpSelfDebtResource1Title ] }
                            , Cmd.none
                            )
            , test "Toggling an open resource removes it from the set of openResources" <|
                \() ->
                    resource2expandedModel
                        |> update (ToggleResource HelpSelfDebtResource1Title)
                        |> Expect.equal
                            ( { openResources = Set.empty }
                            , Cmd.none
                            )
            ]
        ]
