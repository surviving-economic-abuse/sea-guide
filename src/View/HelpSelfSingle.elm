module View.HelpSelfSingle exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, a, blockquote, button, div, h1, h2, header, li, nav, p, span, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Page.HelpSelfSingle exposing (CategoryResource, Model, Msg(..), categoryKeysFromSlug, resourceIsExpanded)
import Route exposing (Direction(..), Route(..), renderNavLink, toString)
import Theme exposing (globalStyles, grey, lightGrey, navItemStyles, navLinkStyle, navListStyle, pageHeadingStyle, purple, verticalSpacing, white)


view : String -> Model -> Html Msg
view slug model =
    let
        categoryData =
            categoryKeysFromSlug slug
    in
    div []
        [ globalStyles
        , header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t categoryData.title) ]
            , case categoryData.resources of
                Just resources ->
                    div [] [ renderResourceList model resources ]

                Nothing ->
                    text ""
            ]
        , verticalSpacing
        , nav [ css [ navListStyle ] ]
            [ renderNavLink Back HelpSelfGridPageSlug ToHelpSelfFromSingleCategoryLink
            ]
        ]


renderResourceList : Model -> List CategoryResource -> Html Msg
renderResourceList model resources =
    ul [ css [ resourceListStyle ] ]
        (List.map
            (\resource ->
                if resourceIsExpanded model resource.title then
                    li [ css [ expanderItemStyle ] ]
                        [ button [ onClick (ToggleResource resource.title), css [ expanderButtonStyle ] ]
                            [ h2 [ css [ expanderHeadingStyle ] ] [ text (t resource.title) ]
                            , span [ css [ expanderSymbolStyle, rotate90Style ] ] [ text ">" ]
                            ]
                        , div [ css expanderDefinitionStyle ]
                            ([]
                                ++ renderResourceDetails resource
                            )
                        ]

                else
                    li [ css [ expanderItemStyle ] ]
                        [ button [ onClick (ToggleResource resource.title), css [ expanderButtonStyle ] ]
                            [ h2 [ css [ expanderHeadingStyle ] ] [ text (t resource.title) ]
                            , span [ css [ expanderSymbolStyle ] ] [ text ">" ]
                            ]
                        ]
            )
            resources
        )


renderResourceDetails : CategoryResource -> List (Html msg)
renderResourceDetails resource =
    renderQuotes resource.quotes
        ++ [ verticalSpacing
           , p [] [ text (t resource.summary) ]
           , verticalSpacing
           ]
        ++ renderPdfDownload resource


renderPdfDownload : CategoryResource -> List (Html msg)
renderPdfDownload resource =
    [ text (t HelpSelfPdfDownloadLabel ++ " ")
    , a [ href (t resource.linkHref), css [ resourceLinkStyle ] ] [ text (t resource.linkName) ]
    ]


renderQuotes : List Key -> List (Html msg)
renderQuotes quoteKeys =
    List.map (\quoteKey -> blockquote [] [ p [ css [ quoteStyle ] ] [ text (t quoteKey) ] ]) quoteKeys


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


expanderDefinitionStyle : List Style
expanderDefinitionStyle =
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


resourceLinkStyle : Style
resourceLinkStyle =
    batch
        [ color purple
        , fontWeight (int 700)
        ]


resourceListStyle : Style
resourceListStyle =
    batch
        [ listStyle none ]
