module Page.HelpSelfSingle exposing (Model, Msg(..), update, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, a, blockquote, button, div, h1, h2, header, li, nav, p, span, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Set
import Theme exposing (colours, navItemStyles, navLinkStyle, navListStyle, pageHeadingStyle, verticalSpacing)


type alias Model =
    { openResources : Set.Set String }


type Msg
    = NoOp
    | ToggleResource Key


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleResource resourceTitle ->
            let
                action =
                    if isExpanded model resourceTitle then
                        Set.remove

                    else
                        Set.insert
            in
            ( { model | openResources = action (t resourceTitle) model.openResources }, Cmd.none )


view : String -> Model -> Html Msg
view slug model =
    let
        categoryData =
            categoryKeysFromSlug slug
    in
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t categoryData.title) ]
            , case categoryData.resources of
                Just resources ->
                    div [] [ renderResourceList model resources ]

                Nothing ->
                    text ""
            ]
        , verticalSpacing
        , nav [ css [ navListStyle ] ]
            [ a
                [ href ("../" ++ t HelpSelfGridPageSlug), css (navLinkStyle :: navItemStyles) ]
                [ span [] [ text (t ToHelpSelfFromSingleCategoryLink) ] ]
            ]
        ]


renderResourceList : Model -> List CategoryResource -> Html Msg
renderResourceList model resources =
    ul [ css [ resourceListStyle ] ]
        (List.map
            (\resource ->
                if isExpanded model resource.title then
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
           , a [ href (t resource.linkHref), css [ resourceLinkStyle ] ] [ text (t resource.linkName) ]
           ]


renderQuotes : List Key -> List (Html msg)
renderQuotes quoteKeys =
    List.map (\quoteKey -> blockquote [] [ p [ css [ quoteStyle ] ] [ text (t quoteKey) ] ]) quoteKeys


isExpanded : Model -> Key -> Bool
isExpanded model titleKey =
    Set.member (t titleKey) model.openResources


type alias CategoryResource =
    { title : Key
    , quotes : List Key
    , summary : Key
    , linkName : Key
    , linkHref : Key
    }


type alias CategoryData =
    { title : Key
    , resources : Maybe (List CategoryResource)
    }


categoryKeysFromSlug : String -> CategoryData
categoryKeysFromSlug slug =
    if slug == t HelpSelfCategory1Slug then
        { title = HelpSelfCategory1Title
        , resources =
            Just
                [ { title = HelpSelfCategory1Resource1Title
                  , quotes = [ HelpSelfCategory1Resource1Quote1, HelpSelfCategory1Resource1Quote2 ]
                  , summary = HelpSelfCategory1Resource1Summary
                  , linkName = HelpSelfCategory1Resource1Link
                  , linkHref = HelpSelfCategory1Resource1Href
                  }
                ]
        }

    else if slug == t HelpSelfCategory2Slug then
        { title = HelpSelfCategory2Title
        , resources =
            Just
                [ { title = HelpSelfCategory2Resource1Title
                  , quotes = [ HelpSelfCategory2Resource1Quote1, HelpSelfCategory2Resource1Quote2 ]
                  , summary = HelpSelfCategory2Resource1Summary
                  , linkName = HelpSelfCategory2Resource1Link
                  , linkHref = HelpSelfCategory2Resource1Href
                  }
                , { title = HelpSelfCategory2Resource2Title
                  , quotes = [ HelpSelfCategory2Resource2Quote1, HelpSelfCategory2Resource2Quote2 ]
                  , summary = HelpSelfCategory2Resource2Summary
                  , linkName = HelpSelfCategory2Resource2Link
                  , linkHref = HelpSelfCategory2Resource2Href
                  }
                , { title = HelpSelfCategory2Resource3Title
                  , quotes = [ HelpSelfCategory2Resource3Quote1, HelpSelfCategory2Resource3Quote2 ]
                  , summary = HelpSelfCategory2Resource3Summary
                  , linkName = HelpSelfCategory2Resource3Link
                  , linkHref = HelpSelfCategory2Resource3Href
                  }
                ]
        }

    else if slug == t HelpSelfCategory3Slug then
        { title = HelpSelfCategory3Title
        , resources =
            Just
                [ { title = HelpSelfCategory3Resource1Title
                  , quotes = [ HelpSelfCategory3Resource1Quote1, HelpSelfCategory3Resource1Quote2 ]
                  , summary = HelpSelfCategory3Resource1Summary
                  , linkName = HelpSelfCategory3Resource1Link
                  , linkHref = HelpSelfCategory3Resource1Href
                  }
                , { title = HelpSelfCategory3Resource2Title
                  , quotes = [ HelpSelfCategory3Resource2Quote1, HelpSelfCategory3Resource2Quote2 ]
                  , summary = HelpSelfCategory3Resource2Summary
                  , linkName = HelpSelfCategory3Resource2Link
                  , linkHref = HelpSelfCategory3Resource2Href
                  }
                ]
        }

    else if slug == t HelpSelfCategory4Slug then
        { title = HelpSelfCategory4Title
        , resources = Nothing
        }

    else if slug == t HelpSelfCategory5Slug then
        { title = HelpSelfCategory5Title
        , resources = Nothing
        }

    else
        { title = HelpSelfCategoryNotFoundTitle
        , resources = Nothing
        }


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
        [ color colours.white
        , fontSize (rem 1.25)
        , flex2 (int 1) (int 1)
        ]


expanderSymbolStyle : Style
expanderSymbolStyle =
    batch
        [ color colours.white
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
        [ backgroundColor colours.lightgrey
        , border3 (px 1) solid colours.midgrey
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
        [ borderLeft3 (px 5) solid colours.midgrey
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
        [ color colours.purple
        , fontWeight (int 700)
        ]


resourceListStyle : Style
resourceListStyle =
    batch
        [ listStyle none ]
