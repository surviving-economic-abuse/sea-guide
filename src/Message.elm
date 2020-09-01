module Message exposing (Msg(..))

import Browser
import Page.Definition
import Page.HelpSelfSingle
import Page.NotAlone
import Url



-- Messages to update main Model


type Msg
    = NoOp
    | PageLinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | EmergencyButtonClicked
    | DefinitionMsg Page.Definition.Msg
    | HelpSelfSingleMsg Page.HelpSelfSingle.Msg
    | NotAloneMsg Page.NotAlone.Msg
