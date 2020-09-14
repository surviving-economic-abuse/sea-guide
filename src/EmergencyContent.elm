module EmergencyContent exposing (renderEmergencyButton, renderEmergencyPanel, renderExitButton)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, a, button, div, img, li, p, span, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, id, src)
import Html.Styled.Events exposing (onClick)
import Message exposing (Msg(..))
import Theme exposing (..)


renderExitButton : Html Msg
renderExitButton =
    a [ href "https://www.google.co.uk", css [ exitButtonStyle ] ] [ text (t ExitButton) ]


renderEmergencyPanel : Float -> Html Msg
renderEmergencyPanel viewportWidth =
    div [ css [ emergencyPanelStyle ], id "emergency" ]
        [ div [ css [ emergencyPanelHeaderStyle ] ]
            [ img [ css [ emergencyPanelHeaderIconStyle ], src "/Emergency.svg", alt "" ] []
            , div [ css [ emergencyPanelHeaderTextStyle ] ] [ text (t EmergencyReassure) ]
            , button
                [ css [ emergencyPanelHeaderButtonStyle ], onClick EmergencyButtonClicked ]
                [ img [ css [ emergencyPanelHeaderIconStyle ], src "/Close.svg", alt (t CloseButton) ] [] ]
            ]
        , div [ css [ emergencyPanelBodyStyle ] ]
            [ p []
                [ text (t EmergencyPoliceInfo)
                , text " "
                , renderPhoneNumber viewportWidth (t EmergencyPoliceNumber)
                ]
            , p [] [ text (t EmergencyNotImmediateReassure) ]
            , ul [ css [ listStyle none, margin2 (rem 1) zero ] ]
                [ li [ css [ marginBottom (rem 1) ] ]
                    [ a [ href (t DomesticAbuseHref) ]
                        [ text
                            (t EmergencyDomesticAbuseLink)
                        ]
                    , text " - "
                    , text (t EmergencyDomesticAbusePrompt)
                    , text " "
                    , renderPhoneNumber viewportWidth (t EmergencyDomesticAbuseNumber)
                    , text " "
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


renderPhoneNumber : Float -> String -> Html msg
renderPhoneNumber viewportWidth phonenumber =
    if viewportWidth <= Theme.maxMobile then
        a [ href ("tel:" ++ String.replace " " "" phonenumber) ] [ text phonenumber ]

    else
        text phonenumber


renderEmergencyButton : Html Msg
renderEmergencyButton =
    button
        [ css [ emergencyButtonStyle ], onClick EmergencyButtonClicked ]
        [ span [] [ text (t EmergencyButton) ]
        , img [ css [ iconStyle ], src "/Emergency.svg", alt "" ] []
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
        , withMediaTabletOrDesktop
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
        [ flex3 zero zero (rem 3)
        , height (rem 3)
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
        , border3 (px 3) solid transparent
        , borderRadius (pct 50)
        , cursor pointer
        , displayFlex
        , flex3 zero zero (rem 3)
        , flexDirection column
        , justifyContent center
        , height (rem 3)
        , hover
            [ border3 (px 3) solid lightPurple
            ]
        , focus
            [ border3 (px 3) solid teal
            , outline none
            ]
        ]


emergencyPanelBodyStyle : Style
emergencyPanelBodyStyle =
    batch
        [ backgroundColor pureWhite
        , borderBottomLeftRadius (px 20)
        , borderBottomRightRadius (px 20)
        , padding (rem 1.5)
        , withMediaTabletOrDesktop
            [ borderRadius zero
            ]
        ]


emergencyButtonStyle : Style
emergencyButtonStyle =
    batch
        [ alignItems center
        , backgroundColor white
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , border3 (px 3) solid transparent
        , borderRadius (px 50)
        , bottom (pct 10)
        , color grey
        , cursor pointer
        , displayFlex
        , flexDirection column
        , fontSize (rem 1)
        , fontWeight (int 700)
        , padding4 (px 10) zero (px 5) zero
        , position fixed
        , right (px 5)
        , width (rem 3.75)
        , zIndex (int 1)
        , hover
            [ border3 (px 3) solid green
            ]
        , focus
            [ border3 (px 3) solid green
            , outline zero
            ]
        , withMediaTabletOrDesktop
            [ right (px 20)
            ]
        ]


iconStyle : Style
iconStyle =
    batch
        [ height (px 50)
        , marginTop (px 10)
        ]
