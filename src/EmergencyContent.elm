module EmergencyContent exposing (renderEmergencyButton, renderEmergencyPanel, renderExitButton)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (Html, a, button, div, img, li, p, span, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, id, src)
import Html.Styled.Events exposing (onClick)
import Message exposing (Msg(..))
import Theme exposing (..)


renderExitButton : Html Msg
renderExitButton =
    a [ href "https://www.google.co.uk", css [ exitButtonStyle ] ] [ text (t ExitButton) ]


renderEmergencyPanel : Html Msg
renderEmergencyPanel =
    div [ css [ emergencyPanelStyle ], id "emergency" ]
        [ div [ css [ emergencyPanelHeaderStyle ] ]
            [ img [ css [ emergencyPanelHeaderIconStyle ], src "/sea-map/Emergency.svg", alt "" ] []
            , div [ css [ emergencyPanelHeaderTextStyle ] ] [ text (t EmergencyReassure) ]
            , button
                [ css [ emergencyPanelHeaderButtonStyle ], onClick EmergencyButtonClicked ]
                [ img [ css [ emergencyPanelHeaderIconStyle ], src "/sea-map/Close.svg", alt "Close" ] [] ]
            ]
        , div [ css [ emergencyPanelBodyStyle ] ]
            [ p [] [ text (t EmergencyPoliceInfo) ]
            , p [] [ text (t EmergencyNotImmediateReassure) ]
            , ul [ css [ listStyle none, margin2 (rem 1) zero ] ]
                [ li [ css [ marginBottom (rem 1) ] ]
                    [ a [ href (t DomesticAbuseHref) ]
                        [ text
                            (t EmergencyDomesticAbuseLink)
                        ]
                    , text " - "
                    , text (t EmergencyDomesticAbuseInfo)
                    ]
                , li [ css [ marginBottom (rem 1) ] ]
                    [ a [ href (t WomensAidHref) ]
                        [ text
                            (t EmergencyWomensAidLink)
                        ]
                    ]
                ]
            , p [] [ a [ href (t SeaOrganisationsResourceHref) ] [ text (t EmergencyOtherOrganisationsLink) ] ]
            ]
        ]


renderEmergencyButton : Html Msg
renderEmergencyButton =
    button
        [ css [ emergencyButtonStyle ], onClick EmergencyButtonClicked ]
        [ span [] [ text (t EmergencyButton) ]
        , img [ css [ iconStyle ], src "/sea-map/Emergency.svg", alt "" ] []
        ]


exitButtonStyle : Style
exitButtonStyle =
    batch
        [ backgroundColor orange
        , border zero
        , color white
        , fontSize (rem 1.2)
        , fontWeight (int 400)
        , height (rem 3.75)
        , lineHeight (num 1.2)
        , padding (px 6)
        , position fixed
        , right zero
        , textAlign center
        , textDecoration none
        , top (rem 5)
        , width (rem 3.75)
        , zIndex (int 2)
        ]


emergencyPanelStyle : Style
emergencyPanelStyle =
    batch
        [ borderTopLeftRadius (px 20)
        , borderTopRightRadius (px 20)
        , bottom zero
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , position fixed
        , right (px 5)
        , width (px 300)
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ right (px 120)
            ]
        ]


emergencyPanelHeaderStyle : Style
emergencyPanelHeaderStyle =
    batch
        [ backgroundColor purple
        , borderTopLeftRadius (px 20)
        , borderTopRightRadius (px 20)
        , color white
        , displayFlex
        , alignItems center
        , justifyContent spaceAround
        , padding2 (rem 0.5) zero
        ]


emergencyPanelHeaderIconStyle : Style
emergencyPanelHeaderIconStyle =
    batch
        [ flex3 zero zero (pct 20)
        , height (px 40)
        , margin auto
        ]


emergencyPanelHeaderTextStyle : Style
emergencyPanelHeaderTextStyle =
    batch
        [ flex3 zero zero (pct 50)
        ]


emergencyPanelHeaderButtonStyle : Style
emergencyPanelHeaderButtonStyle =
    batch
        [ backgroundColor transparent
        , border zero
        , flex3 zero zero (pct 20)
        ]


emergencyPanelBodyStyle : Style
emergencyPanelBodyStyle =
    batch
        [ backgroundColor pureWhite
        , borderBottomLeftRadius (px 20)
        , borderBottomRightRadius (px 20)
        , padding (rem 1.5)
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ borderRadius zero
            ]
        ]


emergencyButtonStyle : Style
emergencyButtonStyle =
    batch
        [ alignItems center
        , backgroundColor white
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , border zero
        , borderRadius (px 50)
        , bottom (pct 10)
        , color grey
        , displayFlex
        , flexDirection column
        , fontSize (rem 1)
        , fontWeight (int 700)
        , padding4 (px 10) zero (px 5) zero
        , position fixed
        , right (px 5)
        , width (rem 3.75)
        , zIndex (int 1)
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ right (px 20)
            ]
        ]


iconStyle : Style
iconStyle =
    batch
        [ height (px 50)
        , marginTop (px 10)
        ]
