module Page.Definition exposing (CategoryDefinition, DefinitionCategory(..), Model, Msg(..), categoryIsExpanded, categoryKeysFromListPosition, update)

import Analytics exposing (updateAnalytics, updateAnalyticsEvent)
import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Set


type alias Model =
    { openCategories : Set.Set String }


type Msg
    = NoOp
    | ToggleCategory Bool Key


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleCategory hasConsented categoryTitle ->
            let
                actionData =
                    if categoryIsExpanded model categoryTitle then
                        { do = Set.remove, action = "closed" }

                    else
                        { do = Set.insert, action = "opened" }
            in
            ( { model | openCategories = actionData.do (t categoryTitle) model.openCategories }
            , updateAnalytics hasConsented
                (updateAnalyticsEvent
                    { category = t DefinitionPageSlug
                    , action = actionData.action
                    , label = t categoryTitle
                    }
                )
            )


categoryIsExpanded : Model -> Key -> Bool
categoryIsExpanded model titleKey =
    Set.member (t titleKey) model.openCategories


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
    | DefinitionCategory6


categoryKeysFromListPosition : DefinitionCategory -> CategoryDefinition
categoryKeysFromListPosition listPosition =
    case listPosition of
        DefinitionCategory1 ->
            { title = DefinitionCategory1Title
            , info = DefinitionCategory1Info
            , quotes =
                [ DefinitionCategory1Quote1
                , DefinitionCategory1Quote2
                ]
            }

        DefinitionCategory2 ->
            { title = DefinitionCategory2Title
            , info = DefinitionCategory2Info
            , quotes =
                [ DefinitionCategory2Quote1
                , DefinitionCategory2Quote2
                ]
            }

        DefinitionCategory3 ->
            { title = DefinitionCategory3Title
            , info = DefinitionCategory3Info
            , quotes =
                [ DefinitionCategory3Quote1
                , DefinitionCategory3Quote2
                ]
            }

        DefinitionCategory4 ->
            { title = DefinitionCategory4Title
            , info = DefinitionCategory4Info
            , quotes =
                [ DefinitionCategory4Quote1
                , DefinitionCategory4Quote2
                ]
            }

        DefinitionCategory5 ->
            { title = DefinitionCategory5Title
            , info = DefinitionCategory5Info
            , quotes =
                [ DefinitionCategory5Quote1
                , DefinitionCategory5Quote2
                ]
            }

        DefinitionCategory6 ->
            { title = DefinitionCategory6Title
            , info = DefinitionCategory6Info
            , quotes =
                [ DefinitionCategory6Quote1
                , DefinitionCategory6Quote2
                ]
            }
