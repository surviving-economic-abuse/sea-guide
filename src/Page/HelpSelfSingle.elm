module Page.HelpSelfSingle exposing (Model, Msg, init, view)

import Copy.Keys exposing (..)
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Theme exposing (pageHeadingStyle)


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : String -> Model -> Html msg
view category model =
    let
        categoryData =
            getCategoryKeys category
    in
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t categoryData.title) ]
            ]
        , ul []
            [ li [] [ a [ href (t GetHelpPageSlug) ] [ text "Get Help" ] ]
            , li [] [ a [ href (t NotAlonePageSlug) ] [ text "Read about others" ] ]
            , li [] [ a [ href (t DefinitionPageSlug) ] [ text "What is Economic Abuse" ] ]
            ]
        ]


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


getCategoryKeys : String -> CategoryData
getCategoryKeys category =
    if category == t HelpSelfCategory1Slug then
        { title = HelpSelfCategory1Title
        , resources = Nothing
        }

    else if category == t HelpSelfCategory2Slug then
        { title = HelpSelfCategory2Title
        , resources = Nothing
        }

    else if category == t HelpSelfCategory3Slug then
        { title = HelpSelfCategory3Title
        , resources = Nothing
        }

    else if category == t HelpSelfCategory4Slug then
        { title = HelpSelfCategory4Title
        , resources = Nothing
        }

    else if category == t HelpSelfCategory5Slug then
        { title = HelpSelfCategory5Title
        , resources = Nothing
        }

    else
        { title = HelpSelfCategoryNotFoundTitle
        , resources = Nothing
        }
