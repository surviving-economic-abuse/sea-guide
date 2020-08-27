module Theme exposing (container, containerContent, globalStyles, green, grey, gridStyle, lightGreen, lightGrey, lightOrange, lightPink, lightPurple, lightTeal, navItemStyles, navLinkStyle, navListStyle, oneColumn, orange, page, pageHeadingStyle, pink, pureWhite, purple, shadowGrey, teal, threeColumn, twoColumn, verticalSpacing, waveStyle, white)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Global exposing (adjacentSiblings, global, typeSelector)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (Html, a, button, div, img, li, p, span, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, id, src)
import Html.Styled.Events exposing (onClick)



-- Main colours


purple : Color
purple =
    hex "683e89"


lightPurple : Color
lightPurple =
    hex "e9d0fd"



-- Emergency colours


orange : Color
orange =
    hex "ea5e4a"


lightOrange : Color
lightOrange =
    hex "ffece8"



-- Accent colours


green : Color
green =
    hex "a4cc5a"


lightGreen : Color
lightGreen =
    hex "effadc"


pink : Color
pink =
    hex "e03088"


lightPink : Color
lightPink =
    hex "ffddee"


teal : Color
teal =
    hex "67c4ba"


lightTeal : Color
lightTeal =
    hex "edfffd"



-- Text and backgrounds


grey : Color
grey =
    hex "4a4d50"


lightGrey : Color
lightGrey =
    hex "ededed"


shadowGrey : Color
shadowGrey =
    rgba 74 77 80 0.3


white : Color
white =
    hex "fafafa"


pureWhite : Color
pureWhite =
    hex "ffffff"


{-| Injects a <style> tag into the body, and can target element or
class selectors anywhere, including outside the Elm app.
-}
globalStyles : Html msg
globalStyles =
    global
        [ typeSelector "body"
            [ backgroundColor white
            , color grey
            , fontFamilies [ "sofia-pro", sansSerif.value ]
            , fontWeight (int 400)
            ]
        , typeSelector "h1"
            [ color purple
            , fontFamilies [ "Raleway", sansSerif.value ]
            ]
        , typeSelector "h2"
            [ color purple
            , fontFamilies [ "Raleway", sansSerif.value ]
            ]
        , typeSelector "h3"
            [ color purple
            , fontFamilies [ "Raleway", sansSerif.value ]
            ]
        , typeSelector "h4"
            [ color purple
            , fontFamilies [ "Raleway", "sansSerif" ]
            ]
        , typeSelector "p"
            [ adjacentSiblings
                [ typeSelector "p"
                    [ marginTop (rem 1)
                    ]
                ]
            ]
        , typeSelector "blockquote"
            [ adjacentSiblings
                [ typeSelector "blockquote"
                    [ marginTop (rem 1)
                    ]
                ]
            ]
        ]


{-| For a top header, likely an h1
-}
pageHeadingStyle : Style
pageHeadingStyle =
    batch
        [ fontSize (rem 1.8)
        , margin2 (rem 2) zero
        , textAlign center
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ fontSize (rem 2.5) ]
        ]


gridStyle : Style
gridStyle =
    batch
        [ displayFlex
        , flexWrap wrap
        , alignItems start
        ]


{-| A flex row item width for a single column layout
oneColumn : Css.CalculatedLength (not exposed by <https://github.com/rtfeldman/elm-css/pull/519>)
-}
oneColumn =
    calc (pct 100) minus (rem 2)


{-| A flex row item width for a double column layout
twoColumn : Css.CalculatedLength
-}
twoColumn =
    calc (pct 50) minus (rem 2)


{-| A flex row item width for a triple column layout
threeColumn : Css.CalculatedLength
-}
threeColumn =
    calc (pct 33.33) minus (rem 2)


{-| A div with known vertical margin
-}
verticalSpacing : Html msg
verticalSpacing =
    div [ css [ verticalSpacingStyle ] ] []


verticalSpacingStyle : Style
verticalSpacingStyle =
    batch
        [ margin2 (rem 2) zero
        ]


{-| Bottom navigation common styles
-}
navListStyle : Style
navListStyle =
    batch
        [ listStyle none
        , displayFlex
        , flexWrap wrap
        , justifyContent spaceAround
        ]


navItemStyles : List Style
navItemStyles =
    [ batch
        [ flex3 zero zero (pct 100)
        , marginBottom (rem 1)
        , withMedia [ only screen [ Media.minWidth (px 769) ] ]
            [ flex3 zero zero threeColumn ]
        ]
    ]


navLinkStyle : Style
navLinkStyle =
    batch
        [ backgroundColor purple
        , borderRadius (rem 0.5)
        , color white
        , displayFlex
        , flexDirection column
        , justifyContent center
        , padding (rem 0.5)
        , minHeight (rem 4)
        , textAlign center
        , textDecoration none
        , width (pct 100)
        , hover
            [ backgroundColor purple
            ]
        ]


waveStyle : Style
waveStyle =
    batch
        [ backgroundImage (url "Background_Wave.svg")
        , backgroundAttachment fixed
        , backgroundPosition center
        , backgroundRepeat noRepeat
        , backgroundSize cover
        ]


container : List (Html msg) -> Html msg
container children =
    div [ css [ margin2 zero auto, maxWidth (px 1200), width (pct 100) ] ] children


containerContent : List (Html msg) -> Html msg
containerContent children =
    div [ css [ margin2 zero auto, maxWidth (px 800), width (pct 100) ] ] children


page : List (Html msg) -> Html msg
page children =
    div [ css [ minHeight (vh 100), waveStyle ] ]
        ([ globalStyles
         , button [ css [ emergencyButtonStyle ] ]
            [ span [] [ text (t EmergencyButton) ]
            , img [ css [ iconStyle ], src "Emergency.svg", alt "" ] []
            ]
         ]
            ++ children
            ++ [ div [ css [ emergencyPanelStyle ], id "emergency" ]
                    [ div [ css [ emergencyPanelHeaderStyle ] ]
                        [ img [ css [ emergencyPanelHeaderIconStyle ], src "Emergency.svg", alt "" ] []
                        , div [ css [ emergencyPanelHeaderTextStyle ] ] [ text "Are you in danger right now?" ]
                        , button [ css [ emergencyPanelHeaderButtonStyle ] ] [ img [ css [ emergencyPanelHeaderIconStyle ], src "Close.svg", alt "Close" ] [] ]
                        ]
                    , div [ css [ emergencyPanelBodyStyle ] ]
                        [ p [] [ text "If you need emergency help call:" ]
                        , ul [ css [ listStyle none, margin2 (rem 1) zero ] ]
                            [ li [ css [ marginBottom (rem 1) ] ] [ text "Police ", a [ href "#" ] [ text "999" ] ]
                            , li [ css [ marginBottom (rem 1) ] ] [ text "Other help ", a [ href "#" ] [ text "01234 56789" ] ]
                            , li [ css [ marginBottom (rem 1) ] ] [ text "Other help ", a [ href "#" ] [ text "01234 56789" ] ]
                            , li [] [ text "Other help ", a [ href "#" ] [ text "01234 56789" ] ]
                            ]
                        , p [] [ text "These numbers are free to call" ]
                        ]
                    ]
               ]
        )


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
        [ backgroundColor white
        , alignItems center
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
            [ borderRadius zero
            , right (px 20)
            ]
        ]


iconStyle : Style
iconStyle =
    batch
        [ height (px 50)
        , marginTop (px 10)
        ]
