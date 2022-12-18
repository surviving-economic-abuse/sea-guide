module FooterContent exposing (renderCopyright)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)
import Message exposing (Msg(..))
import Theme exposing (shadowGrey, withMediaMobile)


renderCopyright : String -> Html Msg
renderCopyright yearNow =
    div [ css [ copyrightStyle ] ] [ text (t (CopyrightText yearNow)) ]


copyrightStyle : Style
copyrightStyle =
    batch
        [ color shadowGrey
        , marginTop (px -25)
        , textAlign center
        , withMediaMobile
            [ fontSize (rem 0.8)
            , paddingRight (px 4)
            , textAlign right
            ]
        ]
