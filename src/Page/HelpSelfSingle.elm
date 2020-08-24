module Page.HelpSelfSingle exposing (CategoryResource, Model, Msg(..), categoryKeysFromSlug, resourceIsExpanded, update)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Css.Media as Media exposing (minWidth, only, screen, withMedia)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, a, blockquote, button, div, h1, h2, header, li, nav, p, span, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Set
import Theme exposing (colours, navItemStyles, navLinkStyle, navListStyle, pageHeadingStyle, verticalSpacing)


type alias Model =
    { openResources : Set.Set String }


type Msg
    = NoOp
    | ToggleResource Key


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleResource resourceTitle ->
            let
                action =
                    if resourceIsExpanded model resourceTitle then
                        Set.remove

                    else
                        Set.insert
            in
            ( { model | openResources = action (t resourceTitle) model.openResources }, Cmd.none )


resourceIsExpanded : Model -> Key -> Bool
resourceIsExpanded model titleKey =
    Set.member (t titleKey) model.openResources


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
    if slug == t HelpSelfBankingSlug then
        { title = HelpSelfBankingTitle
        , resources =
            Just
                [ { title = HelpSelfBankingResource1Title
                  , quotes = [ HelpSelfBankingResource1Quote1, HelpSelfBankingResource1Quote2 ]
                  , summary = HelpSelfBankingResource1Summary
                  , linkName = HelpSelfBankingResource1Link
                  , linkHref = HelpSelfBankingResource1Href
                  }
                , { title = HelpSelfBankingResource2Title
                  , quotes = [ HelpSelfBankingResource2Quote1, HelpSelfBankingResource2Quote2 ]
                  , summary = HelpSelfBankingResource2Summary
                  , linkName = HelpSelfBankingResource2Link
                  , linkHref = HelpSelfBankingResource2Href
                  }
                ]
        }

    else if slug == t HelpSelfDebtSlug then
        { title = HelpSelfDebtTitle
        , resources =
            Just
                [ { title = HelpSelfDebtResource1Title
                  , quotes = [ HelpSelfDebtResource1Quote1, HelpSelfDebtResource1Quote2 ]
                  , summary = HelpSelfDebtResource1Summary
                  , linkName = HelpSelfDebtResource1Link
                  , linkHref = HelpSelfDebtResource1Href
                  }
                , { title = HelpSelfDebtResource2Title
                  , quotes = [ HelpSelfDebtResource2Quote1, HelpSelfDebtResource2Quote2 ]
                  , summary = HelpSelfDebtResource2Summary
                  , linkName = HelpSelfDebtResource2Link
                  , linkHref = HelpSelfDebtResource2Href
                  }
                , { title = HelpSelfDebtResource3Title
                  , quotes = [ HelpSelfDebtResource3Quote1, HelpSelfDebtResource3Quote2 ]
                  , summary = HelpSelfDebtResource3Summary
                  , linkName = HelpSelfDebtResource3Link
                  , linkHref = HelpSelfDebtResource3Href
                  }
                ]
        }

    else if slug == t HelpSelfHousingSlug then
        { title = HelpSelfHousingTitle
        , resources =
            Just
                [ { title = HelpSelfHousingResource1Title
                  , quotes = [ HelpSelfHousingResource1Quote1, HelpSelfHousingResource1Quote2 ]
                  , summary = HelpSelfHousingResource1Summary
                  , linkName = HelpSelfHousingResource1Link
                  , linkHref = HelpSelfHousingResource1Href
                  }
                ]
        }

    else if slug == t HelpSelfFinancialSlug then
        { title = HelpSelfFinancialTitle
        , resources =
            Just
                [ { title = HelpSelfFinancialResource1Title
                  , quotes = [ HelpSelfFinancialResource1Quote1, HelpSelfFinancialResource1Quote2 ]
                  , summary = HelpSelfFinancialResource1Summary
                  , linkName = HelpSelfFinancialResource1Link
                  , linkHref = HelpSelfFinancialResource1Href
                  }
                , { title = HelpSelfFinancialResource2Title
                  , quotes = [ HelpSelfFinancialResource2Quote1, HelpSelfFinancialResource2Quote2 ]
                  , summary = HelpSelfFinancialResource2Summary
                  , linkName = HelpSelfFinancialResource2Link
                  , linkHref = HelpSelfFinancialResource2Href
                  }
                , { title = HelpSelfFinancialResource3Title
                  , quotes = [ HelpSelfFinancialResource3Quote1, HelpSelfFinancialResource3Quote2 ]
                  , summary = HelpSelfFinancialResource3Summary
                  , linkName = HelpSelfFinancialResource3Link
                  , linkHref = HelpSelfFinancialResource3Href
                  }
                ]
        }

    else if slug == t HelpSelfCovidSlug then
        { title = HelpSelfCovidTitle
        , resources = Nothing
        }

    else if slug == t HelpSelfInfoLawSlug then
        { title = HelpSelfInfoLawTitle
        , resources = Nothing
        }

    else if slug == t HelpSelfSeparatingSlug then
        { title = HelpSelfSeparatingTitle
        , resources = Nothing
        }

    else
        { title = HelpSelfCategoryNotFoundTitle
        , resources = Nothing
        }
