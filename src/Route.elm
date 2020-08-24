module Route exposing (Route(..), fromUrl, toString)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Html.Styled exposing (..)
import Page.Definition as Definition
import Page.HelpSelfSingle as HelpSelfSingle
import Page.NotAlone as NotAlone
import Set
import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = DefinitionPage Definition.Model
    | GetHelpPage
    | HelpSelfGridPage
    | HelpSelfSinglePage HelpSelfSingle.Model String
    | NotAlonePage NotAlone.Model


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    { url | path = url.path }
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        DefinitionPage _ ->
            t DefinitionPageSlug

        GetHelpPage ->
            t GetHelpPageSlug

        HelpSelfGridPage ->
            t HelpSelfGridPageSlug

        HelpSelfSinglePage _ single ->
            t HelpSelfGridPageSlug ++ "/" ++ single

        NotAlonePage _ ->
            t NotAlonePageSlug



-- Internal helpers


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map (NotAlonePage { revealedJourney = Nothing }) Parser.top
        , Parser.map (DefinitionPage (Definition.Model Set.empty)) (Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage (HelpSelfSingle.Model Set.empty)) (Parser.s "help-self" </> string)

        -- Hardcoded to include staging prefix
        , Parser.map (DefinitionPage (Definition.Model Set.empty)) (Parser.s "sea-map" </> Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelpPage (Parser.s "sea-map" </> Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGridPage (Parser.s "sea-map" </> Parser.s (t HelpSelfGridPageSlug))
        , Parser.map (HelpSelfSinglePage (HelpSelfSingle.Model Set.empty)) (Parser.s "sea-map" </> Parser.s "help-self" </> string)
        ]
