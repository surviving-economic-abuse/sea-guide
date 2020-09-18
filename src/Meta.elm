port module Meta exposing (metaFromPage, setMetaDescription)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Page exposing (Page(..))


type alias PageMeta =
    { title : String
    , description : String
    }


metaFromPage : Page -> PageMeta
metaFromPage page =
    let
        data =
            case page of
                DefinitionPage _ ->
                    ( t DefinitionPageMetaTitle, t DefinitionPageDescription )

                GetHelpPage ->
                    ( t GetHelpPageMetaTitle, t GetHelpPageDescription )

                HelpSelfGridPage ->
                    ( t HelpSelfGridPageMetaTitle, t HelpSelfGridPageDescription )

                HelpSelfSinglePage _ single ->
                    ( t (HelpSelfSinglePageMetaTitle single), t (HelpSelfSinglePageDescription single) )

                NotAlonePage _ ->
                    ( t NotAlonePageMetaTitle, t NotAlonePageDescription )
    in
    { title = Tuple.first data
    , description = Tuple.second data
    }


port setMetaDescription : String -> Cmd msg
