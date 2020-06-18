module Page.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


view : Html never
view =
    div []
        [ div [] [ text "Get Help page" ]
        , a [ href (t HelpSelfPageSlug) ] [ text "Find out more" ]
        ]
