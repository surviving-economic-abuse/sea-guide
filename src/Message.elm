port module Message exposing (CookieButton(..), Msg(..), gaEvent, updateAnalyticsEvent, updateAnalyticsPage)

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



-- js ports can only take one arg - so bundle event strings


type alias GaEvent =
    { category : String
    , action : String
    , label : String
    }


gaEvent : String -> String -> String -> GaEvent
gaEvent category action label =
    { category = category
    , action = action
    , label = label
    }


port updateAnalyticsPage : String -> Cmd msg


port updateAnalyticsEvent : GaEvent -> Cmd msg
