module Theme exposing (container, containerContent, globalStyles, green, grey, gridStyle, lightGreen, lightGrey, lightOrange, lightPink, lightPurple, lightTeal, navItemStyles, navLinkStyle, navListStyle, oneColumn, orange, pageHeadingStyle, pink, pureWhite, purple, shadowGrey, teal, threeColumn, twoColumn, verticalSpacing, waveStyle, white)

import Css exposing (..)
import Css.Global exposing (adjacentSiblings, global, typeSelector)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)



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


waveStyle : Style
waveStyle =
    batch
        [ backgroundImage (url "Background_Wave.svg")
        , backgroundAttachment fixed
        , backgroundPosition center
        , backgroundRepeat noRepeat
        , backgroundSize cover
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


container : List (Html msg) -> Html msg
container children =
    div [ css [ margin2 zero auto, maxWidth (px 1200), width (pct 100) ] ] children


containerContent : List (Html msg) -> Html msg
containerContent children =
    div [ css [ margin2 zero auto, maxWidth (px 800), width (pct 100) ] ] children
