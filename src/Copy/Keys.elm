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
    | SeaSurvivorForumHref
    | HelpSelfCategory1Resource1Href
    | HelpSelfCategory2Resource1Href
    | HelpSelfCategory2Resource2Href
    | HelpSelfCategory2Resource3Href
    | HelpSelfCategory3Resource1Href
    | HelpSelfCategory3Resource2Href
      -- Not Alone page
    | NotAloneTitle
    | Journey1Relatable
    | Journey1Hopeful
    | Journey1Statement
    | Journey1Name
    | Journey1Age
    | Journey2Relatable
    | Journey2Hopeful
    | Journey2Statement
    | Journey2Name
    | Journey2Age
    | Journey3Relatable
    | Journey3Hopeful
    | Journey3Statement
    | Journey3Name
    | Journey3Age
    | Journey4Relatable
    | Journey4Hopeful
    | Journey4Statement
    | Journey4Name
    | Journey4Age
    | Journey5Relatable
    | Journey5Hopeful
    | Journey5Statement
    | Journey5Name
    | Journey5Age
    | Journey6Relatable
    | Journey6Hopeful
    | Journey6Statement
    | Journey6Name
    | Journey6Age
    | ToDefinitionFromNotAloneLink
    | EmergencyButton
    | EmergencyReassure
    | EmergencyContactInfo
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
    | GetHelpSection1Quote
    | GetHelpSection1Description
    | GetHelpSection1CallToAction
    | GetHelpSection2Title
    | GetHelpSection2Quote
    | GetHelpSection2Description
    | GetHelpSection2CallToAction
    | GetHelpSection3Title
    | GetHelpSection3Quote
    | GetHelpSection3Description
    | GetHelpSection3CallToAction
    | ToHelpSelfFromGetHelpLink
