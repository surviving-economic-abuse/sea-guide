module Page.GetHelp exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, pageHeadingStyle)


view : Html never
view =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text "Get Help page" ]
            ]
        , div [ css [ columnStyle ] ]
            [ card "SEA-MAP" "#" "link destination"
            , card "SEA-MAP" "#" "link destination"
            , card "SEA-MAP" "#" "link destination"
            ]
        , a [ href (t HelpSelfPageSlug) ] [ text "Find out more" ]
        ]


columnStyle : Style
columnStyle =
    batch
        [ displayFlex
        , flexDirection column
        ]


card : String -> String -> String -> Html msg
card name link linktext =
    div []
        [ p []
            [ text name ]
        , a
            [ href link ]
            [ text linktext ]
        ]
