port module Meta exposing (metaFromPage, setMetaDescription)

import Page exposing (Page(..))


type alias PageMeta =
    { title : String
    , description : String
    }


metaFromPage : Page -> PageMeta
metaFromPage route =
    { title = "My title"
    , description = "My description"
    }


port setMetaDescription : String -> Cmd msg
