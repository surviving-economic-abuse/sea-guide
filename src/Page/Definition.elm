module Page.Definition exposing (Model, Msg(..), update, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, a, button, div, h1, h2, header, li, p, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Set
import Theme exposing (colours, pageHeadingStyle)


type alias Model =
    { openCategories : Set.Set String }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { openCategories = Set.empty }
    , Cmd.none
    )


type Msg
    = NoOp
    | ToggleCategory Key


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleCategory aTitle ->
            let
                action =
                    if isExpanded model aTitle then
                        Set.remove

                    else
                        Set.insert
            in
            ( { model | openCategories = action (t aTitle) model.openCategories }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t DefinitionTitle) ]
            , p [ css [ introStyle ] ]
                [ text (t DefinitionConcise)
                , text " "
                , a [ href (t StatsOnEconomicAbuseHref) ] [ text (t DefinitionMoreLink) ]
                ]
            ]
        , ul []
            [ expandableCategory model DefinitionCategory1
            , expandableCategory model DefinitionCategory2
            , expandableCategory model DefinitionCategory3
            , expandableCategory model DefinitionCategory4
            , expandableCategory model DefinitionCategory5
            ]
        , p [] [ text (t SplitterAffirmation) ]
        , ul []
            [ li [] [ a [ href (t HelpSelfGridPageSlug) ] [ text (t ToHelpSelfFromDefinitionLink) ] ]
            , li [] [ a [ href (t GetHelpPageSlug) ] [ text (t ToGetHelpFromDefinitionLink) ] ]
            ]
        ]


renderQuotes : List Key -> Html Msg
renderQuotes quoteKeys =
    div [] (List.map (\quoteKey -> p [] [ text (t quoteKey) ]) quoteKeys)


expandableCategory : Model -> DefinitionCategory -> Html Msg
expandableCategory model listPosition =
    let
        category =
            categoryKeysFromListPosition listPosition
    in
    li [ css [ categoryStyle ] ]
        [ h2 [] [ button [ onClick (ToggleCategory category.title) ] [ text (t category.title) ] ]
        , if isExpanded model category.title then
            div []
                [ p [] [ text (t category.info) ]
                , renderQuotes category.quotes
                ]

          else
            text ""
        ]


isExpanded : Model -> Key -> Bool
isExpanded model titleKey =
    if Set.member (t titleKey) model.openCategories then
        True

    else
        False


type alias CategoryDefinition =
    { title : Key
    , info : Key
    , quotes : List Key
    }



-- There are 5 list positions available


type DefinitionCategory
    = DefinitionCategory1
    | DefinitionCategory2
    | DefinitionCategory3
    | DefinitionCategory4
    | DefinitionCategory5


categoryKeysFromListPosition : DefinitionCategory -> CategoryDefinition
categoryKeysFromListPosition listPosition =
    case listPosition of
        DefinitionCategory1 ->
            { title = DefinitionCategory1Title
            , info = DefinitionCategory1Info
            , quotes =
                [ DefinitionCategory1Quote1
                , DefinitionCategory1Quote2
                , DefinitionCategory1Quote3
                ]
            }

        DefinitionCategory2 ->
            { title = DefinitionCategory2Title
            , info = DefinitionCategory2Info
            , quotes =
                [ DefinitionCategory2Quote1
                , DefinitionCategory2Quote2
                , DefinitionCategory2Quote3
                ]
            }

        DefinitionCategory3 ->
            { title = DefinitionCategory3Title
            , info = DefinitionCategory3Info
            , quotes =
                [ DefinitionCategory3Quote1
                , DefinitionCategory3Quote2
                , DefinitionCategory3Quote3
                ]
            }

        DefinitionCategory4 ->
            { title = DefinitionCategory4Title
            , info = DefinitionCategory4Info
            , quotes =
                [ DefinitionCategory4Quote1
                , DefinitionCategory4Quote2
                , DefinitionCategory4Quote3
                ]
            }

        DefinitionCategory5 ->
            { title = DefinitionCategory5Title
            , info = DefinitionCategory5Info
            , quotes =
                [ DefinitionCategory5Quote1
                , DefinitionCategory5Quote2
                , DefinitionCategory5Quote3
                ]
            }


categoryStyle : Style
categoryStyle =
    Css.batch
        [ margin2 (rem 2) zero ]


introStyle : Style
introStyle =
    Css.batch
        [ color colours.purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , margin2 (rem 2) zero
        ]
