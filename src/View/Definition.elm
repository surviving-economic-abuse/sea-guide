module View.Definition exposing (renderWithKeywords, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, b, blockquote, button, dd, div, dl, dt, h1, h2, header, li, nav, p, span, text, ul)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Page.Definition exposing (CategoryDefinition, DefinitionCategory(..), Model, Msg(..), categoryIsExpanded, categoryKeysFromListPosition)
import Route exposing (Direction(..), Route(..), renderNavLink)
import String
import Theme exposing (container, containerContent, grey, lightGreen, lightGrey, navItemStyles, navListStyle, pageHeadingStyle, purple, verticalSpacing, white)


view : Model -> Html Msg
view model =
    div []
        [ containerContent
            [ header []
                [ h1 [ css [ pageHeadingStyle ] ] [ text (t DefinitionTitle) ]
                , div [ css [ introStyle ] ]
                    [ p [] (renderWithKeywords (t DefinitionConciseP1))
                    , p [] (renderWithKeywords (t DefinitionConciseP2))
                    , p [] (renderWithKeywords (t DefinitionConciseP3))
                    , p [] (renderWithKeywords (t DefinitionConciseP4))
                    ]
                ]
            , dl [ css [ categoryListStyle ] ]
                (renderExpandableCategories
                    model
                    [ DefinitionCategory1
                    , DefinitionCategory2
                    , DefinitionCategory3
                    , DefinitionCategory4
                    , DefinitionCategory5
                    , DefinitionCategory6
                    ]
                )
            ]
        , container
            [ p [ css [ marginBottom (rem 1), textAlign center ] ] [ text (t SplitterAffirmation) ]
            , nav []
                [ ul [ css [ navListStyle ] ]
                    [ li [ css navItemStyles ]
                        [ renderNavLink Forward HelpSelfGrid ToHelpSelfFromDefinitionLink
                        ]
                    , li [ css navItemStyles ]
                        [ renderNavLink Forward GetHelp ToGetHelpFromDefinitionLink
                        ]
                    ]
                ]
            ]
        ]


renderQuotes : List Key -> Html Msg
renderQuotes quoteKeys =
    blockquote [] (List.map (\quoteKey -> p [ css [ quoteStyle ] ] [ text (t quoteKey) ]) quoteKeys)


renderExpandableCategories : Model -> List DefinitionCategory -> List (Html Msg)
renderExpandableCategories model categories =
    List.map
        (\listPosition ->
            -- We maybe want to ditch this div for valid html - but this is simple
            div []
                [ renderTerm model (categoryKeysFromListPosition listPosition)
                , renderDefinition model (categoryKeysFromListPosition listPosition)
                ]
        )
        categories


renderTerm : Model -> CategoryDefinition -> Html Msg
renderTerm model category =
    if categoryIsExpanded model category.title then
        dt [ css [ expanderItemStyle ] ]
            [ button [ onClick (ToggleCategory category.title), css [ expanderButtonStyle ] ]
                [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
                , span [ css [ expanderSymbolStyle, rotate90Style ] ] [ text ">" ]
                ]
            ]

    else
        dt [ css [ expanderItemStyle ] ]
            [ button [ onClick (ToggleCategory category.title), css [ expanderButtonStyle ] ]
                [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
                , span [ css [ expanderSymbolStyle ] ] [ text ">" ]
                ]
            ]


renderDefinition : Model -> CategoryDefinition -> Html Msg
renderDefinition model category =
    if categoryIsExpanded model category.title then
        dd [ css expanderDefinitionStyles ]
            [ p [] (renderWithKeywords (t category.info))
            , verticalSpacing 2
            , renderQuotes category.quotes
            ]

    else
        text ""



-- Helpers to render Copy.Text Strings with [keywords] marked in brackets as Html <b>


renderWithKeywords : String -> List (Html Msg)
renderWithKeywords richText =
    List.map (\( words, isKeyword ) -> renderAsBoldOrText ( words, isKeyword )) (splitOnStartKeyword richText)


renderAsBoldOrText : ( String, Bool ) -> Html Msg
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



-- Styles


categoryListStyle : Style
categoryListStyle =
    batch
        [ margin2 (rem 2) zero ]


introStyle : Style
introStyle =
    batch
        [ color purple
        , fontSize (rem 1)
        , margin2 (rem 2) zero
        ]


keywordStyle : Style
keywordStyle =
    batch
        [ backgroundColor lightGreen
        ]


expanderButtonStyle : Style
expanderButtonStyle =
    batch
        [ alignItems center
        , backgroundColor purple
        , border zero
        , cursor pointer
        , justifyContent spaceBetween
        , textAlign left
        , displayFlex
        , padding (rem 0.5)
        , width (pct 100)
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
        [ color white
        , flex3 zero (int 1) (rem 3)
        , textAlign center
        , fontWeight (int 700)
        , fontSize (rem 2.5)
        , lineHeight (int 1)
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
        [ backgroundColor lightGrey
        , border3 (px 1) solid grey
        , borderBottomLeftRadius (rem 1)
        , borderBottomRightRadius (rem 1)
        , padding (rem 1)
        ]

    -- Allow more padding space on larger screens
    , withMedia [ only screen [ Media.minWidth (px 576) ] ]
        [ padding (rem 2) ]
    ]


quoteStyle : Style
quoteStyle =
    batch
        [ borderLeft3 (px 5) solid grey
        , borderRadius (px 5)
        , fontSize (rem 1.1)
        , fontStyle italic
        , fontWeight (int 300)
        , paddingLeft (px 10)
        , before [ property "content" "'\"'" ]
        , after [ property "content" "'\"'" ]
        ]
