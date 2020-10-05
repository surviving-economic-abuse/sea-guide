port module CookieContent exposing (CookieState, renderCookieContent, saveConsent)

import Browser.Navigation exposing (back)
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, button, div, h2, p, text)
import Html.Styled.Attributes exposing (css)
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
    div [ css [ bannerStyles ] ]
        [ p [] [ text (t CookieBannerP) ]
        , button [ css [ bannerButtonStyle ], onClick (CookieButtonClicked AcceptCookies) ] [ text (t CookieAcceptButton) ]
        , button [ css [ bannerButtonStyle ], onClick (CookieButtonClicked DeclineCookies) ] [ text (t CookieDeclineButton) ]
        , button [ css [ bannerLinkStyle ], onClick (CookieButtonClicked ViewPrivacy) ] [ text (t CookieBannerPrivacyButton) ]
        , if cookieState.privacyInfoIsOpen then
            renderPrivacyInformation

          else
            text ""
        ]


renderCookieSettingsButton : Html Msg
renderCookieSettingsButton =
    button [ css [ cookieSettingsButtonStyle ], onClick (CookieButtonClicked ViewCookieSettings) ] [ text (t CookieSettingsButton) ]


renderPrivacyInformation : Html Msg
renderPrivacyInformation =
    div []
        [ h2 [ css [ privacyHeadingStyle ] ] [ text (t PrivacyContent1Heading) ]
        , p [] [ text (t PrivacyContent1P) ]
        , h2 [ css [ privacyHeadingStyle ] ] [ text (t PrivacyContent2Heading) ]
        , p [] [ text (t PrivacyContent2P) ]
        , h2 [ css [ privacyHeadingStyle ] ] [ text (t PrivacyContent3Heading) ]
        , p [] [ text (t PrivacyContent3P) ]
        ]


cookieSettingsButtonStyle : Style
cookieSettingsButtonStyle =
    batch
        [ backgroundColor purple
        , border zero
        , borderTopRightRadius (rem 0.8)
        , color white
        , cursor pointer
        , padding2 (rem 0.5) (rem 1.5)
        , hover
            [ backgroundColor lightPurple
            , color grey
            ]
        , transition
            [ Css.Transitions.backgroundColor 200
            , Css.Transitions.color 200
            ]
        ]


bannerStyles : Style
bannerStyles =
    batch
        [ backgroundColor purple
        , bottom zero
        , color white
        , displayFlex
        , flexDirection column
        , overflowY auto
        , padding (rem 1)
        , position fixed
        , top (pct 40)
        , zIndex (int 2)
        , withMediaDesktop
            [ height (pct 100)
            , overflowY auto
            , padding (rem 2)
            , position fixed
            , top zero
            , width (rem 20)
            ]
        ]


bannerButtonStyle : Style
bannerButtonStyle =
    batch
        [ backgroundColor white
        , border zero
        , borderRadius (rem 2)
        , color purple
        , cursor pointer
        , margin4 (rem 1) auto zero auto
        , maxWidth (rem 20)
        , minHeight (rem 2.5)
        , width (pct 100)
        , focus
            [ border3 (px 3) solid green.colour
            , outline zero
            ]
        ]


bannerLinkStyle : Style
bannerLinkStyle =
    batch
        [ backgroundColor transparent
        , border3 (px 2) solid white
        , borderRadius (rem 2)
        , color white
        , cursor pointer
        , margin4 (rem 1) auto zero auto
        , maxWidth (rem 20)
        , minHeight (rem 2.5)
        , width (pct 100)
        , focus
            [ border3 (px 3) solid green.colour
            , outline zero
            ]
        ]


privacyHeadingStyle : Style
privacyHeadingStyle =
    batch
        [ color pureWhite
        , fontSize (rem 1.2)
        , marginTop (rem 1)
        ]


port saveConsent : Bool -> Cmd msg
