module Page.HelpSelfSingle exposing (Model, Msg, init, view)

import Copy.Keys exposing (..)
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Theme exposing (pageHeadingStyle)


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


view : String -> Model -> Html msg
view slug model =
    let
        categoryData =
            categoryKeysFromSlug slug
    in
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t categoryData.title) ]
            , case categoryData.resources of
                Just resources ->
                    div [] [ renderResources resources ]

                Nothing ->
                    text ""
            ]
        , ul []
            [ li [] [ a [ href ("../" ++ t HelpSelfGridPageSlug) ] [ text (t ToHelpSelfFromSingleCategoryLink) ] ]
            ]
        ]


renderResources : List CategoryResource -> Html msg
renderResources resources =
    div []
        (List.map
            (\resource ->
                div []
                    [ p [] [ text (t resource.title) ]
                    , renderQuotes resource.quotes
                    , p [] [ text (t resource.summary) ]
                    , div [] [ a [ href (t resource.linkHref) ] [ text (t resource.linkName) ] ]
                    ]
            )
            resources
        )


renderQuotes : List Key -> Html msg
renderQuotes quoteKeys =
    div [] (List.map (\quoteKey -> p [] [ text (t quoteKey) ]) quoteKeys)


type alias CategoryResource =
    { title : Key
    , quotes : List Key
    , summary : Key
    , linkName : Key
    , linkHref : Key
    }


type alias CategoryData =
    { title : Key
    , resources : Maybe (List CategoryResource)
    }


categoryKeysFromSlug : String -> CategoryData
categoryKeysFromSlug slug =
    if slug == t HelpSelfCategory1Slug then
        { title = HelpSelfCategory1Title
        , resources =
            Just
                [ { title = HelpSelfCategory1Resource1Title
                  , quotes = [ HelpSelfCategory1Resource1Quote1, HelpSelfCategory1Resource1Quote2 ]
                  , summary = HelpSelfCategory1Resource1Summary
                  , linkName = HelpSelfCategory1Resource1Link
                  , linkHref = HelpSelfCategory1Resource1Href
                  }
                ]
        }

    else if slug == t HelpSelfCategory2Slug then
        { title = HelpSelfCategory2Title
        , resources =
            Just
                [ { title = HelpSelfCategory2Resource1Title
                  , quotes = [ HelpSelfCategory2Resource1Quote1, HelpSelfCategory2Resource1Quote2 ]
                  , summary = HelpSelfCategory2Resource1Summary
                  , linkName = HelpSelfCategory2Resource1Link
                  , linkHref = HelpSelfCategory2Resource1Href
                  }
                , { title = HelpSelfCategory2Resource2Title
                  , quotes = [ HelpSelfCategory2Resource2Quote1, HelpSelfCategory2Resource2Quote2 ]
                  , summary = HelpSelfCategory2Resource2Summary
                  , linkName = HelpSelfCategory2Resource2Link
                  , linkHref = HelpSelfCategory2Resource2Href
                  }
                , { title = HelpSelfCategory2Resource3Title
                  , quotes = [ HelpSelfCategory2Resource3Quote1, HelpSelfCategory2Resource3Quote2 ]
                  , summary = HelpSelfCategory2Resource3Summary
                  , linkName = HelpSelfCategory2Resource3Link
                  , linkHref = HelpSelfCategory2Resource3Href
                  }
                ]
        }

    else if slug == t HelpSelfCategory3Slug then
        { title = HelpSelfCategory3Title
        , resources =
            Just
                [ { title = HelpSelfCategory3Resource1Title
                  , quotes = [ HelpSelfCategory3Resource1Quote1, HelpSelfCategory3Resource1Quote2 ]
                  , summary = HelpSelfCategory3Resource1Summary
                  , linkName = HelpSelfCategory3Resource1Link
                  , linkHref = HelpSelfCategory3Resource1Href
                  }
                , { title = HelpSelfCategory3Resource2Title
                  , quotes = [ HelpSelfCategory3Resource2Quote1, HelpSelfCategory3Resource2Quote2 ]
                  , summary = HelpSelfCategory3Resource2Summary
                  , linkName = HelpSelfCategory3Resource2Link
                  , linkHref = HelpSelfCategory3Resource2Href
                  }
                ]
        }

    else if slug == t HelpSelfCategory4Slug then
        { title = HelpSelfCategory4Title
        , resources = Nothing
        }

    else if slug == t HelpSelfCategory5Slug then
        { title = HelpSelfCategory5Title
        , resources = Nothing
        }

    else
        { title = HelpSelfCategoryNotFoundTitle
        , resources = Nothing
        }
