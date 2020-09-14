port module CookieContent exposing (CookieState, renderCookieContent, saveConsent)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, button, div, p, text)
import Html.Styled.Events exposing (onClick)
import Message exposing (CookieButton(..), Msg(..))
import Theme exposing (..)


type alias CookieState =
    { cookieBannerIsOpen : Bool
    , privacyInfoIsOpen : Bool
    , hasConsentedToCookies : Bool
    }


renderCookieContent : CookieState -> Html Msg
renderCookieContent cookieState =
    div []
        [ if cookieState.cookieBannerIsOpen then
            renderCookieBanner cookieState

          else
            renderCookieSettingsButton
        ]


renderCookieBanner : CookieState -> Html Msg
renderCookieBanner cookieState =
    div []
        [ p [] [ text (t CookieBannerP) ]
        , button [ onClick (CookieButtonClicked ViewPrivacy) ] [ text (t CookieBannerPrivacyButton) ]
        , if cookieState.privacyInfoIsOpen then
            renderPrivacyInformation

          else
            text ""
        , button [ onClick (CookieButtonClicked AcceptCookies) ] [ text (t CookieAcceptButton) ]
        , button [ onClick (CookieButtonClicked DeclineCookies) ] [ text (t CookieDeclineButton) ]
        ]


renderCookieSettingsButton : Html Msg
renderCookieSettingsButton =
    button [ onClick (CookieButtonClicked ViewCookieSettings) ] [ text (t CookieSettingsButton) ]


renderPrivacyInformation : Html Msg
renderPrivacyInformation =
    div [] [ p [] [ text (t PrivacyContent) ] ]


port saveConsent : Bool -> Cmd msg
