module Theme exposing (colours, globalStyles, gridStyle, oneColumn, pageHeadingStyle, threeColumn, twoColumn, verticalSpacing)

import Css exposing (..)
import Css.Global exposing (global, typeSelector)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)


colours : { purple : Color, green : Color, teal : Color, grey : Color, white : Color }
colours =
    { purple = hex "4F2F8D"
    , green = hex "9CCC54"
    , teal = hex "3CC0BE"
    , grey = hex "58585A"
    , white = hex "FFFFFF"
    }


{-| Injects a <style> tag into the body, and can target element or
class selectors anywhere, including outside the Elm app.
-}
globalStyles : Html msg
globalStyles =
    global
        [ typeSelector "body"
            [ backgroundColor (hex "eee")
            , color colours.grey
            , fontFamilies [ "Poppins", sansSerif.value ]
            , fontWeight (int 300)
            ]
        , typeSelector "h1"
            [ color colours.purple
            , fontFamilies [ "Raleway", sansSerif.value ]
            ]
        , typeSelector "h2"
            [ color colours.purple
            , fontFamilies [ "Raleway", sansSerif.value ]
            ]
        , typeSelector "h3"
            [ color colours.purple
            , fontFamilies [ "Raleway", sansSerif.value ]
            ]
        , typeSelector "h4"
            [ color colours.purple
            , fontFamilies [ "Raleway", "sansSerif" ]
            ]
        ]


{-| For a top header, likely an h1
-}
pageHeadingStyle : Style
pageHeadingStyle =
    Css.batch
        [ fontSize (rem 2.5)
        , margin2 (rem 2) zero
        , textAlign center
        ]


gridStyle : Style
gridStyle =
    batch
        [ displayFlex
        , flexWrap wrap
        , margin2 zero (rem -1)
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
    calc (pct 33) minus (rem 2)


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
