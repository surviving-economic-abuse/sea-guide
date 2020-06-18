module Copy.Keys exposing (Key(..))


type Key
    = SiteTitle
      --- Internal Href slugs
    | NotAlonePageSlug
    | DefinitionPageSlug
    | GetHelpPageSlug
    | HelpSelfPageSlug
      --- External Hrefs
    | StatsOnEconomicAbuseHref
      -- Not Alone page
    | NotAloneTitle
    | QuoteRelatable1
    | QuoteHopeful1
    | QuoteStatement1
    | QuoteName1
    | QuoteAge1
    | QuoteRelatable2
    | QuoteHopeful2
    | QuoteStatement2
    | QuoteName2
    | QuoteAge2
    | QuoteRelatable3
    | QuoteHopeful3
    | QuoteStatement3
    | QuoteName3
    | QuoteAge3
    | QuoteRelatable4
    | QuoteHopeful4
    | QuoteStatement4
    | QuoteName4
    | QuoteAge4
    | QuoteRelatable5
    | QuoteHopeful5
    | QuoteStatement5
    | QuoteName5
    | QuoteAge5
    | QuoteRelatable6
    | QuoteHopeful6
    | QuoteStatement6
    | QuoteName6
    | QuoteAge6
    | ToDefinitionFromNotAloneLink
    | EmergencyButton
    | EmergencyReassure
    | EmergencyContact999
    | EmergencyContactDV
      -- Definition page
    | DefinitionTitle
    | DefinitionConcise
    | DefinitionMoreLink
    | DefinitionCategoryTitle1
    | DefinitionCategoryInfo1
    | DefinitionCategoryQuoteOne1
    | DefinitionCategoryQuoteTwo1
    | DefinitionCategoryQuoteThree1
    | DefinitionCategoryTitle2
    | DefinitionCategoryInfo2
    | DefinitionCategoryQuoteOne2
    | DefinitionCategoryQuoteTwo2
    | DefinitionCategoryQuoteThree2
    | DefinitionCategoryTitle3
    | DefinitionCategoryInfo3
    | DefinitionCategoryQuoteOne3
    | DefinitionCategoryQuoteTwo3
    | DefinitionCategoryQuoteThree3
    | DefinitionCategoryTitle4
    | DefinitionCategoryInfo4
    | DefinitionCategoryQuoteOne4
    | DefinitionCategoryQuoteTwo4
    | DefinitionCategoryQuoteThree4
    | DefinitionCategoryTitle5
    | DefinitionCategoryInfo5
    | DefinitionCategoryQuoteOne5
    | DefinitionCategoryQuoteTwo5
    | DefinitionCategoryQuoteThree5
    | SplitterAffirmation
    | ToGetHelpFromDefinitionLink
    | ToHelpSelfFromDefinitionLink
      -- Help Self page
    | HelpSelfTitle
    | HelpSelfCategoryLink1
    | HelpSelfCategoryLink2
    | HelpSelfCategoryLink3
    | HelpSelfCategoryLink4
    | HelpSelfCategoryLink5
    | ToDefinitionFromHelpSelfLink
    | ToNotAloneFromHelpSelfLink
    | ToGetHelpFromHelpSelfLink
    | ToSelfHelpFromSingleCategoryLink
      -- Help Self Single Category1
    | HelpSelfCategoryTitle1
    | HelpSelfCategoryResource1Title1
    | HelpSelfCategoryResource1QuoteOne1
    | HelpSelfCategoryResource1QuoteTwo1
    | HelpSelfCategoryResource1Summary1
      -- Help Self Single Category2
    | HelpSelfCategoryTitle2
    | HelpSelfCategoryResource1Title2
    | HelpSelfCategoryResource1QuoteOne2
    | HelpSelfCategoryResource1QuoteTwo2
    | HelpSelfCategoryResource1Summary2
    | HelpSelfCategoryResource2Title2
    | HelpSelfCategoryResource2QuoteOne2
    | HelpSelfCategoryResource2QuoteTwo2
    | HelpSelfCategoryResource2Summary2
    | HelpSelfCategoryResource3Title2
    | HelpSelfCategoryResource3QuoteOne2
    | HelpSelfCategoryResource3QuoteTwo2
    | HelpSelfCategoryResource3Summary2
      -- Help Self Single Category3
    | HelpSelfCategoryTitle3
    | HelpSelfCategoryResource1Title3
    | HelpSelfCategoryResource1QuoteOne3
    | HelpSelfCategoryResource1QuoteTwo3
    | HelpSelfCategoryResource1Summary3
    | HelpSelfCategoryResource2Title3
    | HelpSelfCategoryResource2QuoteOne3
    | HelpSelfCategoryResource2QuoteTwo3
    | HelpSelfCategoryResource2Summary3
      -- Help Self Single Category4
    | HelpSelfCategoryTitle4
      -- Help Self Single Category5
    | HelpSelfCategoryTitle5
      -- Get Help page
    | GetHelpTitle
    | GetHelpSection1Title
    | GetHelpSection1Quote1
    | GetHelpSection1Quote2
    | GetHelpSection1Description
    | GetHelpSection2Title
    | GetHelpSection2Quote1
    | GetHelpSection2Quote2
    | GetHelpSection2Description
    | GetHelpSection3Title
    | GetHelpSection3Quote1
    | GetHelpSection3Quote2
    | GetHelpSection3Description
    | ToHelpSelfFromGetHelpLink
