module Theme exposing (colours)

import Css exposing (Color, hex)


colours : { purple : Color, green : Color, teal : Color, grey : Color }
colours =
    { purple = hex "4F2F8D"
    , green = hex "9CCC54"
    , teal = hex "3CC0BE"
    , grey = hex "58585A"
    }
