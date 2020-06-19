module Copy.Keys exposing (Key(..))


type Key
    = SiteTitle
      --- Internal Href slugs
    | NotAlonePageSlug
    | DefinitionPageSlug
    | GetHelpPageSlug
    | HelpSelfGridPageSlug
    | HelpSelfSinglePageSlug String
    | HelpSelfCategory1Slug
    | HelpSelfCategory2Slug
    | HelpSelfCategory3Slug
    | HelpSelfCategory4Slug
    | HelpSelfCategory5Slug
      --- External Hrefs
    | StatsOnEconomicAbuseHref
    | SeaOrganisationsResourceHref
    | SeaMapFinancialSupportHref
    | SeaSurvivorForumHref
    | HelpSelfCategory1Resource1Href
    | HelpSelfCategory2Resource1Href
    | HelpSelfCategory2Resource2Href
    | HelpSelfCategory2Resource3Href
    | HelpSelfCategory3Resource1Href
    | HelpSelfCategory3Resource2Href
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
    | DefinitionCategory1Title
    | DefinitionCategory1Info
    | DefinitionCategory1Quote1
    | DefinitionCategory1Quote2
    | DefinitionCategory1Quote3
    | DefinitionCategory2Title
    | DefinitionCategory2Info
    | DefinitionCategory2Quote1
    | DefinitionCategory2Quote2
    | DefinitionCategory2Quote3
    | DefinitionCategory3Title
    | DefinitionCategory3Info
    | DefinitionCategory3Quote1
    | DefinitionCategory3Quote2
    | DefinitionCategory3Quote3
    | DefinitionCategory4Title
    | DefinitionCategory4Info
    | DefinitionCategory4Quote1
    | DefinitionCategory4Quote2
    | DefinitionCategory4Quote3
    | DefinitionCategory5Title
    | DefinitionCategory5Info
    | DefinitionCategory5Quote1
    | DefinitionCategory5Quote2
    | DefinitionCategory5Quote3
    | SplitterAffirmation
    | ToGetHelpFromDefinitionLink
    | ToHelpSelfFromDefinitionLink
      -- Help Self page
    | HelpSelfTitle
    | HelpSelfCategory1Link
    | HelpSelfCategory2Link
    | HelpSelfCategory3Link
    | HelpSelfCategory4Link
    | HelpSelfCategory5Link
    | ToDefinitionFromHelpSelfLink
    | ToNotAloneFromHelpSelfLink
    | ToGetHelpFromHelpSelfLink
    | ToHelpSelfFromSingleCategoryLink
      -- Help Self Single Category 404
    | HelpSelfCategoryNotFoundTitle
      -- Help Self Single Category1
    | HelpSelfCategory1Title
    | HelpSelfCategory1Resource1Title
    | HelpSelfCategory1Resource1Quote1
    | HelpSelfCategory1Resource1Quote2
    | HelpSelfCategory1Resource1Summary
    | HelpSelfCategory1Resource1Link
      -- Help Self Single Category2
    | HelpSelfCategory2Title
    | HelpSelfCategory2Resource1Title
    | HelpSelfCategory2Resource1Quote1
    | HelpSelfCategory2Resource1Quote2
    | HelpSelfCategory2Resource1Summary
    | HelpSelfCategory2Resource1Link
    | HelpSelfCategory2Resource2Title
    | HelpSelfCategory2Resource2Quote1
    | HelpSelfCategory2Resource2Quote2
    | HelpSelfCategory2Resource2Summary
    | HelpSelfCategory2Resource2Link
    | HelpSelfCategory2Resource3Title
    | HelpSelfCategory2Resource3Quote1
    | HelpSelfCategory2Resource3Quote2
    | HelpSelfCategory2Resource3Summary
    | HelpSelfCategory2Resource3Link
      -- Help Self Single Category3
    | HelpSelfCategory3Title
    | HelpSelfCategory3Resource1Title
    | HelpSelfCategory3Resource1Quote1
    | HelpSelfCategory3Resource1Quote2
    | HelpSelfCategory3Resource1Summary
    | HelpSelfCategory3Resource1Link
    | HelpSelfCategory3Resource2Title
    | HelpSelfCategory3Resource2Quote1
    | HelpSelfCategory3Resource2Quote2
    | HelpSelfCategory3Resource2Summary
    | HelpSelfCategory3Resource2Link
      -- Help Self Single Category4
    | HelpSelfCategory4Title
      -- Help Self Single Category5
    | HelpSelfCategory5Title
      -- Get Help page
    | GetHelpTitle
    | GetHelpSection1Title
    | GetHelpSection1Quote1
    | GetHelpSection1Quote2
    | GetHelpSection1Description
    | GetHelpSection1Link
    | GetHelpSection2Title
    | GetHelpSection2Quote1
    | GetHelpSection2Quote2
    | GetHelpSection2Description
    | GetHelpSection2Link
    | GetHelpSection3Title
    | GetHelpSection3Quote1
    | GetHelpSection3Quote2
    | GetHelpSection3Description
    | GetHelpSection3Link
    | ToHelpSelfFromGetHelpLink
