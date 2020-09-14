module Message exposing (CookieButton(..), Msg(..))

import Browser
import Browser.Dom
import Page.Definition
import Page.HelpSelfSingle
import Page.NotAlone
import Url



-- Messages to update main Model


type Msg
    = NoOp
    | PageLinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotViewport Browser.Dom.Viewport
    | EmergencyButtonClicked
    | CookieButtonClicked CookieButton
    | DefinitionMsg Page.Definition.Msg
    | HelpSelfSingleMsg Page.HelpSelfSingle.Msg
    | NotAloneMsg Page.NotAlone.Msg



-- Cookie controls


type CookieButton
    = ViewCookieSettings
    | ViewPrivacy
    | AcceptCookies
    | DeclineCookies
