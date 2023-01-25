module Theme exposing (container, containerContent, darkOrange, expanderButtonStyle, expanderClosedStyle, expanderDefinitionStyles, expanderHeadingStyle, expanderItemStyle, expanderOpenStyle, expanderSymbolStyle, generateId, globalStyles, green, grey, gridStyle, lightGreen, lightGrey, lightOrange, lightPink, lightPurple, lightTeal, maxMobile, navItemStyles, navListStyle, oneColumn, orange, pageHeadingStyle, pink, pureWhite, purple, quoteStyle, renderWithBulletList, renderWithKeywords, rotate90Style, shadowGrey, teal, threeColumn, twoColumn, verticalSpacing, waveStyle, white, withMediaDesktop, withMediaMobile, withMediaTablet)

import Css exposing (..)
import Css.Global exposing (adjacentSiblings, global, typeSelector)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, b, div, li, p, text, ul)
import Html.Styled.Attributes exposing (css)



-- Main colours


purple : Color
purple =
    hex "683e89"


lightPurple : Color
lightPurple =
    hex "e9d0fd"



-- Emergency colours


orange : { colour : Color, string : String }
orange =
    { colour = hex "ea5e4a"
    , string = "#ea5e4a"
    }


lightOrange : Color
lightOrange =
    hex "ffece8"


darkOrange : Color
darkOrange =
    hex "ac3c2d"



-- Accent colours


green : { colour : Color, string : String }
green =
    { colour = hex "a4cc5a"
    , string = "#a4cc5a"
    }


lightGreen : Color
lightGreen =
    hex "effadc"


pink : { colour : Color, string : String }
pink =
    { colour = hex "e03088"
    , string = "#e03088"
    }


lightPink : Color
lightPink =
    hex "ffddee"


teal : { colour : Color, string : String }
teal =
    { colour = hex "67c4ba"
    , string = "#67c4ba"
    }


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



-- Breakpoints


maxMobile : Float
maxMobile =
    576


withMediaMobile : List Style -> Style
withMediaMobile =
    withMedia [ only screen [ Media.maxWidth (px maxMobile) ] ]


withMediaTablet : List Style -> Style
withMediaTablet =
    withMedia [ only screen [ Media.minWidth (px maxMobile), Media.maxWidth (px maxTablet) ] ]


maxTablet : Float
maxTablet =
    769


withMediaDesktop : List Style -> Style
withMediaDesktop =
    withMedia [ only screen [ Media.minWidth (px maxTablet) ] ]


maxLargeDevice : Float
maxLargeDevice =
    992


withMediaLargeDevice : List Style -> Style
withMediaLargeDevice =
    withMedia [ only screen [ Media.minWidth (px maxLargeDevice) ] ]


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
        , typeSelector "b"
            [ fontWeight (int 700)
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
        [ backgroundImage (url "/Background_Wave.svg")
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
        , outline none
        , padding2 (rem 2) zero
        , textAlign center
        , withMediaTablet
            [ fontSize (rem 2.5) ]
        , withMediaDesktop
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
verticalSpacing : Float -> Html msg
verticalSpacing num =
    div [ css [ margin2 (rem num) zero ] ] []


{-| Bottom navigation common styles
-}
navListStyle : Style
navListStyle =
    batch
        [ listStyle none
        , displayFlex
        , flexWrap wrap
        , justifyContent spaceAround
        , margin2 zero (rem 1)
        ]


navItemStyles : List Style
navItemStyles =
    [ batch
        [ flex3 zero zero (pct 100)
        , marginBottom (rem 1)
        , maxWidth (rem 25)
        , withMediaLargeDevice
            [ flex3 zero zero threeColumn ]
        ]
    ]



-- expanders


expanderButtonStyle : Style
expanderButtonStyle =
    batch
        [ alignItems center
        , backgroundColor purple
        , border3 (px 3) solid transparent
        , cursor pointer
        , displayFlex
        , justifyContent spaceBetween
        , padding2 (rem 0.5) (rem 1)
        , textAlign left
        , width (pct 100)
        , focus
            [ border3 (px 3) solid teal.colour
            , outline zero
            ]
        ]


expanderOpenStyle : Style
expanderOpenStyle =
    batch
        [ borderTopLeftRadius (rem 0.8)
        , borderTopRightRadius (rem 0.8)
        ]


expanderClosedStyle : Style
expanderClosedStyle =
    batch
        [ borderRadius (rem 0.8)
        ]


expanderHeadingStyle : Style
expanderHeadingStyle =
    batch
        [ color white
        , fontSize (rem 1.25)
        , flex2 (int 1) (int 1)
        ]


expanderSymbolStyle : Style
expanderSymbolStyle =
    batch
        [ height (rem 1.5)
        , flex3 zero (int 1) (rem 3)
        , width (rem 1.5)
        , transform (rotate (deg 0))
        , transition
            [ Css.Transitions.transform 200
            ]
        ]


rotate90Style : Style
rotate90Style =
    batch
        [ transform (rotate (deg 90))
        , transition
            [ Css.Transitions.transform 200
            ]
        ]


expanderItemStyle : Style
expanderItemStyle =
    batch [ marginTop (rem 1) ]


expanderDefinitionStyles : List Style
expanderDefinitionStyles =
    [ batch
        [ backgroundColor pureWhite
        , borderBottomLeftRadius (rem 1)
        , borderBottomRightRadius (rem 1)
        , boxShadow5 (px 0) (px 3) (px 5) (px 0) shadowGrey
        , padding2 (rem 1.5) (rem 1)
        ]

    -- Allow more padding space on larger screens
    , withMedia [ only screen [ Media.minWidth (px 576) ] ]
        [ padding (rem 2) ]
    ]


quoteStyle : Style
quoteStyle =
    batch
        [ paddingLeft (rem 1)
        , before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
        , nthOfType "1n"
            [ borderLeft3 (px 2) solid orange.colour
            ]
        , nthOfType "2n"
            [ borderLeft3 (px 2) solid teal.colour
            ]
        , nthOfType "3n"
            [ borderLeft3 (px 2) solid pink.colour
            ]
        ]


container : List (Html msg) -> Html msg
container children =
    div [ css [ margin2 zero auto, maxWidth (px 1200), width (pct 100) ] ] children


containerContent : List (Html msg) -> Html msg
containerContent children =
    div [ css [ margin2 zero auto, maxWidth (px 800), width (pct 100) ] ] children


generateId : String -> String
generateId input =
    String.trim (String.replace " " "-" (String.toLower input))



-- Helpers to render bullet style lists within Copy.Text Strings list items enclosed in <ul></ul> tags


renderWithBulletList : String -> List (Html msg)
renderWithBulletList richText =
    List.map (\( words, isList ) -> renderAsListOrText ( words, isList )) (splitOnStartList richText)


renderAsListOrText : ( String, Bool ) -> Html msg
renderAsListOrText ( stringPartial, isList ) =
    if isList then
        ul [ css [ bulletListStyle ] ] (List.map (\item -> li [] [ text item ]) (String.split "|" stringPartial))

    else if String.length stringPartial > 0 then
        p [] [ text stringPartial ]

    else
        text ""



-- Helpers to tag each fragment as list of items or plain text (False)


splitOnStartList : String -> List ( String, Bool )
splitOnStartList richText =
    let
        -- First we break the rich text string into a list,
        -- separating on <ul>, the start of a list
        beforeListPartials =
            String.split "<ul>" richText
    in
    List.concat (List.map (\partial -> splitOnEndList partial) beforeListPartials)


splitOnEndList : String -> List ( String, Bool )
splitOnEndList partial =
    if String.contains "</ul>" partial then
        let
            -- The closing </ul> means this is the end of a list,
            -- Break it into a list again to separate out the plain text that follows.
            subList =
                String.split "</ul>" partial
        in
        -- Since we already split on <ul>, the list will always have 2 items, but elm doesn't know that.
        -- The first item is the list part, the second (tail) is plain text.
        [ ( Maybe.withDefault "" (List.head subList), True )
        , ( Maybe.withDefault "" (List.head (List.reverse subList)), False )
        ]

    else
        -- The list items without a closing </ul> to mark end, are plain text strings.
        [ ( partial, False ) ]


bulletListStyle : Style
bulletListStyle =
    batch
        [ listStyle2 disc inside
        , paddingLeft (px 12)
        , paddingTop (px 12)
        ]



-- Helpers to render Copy.Text Strings with [keywords] marked in brackets as Html <b>


renderWithKeywords : String -> List (Html msg)
renderWithKeywords richText =
    List.map (\( words, isKeyword ) -> renderAsBoldOrText ( words, isKeyword )) (splitOnStartKeyword richText)


renderAsBoldOrText : ( String, Bool ) -> Html msg
renderAsBoldOrText ( stringPartial, isKeyword ) =
    if isKeyword then
        b [ css [ keywordStyle ] ] [ text stringPartial ]

    else
        text stringPartial



-- Helpers to tag each fragment as keyword (True) or plain text (False)


splitOnStartKeyword : String -> List ( String, Bool )
splitOnStartKeyword richText =
    let
        -- First we break the rich text string into a list,
        -- separating on [, the start of a bold word or phrase
        beforeBoldPartials =
            String.split "[" richText
    in
    List.concat (List.map (\partial -> splitOnEndKeyword partial) beforeBoldPartials)


splitOnEndKeyword : String -> List ( String, Bool )
splitOnEndKeyword partial =
    if String.contains "]" partial then
        let
            -- The closing ] means this is the end of a bold word or phrase,
            -- Break it into a list again to separate out the plain text that follows.
            subList =
                String.split "]" partial
        in
        -- Since we already split on [, the list will always have 2 items, but elm doesn't know that.
        -- The first item is the bold part, the second (tail) is plain text.
        [ ( Maybe.withDefault "" (List.head subList), True )
        , ( Maybe.withDefault "" (List.head (List.reverse subList)), False )
        ]

    else
        -- The list items without a closing ] to mark end of bold, are plain text strings.
        [ ( partial, False ) ]


keywordStyle : Style
keywordStyle =
    batch
        [ backgroundColor lightGreen
        ]
