module Main exposing (main)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)
import Page.Definition as Definition
import Page.GetHelp as GetHelp
import Page.HelpSelf as HelpSelf
import Page.NotAlone as NotAlone
import Theme exposing (colours, globalStyles)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = viewDocument
        }


type alias Model =
    { page : Page }


type Page
    = Definition Definition.Model
    | GetHelp
    | HelpSelf HelpSelf.Model
    | NotAlone NotAlone.Model


init : () -> ( Model, Cmd Msg )
init _ =
    ( { page = NotAlone NotAlone.Model }
    , Cmd.none
    )


type Msg
    = NoOp
    | DefinitionMsg Definition.Msg
    | HelpSelfMsg HelpSelf.Msg
    | NotAloneMsg NotAlone.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        DefinitionMsg subMsg ->
            ( model, Cmd.none )

        HelpSelfMsg subMsg ->
            ( model, Cmd.none )

        NotAloneMsg subMsg ->
            ( model, Cmd.none )


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = "[cCc] SEA-MAP App", body = [ view model |> Html.Styled.toUnstyled ] }


view : Model -> Html Msg
view model =
    case model.page of
        Definition definition ->
            layout [] [ globalStyles, Html.Styled.map DefinitionMsg (Definition.view definition) ]

        GetHelp ->
            layout [] [ globalStyles, Html.Styled.map (\_ -> NoOp) GetHelp.view ]

        HelpSelf helpSelf ->
            layout [] [ globalStyles, Html.Styled.map HelpSelfMsg (HelpSelf.view helpSelf) ]

        NotAlone notAlone ->
            layout [] [ globalStyles, Html.Styled.map NotAloneMsg (NotAlone.view notAlone) ]


layout : List (Attribute msg) -> List (Html msg) -> Html msg
layout =
    styled div
        [ margin2 zero auto
        , maxWidth (px 800)
        , width (pct 100)
        , backgroundColor (hex "fff")
        , displayFlex
        , flexDirection column
        , minHeight (vh 100)
        ]


whatisea : Html msg
whatisea =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyles ] ] [ text "What is Economic Abuse?" ]
            , p [ css [ pageDescriptionStyles ] ] [ text "A concise definition of economic abuse in accessible language. ", a [ href "/somewhere" ] [ text "somewhere" ] ]
            ]
        , ul []
            [ li [] [ text "A Category" ]
            , li [] [ text "A Category" ]
            , li [] [ text "A Category" ]
            ]
        ]


eacategories : Html msg
eacategories =
    div [] []



-- For a top header, likely an h1


pageHeadingStyles : Style
pageHeadingStyles =
    Css.batch
        [ fontSize (rem 2.5)
        , margin (rem 2)
        , textAlign center
        ]


pageDescriptionStyles : Style
pageDescriptionStyles =
    Css.batch
        [ color Theme.colours.purple
        , fontFamilies [ "Raleway-Bold", "sansSerif" ]
        , fontSize (rem 1.8)
        ]
