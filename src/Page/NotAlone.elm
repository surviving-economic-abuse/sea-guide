module Page.NotAlone exposing (Model, Msg, init, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


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


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (t NotAloneTitle) ]
        , a [ href (t DefinitionPageSlug) ] [ text (t ToDefinitionFromNotAloneLink) ]
        ]
