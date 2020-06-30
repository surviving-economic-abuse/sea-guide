module Page.Definition exposing (Model, Msg, init, update, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, a, div, h1, h2, header, li, nav, p, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Theme exposing (colours, pageHeadingStyle)


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
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t DefinitionTitle) ]
            , p [ css [ introStyle ] ]
                [ text (t DefinitionConcise)
                , text " "
                , a [ href (t StatsOnEconomicAbuseHref) ] [ text (t DefinitionMoreLink) ]
                ]
            ]
        , ul []
            [ li [ css [ categoryStyle ] ] [ h2 [] [ text (t DefinitionCategory1Title) ] ]
            , li [ css [ categoryStyle ] ] [ h2 [] [ text (t DefinitionCategory2Title) ] ]
            , li [ css [ categoryStyle ] ] [ h2 [] [ text (t DefinitionCategory3Title) ] ]
            , li [ css [ categoryStyle ] ] [ h2 [] [ text (t DefinitionCategory4Title) ] ]
            , li [ css [ categoryStyle ] ] [ h2 [] [ text (t DefinitionCategory5Title) ] ]
            ]
        , p []
            [ text (t SplitterAffirmation) ]
        , nav
            [ css [ navStyle ] ]
            [ ul [ css [ navListStyle ] ]
                [ li [ css [ navItemStyle ] ]
                    [ a [ href (t HelpSelfGridPageSlug), css [ linkStyle ] ] [ text (t ToHelpSelfFromDefinitionLink) ]
                    , p [] [ text "[cCc] Additional text here." ]
                    ]
                , li [ css [ navItemStyle ] ]
                    [ a [ href (t GetHelpPageSlug), css [ linkStyle ] ] [ text (t ToGetHelpFromDefinitionLink) ]
                    , p [] [ text "[cCc] Additional text here." ]
                    ]
                ]
            ]
        ]


categoryStyle : Style
categoryStyle =
    Css.batch
        [ margin2 (rem 2) zero ]


introStyle : Style
introStyle =
    Css.batch
        [ color colours.purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , margin2 (rem 2) zero
        ]



-- End of page navigation styling


navStyle : Style
navStyle =
    Css.batch
        [ margin2 (rem 2) zero
        ]


navListStyle : Style
navListStyle =
    Css.batch
        [ listStyle none
        , displayFlex
        , flexWrap wrap
        ]


navItemStyle : Style
navItemStyle =
    Css.batch
        [ Css.borderRadius (rem 1)
        , flex3 (int 1) zero (pct 100)
        , margin2 (rem 1) zero
        ]


linkStyle : Style
linkStyle =
    Css.batch
        [ fontWeight bold
        , margin2 (rem 2) zero
        ]
