module View.Definition exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, a, blockquote, button, dd, div, dl, dt, h1, h2, header, li, nav, p, span, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Page.Definition exposing (CategoryDefinition, DefinitionCategory(..), Model, Msg(..), categoryIsExpanded, categoryKeysFromListPosition)
import Route exposing (Route(..), toString)
import Theme exposing (grey, lightGrey, navLinkStyle, pageHeadingStyle, purple, verticalSpacing, white)


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t DefinitionTitle) ]
            , div [ css [ introStyle ] ]
                [ p [] [ text (t DefinitionConciseP1) ]
                , p [] [ text (t DefinitionConciseP2) ]
                , p []
                    [ text (t DefinitionConciseP3)
                    , text " "
                    , a [ href (t HelpSelfGridPageSlug ++ "/" ++ t HelpSelfInfoLawSlug) ]
                        [ text (t DefinitionMoreLink) ]
                    ]
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
        , p [] [ text (t SplitterAffirmation) ]
        , verticalSpacing
        , nav []
            [ ul [ css [ navListStyle ] ]
                [ li [ css navItemStyles ]
                    [ a [ href (Route.toString HelpSelfGrid), css [ navLinkStyle ] ]
                        [ span [] [ text (t ToHelpSelfFromDefinitionLink) ] ]
                    ]
                , li [ css navItemStyles ]
                    [ a [ href (Route.toString GetHelp), css [ navLinkStyle ] ]
                        [ span [] [ text (t ToGetHelpFromDefinitionLink) ] ]
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
            [ p [] [ text (t category.info) ]
            , verticalSpacing
            , renderQuotes category.quotes
            ]

    else
        text ""


categoryListStyle : Style
categoryListStyle =
    batch
        [ margin2 (rem 2) zero ]


introStyle : Style
introStyle =
    batch
        [ color purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1)
        , margin2 (rem 2) zero
        ]



-- End of page navigation styling


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
            [ flex3 zero zero (pct 33) ]
        ]
    ]


expanderButtonStyle : Style
expanderButtonStyle =
    batch
        [ alignItems center
        , backgroundColor (hex "4f2f8d")
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
