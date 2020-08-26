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
    = Definition
    | GetHelp
    | HelpSelfGrid
    | HelpSelfSingle String
    | NotAlone


fromUrl : String -> Url.Url -> Maybe Route
fromUrl basePath url =
    { url | path = String.replace basePath "" url.path }
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Definition ->
            t DefinitionPageSlug

        GetHelp ->
            t GetHelpPageSlug

        HelpSelfGrid ->
            t HelpSelfGridPageSlug

        HelpSelfSingle single ->
            t HelpSelfGridPageSlug ++ "/" ++ single

        NotAlone ->
            t NotAlonePageSlug



-- Internal helpers


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map NotAlone Parser.top
        , Parser.map Definition (Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelp (Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGrid (Parser.s (t HelpSelfGridPageSlug))
        , Parser.map HelpSelfSingle (Parser.s "help-self" </> string)
        ]
