module HelpSelfTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
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
                    |> Query.contains [ Html.text "[cCc] Help Me With.." ]
        , test "HelpSelf view has nav link to get-help" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t GetHelpPageSlug)) ]
                    |> Query.has [ text "Get Help" ]
        , test "HelpSelf view has nav link to not-alone" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t NotAlonePageSlug)) ]
                    |> Query.has [ text "Read about others" ]
        , test "HelpSelf view has nav link to definition" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href (t DefinitionPageSlug)) ]
                    |> Query.has [ text "What is Economic Abuse" ]
        ]
