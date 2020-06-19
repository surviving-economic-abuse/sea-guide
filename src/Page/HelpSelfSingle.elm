module Page.HelpSelfSingle exposing (Model, Msg, init, view)

import Copy.Keys exposing (..)
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Page.HelpSelfGrid exposing (Category(..), categoryFromString)
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
            getCategoryStrings category
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


type alias CategoryData =
    { title : Key }


getCategoryStrings : String -> CategoryData
getCategoryStrings category =
    case categoryFromString category of
        COVID ->
            { title = HelpSelfCategory1Title }

        _ ->
            { title = HelpSelfCategory2Title }
