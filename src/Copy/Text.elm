module Copy.Text exposing (t)

import Copy.Keys exposing (Key(..))



-- The translate function


t : Key -> String
t key =
    case key of
        SiteTitle ->
            "[cCc] SEA MAP"
