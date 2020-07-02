module Copy.Text exposing (t)

import Copy.Keys exposing (Key(..))



-- The translate function


t : Key -> String
t key =
    case key of
        SiteTitle ->
            "[cCc] SEA MAP"

        --- Internal Href slugs
        NotAlonePageSlug ->
            "not-alone"

        DefinitionPageSlug ->
            "definition"

        GetHelpPageSlug ->
            "get-help"

        HelpSelfGridPageSlug ->
            "help-self"

        HelpSelfCategory1Slug ->
            "covid"

        HelpSelfCategory2Slug ->
            "banking"

        HelpSelfCategory3Slug ->
            "debt"

        HelpSelfCategory4Slug ->
            "housing"

        HelpSelfCategory5Slug ->
            "facts-about-economic-abuse"

        -- add string arg here with case for each category
        HelpSelfSinglePageSlug category ->
            category

        --- External Hrefs
        StatsOnEconomicAbuseHref ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/03/Statistics-on-economic-abuse.pdf"

        SeaOrganisationsResourceHref ->
            "https://example.com/[cCc]"

        SeaSurvivorForumHref ->
            "https://example.com/[cCc]"

        HelpSelfCategory1Resource1Href ->
            "https://example.com/[cCc]"

        HelpSelfCategory2Resource1Href ->
            "https://example.com/[cCc]"

        HelpSelfCategory2Resource2Href ->
            "https://example.com/[cCc]"

        HelpSelfCategory2Resource3Href ->
            "https://example.com/[cCc]"

        HelpSelfCategory3Resource1Href ->
            "https://example.com/[cCc]"

        HelpSelfCategory3Resource2Href ->
            "https://example.com/[cCc]"

        -- Not Alone page
        NotAloneTitle ->
            "[cCc] Not Alone page title"

        QuoteRelatable1 ->
            "[cCc] A medium quote about a recognisable experience. A medium quote about a recognisable experience."

        QuoteHopeful1 ->
            ""

        QuoteStatement1 ->
            ""

        QuoteName1 ->
            "My Name"

        QuoteAge1 ->
            "22"

        QuoteRelatable2 ->
            "[cCc] A short quote about a recognisable experience"

        QuoteHopeful2 ->
            ""

        QuoteStatement2 ->
            ""

        QuoteName2 ->
            "My Name"

        QuoteAge2 ->
            "33"

        QuoteRelatable3 ->
            "[cCc] A medium quote about a recognisable experience. A medium quote about a recognisable experience."

        QuoteHopeful3 ->
            ""

        QuoteStatement3 ->
            ""

        QuoteName3 ->
            "My Name"

        QuoteAge3 ->
            "62"

        QuoteRelatable4 ->
            "[cCc] A long quote about a recognisable experience. A long quote about a recognisable experience, A long quote about a recognisable experience."

        QuoteHopeful4 ->
            ""

        QuoteStatement4 ->
            ""

        QuoteName4 ->
            "My Name"

        QuoteAge4 ->
            "33"

        QuoteRelatable5 ->
            "[cCc] A short quote about a recognisable experience"

        QuoteHopeful5 ->
            ""

        QuoteStatement5 ->
            ""

        QuoteName5 ->
            "My Name"

        QuoteAge5 ->
            "55"

        QuoteRelatable6 ->
            "[cCc] A long quote about a recognisable experience. A long quote about a recognisable experience, A long quote about a recognisable experience."

        QuoteHopeful6 ->
            ""

        QuoteStatement6 ->
            ""

        QuoteName6 ->
            "My Name"

        QuoteAge6 ->
            "44"

        ToDefinitionFromNotAloneLink ->
            "[cCc] Find out more about Economic Abuse"

        EmergencyButton ->
            "[cCc] Help Me Now"

        EmergencyReassure ->
            "[cCc] Immediate help is available."

        EmergencyContact999 ->
            "[cCc] If you are in immediate danger, call the police:"

        EmergencyContact999Number ->
            "999"

        EmergencyContactDV ->
            "[cCc] Contact the National Domestic Violence Helpline run in partnership between Women’s Aid and Refuge:"

        EmergencyContactDVNumber ->
            "0808 2000 247"

        -- Definition page
        DefinitionTitle ->
            "A name for what’s happening"

        DefinitionConcise ->
            "No one has the right to control your access to money, housing, and food or limit your right to work or learn. This is a controlling type of abuse called economic abuse. Financial abuse is a type of economic abuse focused on money. All economic abuse can be slow to happen and difficult to see. Sometimes it starts after a relationship has ended. Abusers have many tools."

        DefinitionMoreLink ->
            "Link to Legal definition and statistics"

        DefinitionCategory1Title ->
            "Controlling how you get money and resources"

        DefinitionCategory1Info ->
            "Your partner should not stop you going to work, decide your hours or prevent you learning. They should never take your pay. You have a right to your own bank account and to claim benefits if you need them. They should never demand things from you in return for money."

        DefinitionCategory1Quote1 ->
            "I stayed at home to look after the children. It made sense, I felt like he could earn a lot more than me. But nothing was in my name. I hated having to ask for my allowance every week."

        DefinitionCategory1Quote2 ->
            "We were struggling. He would spend any money as soon as I earned it. But he told me that we weren’t scroungers and I couldn’t go and get benefits."

        DefinitionCategory1Quote3 ->
            "Even after we separated, he said that if I didn’t do his washing and cooking, he wouldn’t pay any child maintenance."

        DefinitionCategory2Title ->
            "Limiting how you use what you have"

        DefinitionCategory2Info ->
            "You should be able to make your own decisions about how you spend money. Your partner shouldn't make you ask, check your receipts or demand to see a diary. They shouldn't keep financial things secret from you. It's wrong for them to want houses, car, savings and phones to be in their name only or control how you use them."

        DefinitionCategory2Quote1 ->
            "He had access to all of my bank statements and accounts. I didn’t know anything about his finances."

        DefinitionCategory2Quote2 ->
            "If I bought anything, anything at all - like one time I needed something to wear to an interview - he’d demand to see exactly how much it cost, then tell me I was wasteful"

        DefinitionCategory2Quote3 ->
            "We had a joint account but he never paid anything into it. All the bills came out, even the repayments from the car. But it was in his name, not mine. And he wouldn’t let me drive it without begging."

        DefinitionCategory3Title ->
            "Sabotaging your status"

        DefinitionCategory3Info ->
            "Your partner or ex has no right to put bills, loans, credit cards and other debts in your name and leave you to pay them. It is wrong for them to make you pay for all the household costs and wrong to take money that you need for bills. These are all as wrong as stealing money or things from you or damaging your things."

        DefinitionCategory3Quote1 ->
            "When I found out his new girlfriend was buying big things for him on her credit card the way I had, that sowed the seed of actually, is this a deliberate thing?"

        DefinitionCategory3Quote2 ->
            "He’d walk out of jobs, I was having to work more and more, and he continued to spend as if he was a millionaire. So I was buying from charity shops, even though I had a really good wage."

        DefinitionCategory3Quote3 ->
            "He applied for multiple loans in my name by using the app on my phone. Loans for over £50,000 in total."

        DefinitionCategory4Title ->
            "Threatening you"

        DefinitionCategory4Info ->
            "Abusers use threats to make their abuse worse. It is not your fault. If your partner threatens you with violence and you spend money to stay safe, those debts are their fault not yours. If you make decisions to keep your children safe that is their fault not yours. If they threaten you with the legal system, with their power and knowledge that is even more abuse."

        DefinitionCategory4Quote1 ->
            "He watched me entering my PIN and stole money from my bank account, threatening harm if I changed it."

        DefinitionCategory4Quote2 ->
            "I had not consciously realised that economic abuse was taking place… I was so focused on trying to protect myself from physical harm and keep my family safe that I only became aware of the economic abuse and the extent of it once I had left."

        DefinitionCategory4Quote3 ->
            "It’s those subtle ones, isn’t it, like making the sale of a property, the economic abuse through the justice system really. They totally gave him power to carry on the economic abuse, totally."

        DefinitionCategory5Title ->
            "Blaming you"

        DefinitionCategory5Info ->
            "Abusers will try to make you believe their abuse is your fault.It is not true that you let your partner run up debts or that you make them destroy your things. It is not true that you are worthless or silly or that you are not capable of managing your own money. These are weapons they use."

        DefinitionCategory5Quote1 ->
            "I am not a stupid woman. This could happen to anybody."

        DefinitionCategory5Quote2 ->
            "Even after I came out of refuge and a debt charity helped me, I don’t think it clicked that it wasn’t half my fault anyway. Because I think it takes a long time to get over that kind of, “Well, you must be just crap with money then” thinking."

        DefinitionCategory5Quote3 ->
            "If I tried to ask him about money, or show him a bank statement, he’d throw it all back in my face. He’d tell me I drove him to spending the money or that he’d earned up for putting up with me."

        SplitterAffirmation ->
            "It’s not your fault and you are not alone. 1 in 5 people in the UK experience economic abuse from a partner or ex-partner. It can take time but help is out there."

        ToGetHelpFromDefinitionLink ->
            "[cCc] People you can talk to"

        ToHelpSelfFromDefinitionLink ->
            "[cCc] Things you can find out about and actions you can take"

        -- Help Self page
        HelpSelfTitle ->
            "[cCc] Help Me with..."

        HelpSelfCategory1Link ->
            "[cCc] COVID-19"

        HelpSelfCategory2Link ->
            "[cCc] Banking"

        HelpSelfCategory3Link ->
            "[cCc] Debt"

        HelpSelfCategory4Link ->
            "[cCc] Housing"

        HelpSelfCategory5Link ->
            "[cCc] Economic Abuse, Statistics and the Law"

        ToDefinitionFromHelpSelfLink ->
            "[cCc] What is Economic Abuse?"

        ToNotAloneFromHelpSelfLink ->
            "[cCc] Read about others"

        ToGetHelpFromHelpSelfLink ->
            "[cCc] Get Help"

        ToHelpSelfFromSingleCategoryLink ->
            "[cCc] Choose another topic"

        -- Help Self Single Category 404
        HelpSelfCategoryNotFoundTitle ->
            "[cCc] 404 Not found"

        -- Help Self Single Category1
        HelpSelfCategory1Title ->
            "[cCc] Help in times of COVID"

        HelpSelfCategory1Resource1Title ->
            "[cCc] title covid 1"

        HelpSelfCategory1Resource1Quote1 ->
            "[cCc] quote covid 1 1"

        HelpSelfCategory1Resource1Quote2 ->
            "[cCc] quote covid 1 2"

        HelpSelfCategory1Resource1Summary ->
            "[cCc] summary covid 1"

        HelpSelfCategory1Resource1Link ->
            "[cCc] Link to resource covid 1"

        -- Help Self Single Category2
        HelpSelfCategory2Title ->
            "[cCc] Help with Banking"

        HelpSelfCategory2Resource1Title ->
            "[cCc] title banking 1"

        HelpSelfCategory2Resource1Quote1 ->
            "[cCc] quote banking 1 1"

        HelpSelfCategory2Resource1Quote2 ->
            "[cCc] quote banking 1 2"

        HelpSelfCategory2Resource1Summary ->
            "[cCc] summary banking 1"

        HelpSelfCategory2Resource1Link ->
            "[cCc] Link to resource banking 1"

        HelpSelfCategory2Resource2Title ->
            "[cCc] title banking 2"

        HelpSelfCategory2Resource2Quote1 ->
            "[cCc] quote banking 2 1"

        HelpSelfCategory2Resource2Quote2 ->
            "[cCc] quote banking 2 2"

        HelpSelfCategory2Resource2Summary ->
            "[cCc] summary banking 2"

        HelpSelfCategory2Resource2Link ->
            "[cCc] Link to resource banking 2"

        HelpSelfCategory2Resource3Title ->
            "[cCc] title banking 3"

        HelpSelfCategory2Resource3Quote1 ->
            "[cCc] quote banking 3 1"

        HelpSelfCategory2Resource3Quote2 ->
            "[cCc] quote banking 3 2"

        HelpSelfCategory2Resource3Summary ->
            "[cCc] summary banking  3"

        HelpSelfCategory2Resource3Link ->
            "[cCc] Link to resource banking 3"

        -- Help Self Single Category3
        HelpSelfCategory3Title ->
            "[cCc] Help with Debt"

        HelpSelfCategory3Resource1Title ->
            "[cCc] title debt 1"

        HelpSelfCategory3Resource1Quote1 ->
            "[cCc] quote debt 1 1"

        HelpSelfCategory3Resource1Quote2 ->
            "[cCc] quote debt 1 2"

        HelpSelfCategory3Resource1Summary ->
            "[cCc] summary debt 1"

        HelpSelfCategory3Resource1Link ->
            "[cCc] Link to resource debt 1"

        HelpSelfCategory3Resource2Title ->
            "[cCc] title debt 2"

        HelpSelfCategory3Resource2Quote1 ->
            "[cCc] quote debt 2 1"

        HelpSelfCategory3Resource2Quote2 ->
            "[cCc] quote debt 2 2"

        HelpSelfCategory3Resource2Summary ->
            "[cCc] Summary debt 2"

        HelpSelfCategory3Resource2Link ->
            "[cCc] Link to resource debt 2"

        -- Help Self Single Category4
        HelpSelfCategory4Title ->
            "[cCc] Help with Housing"

        -- Help Self Single Category5
        HelpSelfCategory5Title ->
            "[cCc] Help understanding Economic Abuse"

        -- Get Help page
        GetHelpTitle ->
            "People you can talk to"

        GetHelpSection1Title ->
            "Join the SEA survivors’ forum"

        GetHelpSection1Quote1 ->
            "Meeting other people who’ve been through what I’ve been through is such a massive help. It’s amazing to know people who can really understand what I went through."

        GetHelpSection1Description ->
            "To share your experience with others in our supportive community of economic abuse survivors, sign up to SEA’s Survivor Forum."

        GetHelpSection1Link ->
            "[cCc] Join SEA Survivor Forum"

        GetHelpSection2Title ->
            "The Financial Support Line for Victims of Domestic Abuse"

        GetHelpSection2Quote1 ->
            "When I found this number, I was a huge relief. It made all the difference knowing I could get the right advice for what I was going through by someone who understand."

        GetHelpSection2Description ->
            "[cCc] Run in partnership between Surviving Economic Abuse and Money Advice Plus, the support line is open Mon–Fri, 9am–1pm & 2pm–5pm. It offers specialist advice to victim-survivors of domestic abuse in financial difficulty."

        GetHelpSection2Link ->
            "[cCc] Call 01273 664 000"

        GetHelpSection3Title ->
            "Other organisations that can support"

        GetHelpSection3Quote1 ->
            "I truly believe in the power of shared information. Sharing information is vital to help victims and try to stop abuse."

        GetHelpSection3Description ->
            "The following organisations may be able to help you with specialist information and advice. If you are confident to do so, explain that you are a victim of domestic abuse. This will help them take your safety into account and discuss appropriate options with you."

        GetHelpSection3Link ->
            "[cCc] See Support Organisations"

        ToHelpSelfFromGetHelpLink ->
            "[cCc] Find out more"
