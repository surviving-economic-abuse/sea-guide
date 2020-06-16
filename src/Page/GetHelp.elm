module Page.GetHelp exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


view : Html never
view =
    div []
        [ div [] [ text "Get Help page" ]
        , a [ href "help-self" ] [ text "Find out more" ]
        ]
