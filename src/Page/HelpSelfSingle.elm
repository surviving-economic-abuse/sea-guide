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
    List.map (\quoteKey -> blockquote [] [ p [ css quoteStyles ] [ text (t quoteKey) ] ]) quoteKeys


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
    if slug == t HelpSelfBankingSlug then
        { title = HelpSelfBankingTitle
        , resources =
            Just
                [ { title = HelpSelfBankingResource1Title
                  , quotes = [ HelpSelfBankingResource1Quote1, HelpSelfBankingResource1Quote2 ]
                  , summary = HelpSelfBankingResource1Summary
                  , linkName = HelpSelfBankingResource1Link
                  , linkHref = HelpSelfBankingResource1Href
                  }
                ]
        }

    else if slug == t HelpSelfDebtSlug then
        { title = HelpSelfDebtTitle
        , resources =
            Just
                [ { title = HelpSelfDebtResource1Title
                  , quotes = [ HelpSelfDebtResource1Quote1, HelpSelfDebtResource1Quote2 ]
                  , summary = HelpSelfDebtResource1Summary
                  , linkName = HelpSelfDebtResource1Link
                  , linkHref = HelpSelfDebtResource1Href
                  }
                , { title = HelpSelfDebtResource2Title
                  , quotes = [ HelpSelfDebtResource2Quote1, HelpSelfDebtResource2Quote2 ]
                  , summary = HelpSelfDebtResource2Summary
                  , linkName = HelpSelfDebtResource2Link
                  , linkHref = HelpSelfDebtResource2Href
                  }
                , { title = HelpSelfDebtResource3Title
                  , quotes = [ HelpSelfDebtResource3Quote1, HelpSelfDebtResource3Quote2 ]
                  , summary = HelpSelfDebtResource3Summary
                  , linkName = HelpSelfDebtResource3Link
                  , linkHref = HelpSelfDebtResource3Href
                  }
                ]
        }

    else if slug == t HelpSelfHousingSlug then
        { title = HelpSelfHousingTitle
        , resources =
            Just
                [ { title = HelpSelfHousingResource1Title
                  , quotes = [ HelpSelfHousingResource1Quote1, HelpSelfHousingResource1Quote2 ]
                  , summary = HelpSelfHousingResource1Summary
                  , linkName = HelpSelfHousingResource1Link
                  , linkHref = HelpSelfHousingResource1Href
                  }
                , { title = HelpSelfHousingResource2Title
                  , quotes = [ HelpSelfHousingResource2Quote1, HelpSelfHousingResource2Quote2 ]
                  , summary = HelpSelfHousingResource2Summary
                  , linkName = HelpSelfHousingResource2Link
                  , linkHref = HelpSelfHousingResource2Href
                  }
                ]
        }

    else if slug == t HelpSelfFinancialSlug then
        { title = HelpSelfFinancialTitle
        , resources = Nothing
        }

    else if slug == t HelpSelfCovidSlug then
        { title = HelpSelfCovidTitle
        , resources = Nothing
        }

    else if slug == t HelpSelfInfoLawSlug then
        { title = HelpSelfInfoLawTitle
        , resources = Nothing
        }

    else if slug == t HelpSelfSeparatingSlug then
        { title = HelpSelfSeparatingTitle
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
        , borderBottomLeftRadius (rem 1)
        , borderBottomRightRadius (rem 1)
        , padding (rem 1)
        ]

    -- Allow more padding space on larger screens
    , withMedia [ only screen [ Media.minWidth (px 576) ] ]
        [ padding (rem 2) ]
    ]


quoteStyles : List Style
quoteStyles =
    [ batch
        [ fontSize (rem 1.1)
        , fontWeight (int 300)
        ]
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
