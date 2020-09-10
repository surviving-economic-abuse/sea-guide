module CookieContent exposing (CookieState, renderCookieContent)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, button, div, img, li, p, span, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, id, src)
import Html.Styled.Events exposing (onClick)
import Message exposing (CookieButton(..), Msg(..))
import Theme exposing (..)


type alias CookieState =
    { cookieBannerIsOpen : Bool
    , privacyInfoIsOpen : Bool
    }


renderCookieContent : CookieState -> Html Msg
renderCookieContent cookieState =
    div []
        [ if cookieState.cookieBannerIsOpen then
            renderCookieBanner cookieState

          else
            renderCookieSettingsLink
        ]


renderCookieBanner : CookieState -> Html Msg
renderCookieBanner cookieState =
    div []
        [ p [] [ text (t CookieBannerP) ]
        , button [ onClick (CookieButtonClicked ViewPrivacy) ] [ text (t CookieBannerPrivacyLink) ]
        , if cookieState.privacyInfoIsOpen then
            renderPrivacyInformation

          else
            text ""
        , button [ onClick (CookieButtonClicked AcceptCookies) ] [ text (t CookieAcceptButton) ]
        , button [ onClick (CookieButtonClicked DeclineCookies) ] [ text (t CookieDeclineButton) ]
        ]


renderCookieSettingsLink : Html Msg
renderCookieSettingsLink =
    button [ onClick (CookieButtonClicked ViewCookieSettings) ] [ text (t CookieSettingsButton) ]


renderPrivacyInformation : Html Msg
renderPrivacyInformation =
    div [] [ p [] [ text (t PrivacyContent) ] ]
