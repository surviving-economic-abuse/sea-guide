module View.Definition exposing (renderWithKeywords, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, b, blockquote, button, dd, div, dl, dt, h1, h2, header, img, li, nav, p, text, ul)
import Html.Styled.Attributes exposing (alt, css, src)
import Html.Styled.Events exposing (onClick)
import Page.Definition exposing (CategoryDefinition, DefinitionCategory(..), Model, Msg(..), categoryIsExpanded, categoryKeysFromListPosition)
import Route exposing (Direction(..), Route(..), renderNavLink)
import String
import Theme exposing (container, containerContent, expanderButtonStyle, expanderClosedStyle, expanderDefinitionStyles, expanderHeadingStyle, expanderItemStyle, expanderOpenStyle, expanderSymbolStyle, lightGreen, navItemStyles, navListStyle, pageHeadingStyle, quoteStyle, rotate90Style, verticalSpacing)


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
        , verticalSpacing 2
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
            [ button [ onClick (ToggleCategory category.title), css [ expanderButtonStyle, expanderOpenStyle ] ]
                [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
                , img [ css [ expanderSymbolStyle, rotate90Style ], src "/Arrow.svg", alt "" ] []
                ]
            ]

    else
        dt [ css [ expanderItemStyle ] ]
            [ button [ onClick (ToggleCategory category.title), css [ expanderButtonStyle, expanderClosedStyle ] ]
                [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
                , img [ css [ expanderSymbolStyle ], src "/Arrow.svg", alt "" ] []
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
        [ margin2 (rem 2) (rem 1) ]


introStyle : Style
introStyle =
    batch
        [ margin2 (rem 2) (rem 1) ]


keywordStyle : Style
keywordStyle =
    batch
        [ backgroundColor lightGreen
        ]
