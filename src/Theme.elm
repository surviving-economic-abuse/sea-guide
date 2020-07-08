module Theme exposing (colours, globalStyles, gridStyle, navItemStyles, navLinkStyle, navListStyle, oneColumn, pageHeadingStyle, threeColumn, twoColumn, verticalSpacing)

import Css exposing (..)
import Css.Global exposing (adjacentSiblings, global, typeSelector)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)


colours : { purple : Color, darkpurple : Color, green : Color, teal : Color, grey : Color, lightgrey : Color, midgrey : Color, white : Color }
colours =
    { purple = hex "4F2F8D"
    , darkpurple = hex "321f40"
    , green = hex "9CCC54"
    , teal = hex "3CC0BE"
    , grey = hex "58585A"
    , midgrey = hex "dedae7"
    , lightgrey = hex "f4f4f6"
    , white = hex "FFFFFF"
    }


{-| Injects a <style> tag into the body, and can target element or
class selectors anywhere, including outside the Elm app.
-}
globalStyles : Html msg
globalStyles =
    global
        [ typeSelector "body"
            [ color colours.grey
            , fontFamilies [ "Poppins", sansSerif.value ]
            , fontWeight (int 400)
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
        , margin2 zero (rem -1)
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
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ flex3 zero zero threeColumn ]
        ]
    ]


navLinkStyle : Style
navLinkStyle =
    batch
        [ backgroundColor colours.darkpurple
        , borderRadius (rem 0.5)
        , color colours.white
        , displayFlex
        , flexDirection column
        , justifyContent center
        , padding (rem 0.5)
        , minHeight (rem 4)
        , textAlign center
        , textDecoration none
        , width (pct 100)
        , hover
            [ backgroundColor colours.purple
            ]
        ]
