module Route exposing (Direction(..), Route(..), fromUrl, renderNavLink, toString)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, a, img, span, text)
import Html.Styled.Attributes exposing (alt, css, href, src)
import Theme exposing (grey, lightPurple, purple, white)
import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Definition
    | GetHelp
    | HelpSelfGrid
    | HelpSelfSingle String
    | NotAlone


fromUrl : String -> Url.Url -> Maybe Route
fromUrl basePath url =
    { url | path = String.replace basePath "" url.path }
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Definition ->
            t DefinitionPageSlug

        GetHelp ->
            t GetHelpPageSlug

        HelpSelfGrid ->
            t HelpSelfGridPageSlug

        HelpSelfSingle single ->
            t HelpSelfGridPageSlug ++ "/" ++ single

        NotAlone ->
            t NotAlonePageSlug



-- links and buttons


type Direction
    = Back
    | Forward
    | None


renderNavLink : Direction -> Route -> Key -> Html msg
renderNavLink direction url copyKey =
    case direction of
        Back ->
            a [ href (toString url), css [ navLinkStyle ] ]
                [ img [ src "Arrow.svg", alt "", css [ backArrowStyle ] ] []
                , span [] [ text (t copyKey) ]
                ]

        Forward ->
            a [ href (toString url), css [ navLinkStyle ] ]
                [ span [] [ text (t copyKey) ]
                , img [ src "Arrow.svg", alt "", css [ forwardArrowStyle ] ] []
                ]

        None ->
            a [ href (toString url), css [ navLinkStyle ] ]
                [ span [] [ text (t copyKey) ]
                ]


navLinkStyle : Style
navLinkStyle =
    batch
        [ alignItems center
        , backgroundColor purple
        , borderRadius (rem 100)
        , color white
        , displayFlex
        , fontSize (rem 1)
        , fontWeight (int 700)
        , justifyContent center
        , minHeight (rem 3)
        , padding2 (rem 0.5) (rem 2)
        , textAlign center
        , textDecoration none
        , hover
            [ backgroundColor lightPurple
            , color grey
            ]
        , transition
            [ Css.Transitions.backgroundColor 200
            , Css.Transitions.color 200
            ]
        , withMedia [ only screen [ Media.minWidth (px 576) ] ]
            [ minHeight (rem 4) ]
        ]


forwardArrowStyle : Style
forwardArrowStyle =
    batch
        [ height (rem 1.8)
        , marginLeft (rem 1.2)
        ]


backArrowStyle : Style
backArrowStyle =
    batch
        [ height (rem 1.8)
        , marginRight (rem 1.2)
        , transform (rotate (deg 180))
        ]



-- Internal helpers


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map NotAlone Parser.top
        , Parser.map Definition (Parser.s (t DefinitionPageSlug))
        , Parser.map GetHelp (Parser.s (t GetHelpPageSlug))
        , Parser.map HelpSelfGrid (Parser.s (t HelpSelfGridPageSlug))
        , Parser.map HelpSelfSingle (Parser.s "help-self" </> string)
        ]
