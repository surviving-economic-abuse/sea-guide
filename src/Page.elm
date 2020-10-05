module Page exposing (Page(..), fromRoute, toString)

import Page.Definition
import Page.HelpSelfSingle
import Page.NotAlone
import Route exposing (Route(..))
import Set


type Page
    = DefinitionPage Page.Definition.Model
    | GetHelpPage
    | HelpSelfGridPage
    | HelpSelfSinglePage Page.HelpSelfSingle.Model String
    | NotAlonePage Page.NotAlone.Model


toString : Page -> String
toString page =
    case page of
        DefinitionPage _ ->
            Route.toString Definition

        GetHelpPage ->
            Route.toString GetHelp

        HelpSelfGridPage ->
            Route.toString HelpSelfGrid

        HelpSelfSinglePage _ single ->
            Route.toString (HelpSelfSingle single)

        NotAlonePage _ ->
            Route.toString NotAlone


fromRoute : Route -> Page
fromRoute route =
    case route of
        Route.Definition ->
            DefinitionPage { openCategories = Set.empty }

        Route.GetHelp ->
            GetHelpPage

        Route.HelpSelfGrid ->
            HelpSelfGridPage

        Route.HelpSelfSingle string ->
            HelpSelfSinglePage { openResources = Set.empty } string

        Route.NotAlone ->
            NotAlonePage { revealedJourney = Nothing }
