module Theme exposing (..)

import Css exposing (..)
import Css.Global exposing (global, typeSelector)
import Html.Styled exposing (Html)


colours : { purple : Color, green : Color, teal : Color, grey : Color }
colours =
    { purple = hex "4F2F8D"
    , green = hex "9CCC54"
    , teal = hex "3CC0BE"
    , grey = hex "58585A"
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
pageHeading : Style
pageHeading =
    Css.batch
        [ fontSize (rem 2.5)
        , margin2 (rem 2) zero
        , textAlign center
        ]
