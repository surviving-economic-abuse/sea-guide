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
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/12/Organisations-that-can-help___.pdf"

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
            "You are not alone"

        Journey1Relatable ->
            "When I took a call from someone my boyfriend didn't approve of, he threw my mobile phone on the floor and smashed it. I had to buy 3 new phones last year."

        Journey1Hopeful ->
            "I spoke to a friend one day in the park who told me that wasn't ok. It was just helpful to speak to someone you know."

        Journey1Statement ->
            "Looking back on it now I can see that there were so many small things like that. I still find it difficult to trust people but at least I'm free."

        Journey1Name ->
            "Zahara"

        Journey1Age ->
            "27"

        Journey2Relatable ->
            "My partner used to give me a shopping list telling me what I had to buy with the £10 food allowance. He'd check the receipt when I got in to make sure I'd got everything. Sometimes I couldn't and then he'd beat me up."

        Journey2Hopeful ->
            "The situation became dangerous and I left the house with two bags of clothes. I rent and will probably never buy, but we are safe."

        Journey2Statement ->
            "We are happy, and he no longer has control over our lives."

        Journey2Name ->
            "Caris"

        Journey2Age ->
            "34"

        Journey3Relatable ->
            "To be so powerless, I can't explain what it's like, it's overwhelming. Not being able to provide for your children. You have absolutely no control over your life."

        Journey3Hopeful ->
            "Advocacy is so important, especially when you are fearing homelessness and losing the children. I found a senior person in the bank who advocated on my behalf from within. His advice made a huge difference."

        Journey3Statement ->
            "This will end and normality will return."

        Journey3Name ->
            "Amina"

        Journey3Age ->
            "39"

        Journey4Relatable ->
            "He had access to all of my bank statements and accounts. I didn't know anything about his finances. For him it was just another method of control."

        Journey4Hopeful ->
            "My bank were aware of the abuse and they always found a room for me, as it is difficult explaining such distressing personal information in open plan spaces."

        Journey4Statement ->
            "It's really made me think. I can see the connection between the abuser's behaviour and my financial situation now."

        Journey4Name ->
            "Catherine"

        Journey4Age ->
            "43"

        Journey5Relatable ->
            "When I left the relationship I realised he had taken out loans and credit cards in joint names I knew nothing about."

        Journey5Hopeful ->
            "I had been putting off speaking to anyone as I didn't know how to approach these companies. But with the help of my debt advisor, I was successful in removing a contract in my name and the debt was written off in full."

        Journey5Statement ->
            "I feel like I've got my life back. I can take the kids on holiday and we are free."

        Journey5Name ->
            "Aja"

        Journey5Age ->
            "48"

        Journey6Relatable ->
            "The abuse started with how we organised our bank accounts when we first lived together. We opened a joint account for household bills but within a year, he had transferred all his own direct debits to the joint account."

        Journey6Hopeful ->
            "I was so relieved when my debt advisor explained the situation to the creditor and they agreed to write it off. It's one less thing hanging over me while I start my new life. Before, I was constantly anxious about whether I would have enough money in my account to make the payments every month."

        Journey6Statement ->
            "I refuse to be told that nothing can be done and I want change for other victims. I know first-hand how devastating the effects of economic abuse can be."

        Journey6Name ->
            "Sarah"

        Journey6Age ->
            "61"

        ExpandQuoteButton ->
            "read how things got better"

        ToDefinitionReassuringText ->
            "If this sounds familiar know that you’re not alone."

        ToDefinitionFromNotAloneLink ->
            "Find out about economic abuse"

        EmergencyButton ->
            "I need immediate help"

        EmergencyReassure ->
            "If you are in immediate danger, there is help available."

        EmergencyContactInfo ->
            "Call the police on 999 or contact the 24-hour Freephone National Domestic Abuse Helpline run by Refuge on 0808 2000 247 or the Men's Advice Line on 0808 801 0327. Contact Galop on 0800 999 5428 for LGBTQ+ support. These numbers are free to call."

        -- Definition page
        DefinitionTitle ->
            "A name for what's happening"

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
            "We were struggling. He would spend any money as soon as I earned it. But he told me that we weren't scroungers and I couldn't go and get benefits."

        DefinitionCategory1Quote3 ->
            "Even after we separated, he said that if I didn't do his washing and cooking, he wouldn't pay any child maintenance."

        DefinitionCategory2Title ->
            "Limiting how you use what you have"

        DefinitionCategory2Info ->
            "You should be able to make your own decisions about how you spend money. Your partner shouldn't make you ask, check your receipts or demand to see a diary. They shouldn't keep financial things secret from you. It's wrong for them to want houses, car, savings and phones to be in their name only or control how you use them."

        DefinitionCategory2Quote1 ->
            "He had access to all of my bank statements and accounts. I didn't know anything about his finances."

        DefinitionCategory2Quote2 ->
            "If I bought anything, anything at all - like one time I needed something to wear to an interview - he'd demand to see exactly how much it cost, then tell me I was wasteful."

        DefinitionCategory2Quote3 ->
            "We had a joint account but he never paid anything into it. All the bills came out, even the repayments from the car. But it was in his name, not mine. And he wouldn't let me drive it without begging."

        DefinitionCategory3Title ->
            "Sabotaging your status"

        DefinitionCategory3Info ->
            "Your partner or ex has no right to put bills, loans, credit cards and other debts in your name and leave you to pay them. It is wrong for them to make you pay for all the household costs and wrong to take money that you need for bills. These are all as wrong as stealing money or things from you or damaging your things."

        DefinitionCategory3Quote1 ->
            "When I found out his new girlfriend was buying big things for him on her credit card the way I had, that sowed the seed of actually, is this a deliberate thing?"

        DefinitionCategory3Quote2 ->
            "He'd walk out of jobs, I was having to work more and more, and he continued to spend as if he was a millionaire. So I was buying from charity shops, even though I had a really good wage."

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
            "It's those subtle ones, isn't it, like making the sale of a property, the economic abuse through the justice system really. They totally gave him power to carry on the economic abuse, totally."

        DefinitionCategory5Title ->
            "Blaming you"

        DefinitionCategory5Info ->
            "Abusers will try to make you believe their abuse is your fault.It is not true that you let your partner run up debts or that you make them destroy your things. It is not true that you are worthless or silly or that you are not capable of managing your own money. These are weapons they use."

        DefinitionCategory5Quote1 ->
            "I am not a stupid woman. This could happen to anybody."

        DefinitionCategory5Quote2 ->
            "Even after I came out of refuge and a debt charity helped me, I don't think it clicked that it wasn't half my fault anyway. Because I think it takes a long time to get over that kind of, “Well, you must be just crap with money then” thinking."

        DefinitionCategory5Quote3 ->
            "If I tried to ask him about money, or show him a bank statement, he'd throw it all back in my face. He'd tell me I drove him to spending the money or that he'd earned up for putting up with me."

        SplitterAffirmation ->
            "It's not your fault and you are not alone. 1 in 5 people in the UK experience economic abuse from a partner or ex-partner. It can take time but help is out there."

        ToGetHelpFromDefinitionLink ->
            "Find people to talk to"

        ToHelpSelfFromDefinitionLink ->
            "Find information that can help"

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
            "Read an introduction to economic abuse"

        ToNotAloneFromHelpSelfLink ->
            "Read about survivors' experiences"

        ToGetHelpFromHelpSelfLink ->
            "Find people to talk to"

        ToHelpSelfFromSingleCategoryLink ->
            "Choose another topic"

        -- Help Self Single Category 404
        HelpSelfCategoryNotFoundTitle ->
            "[cCc] 404 Not found"

        -- Help Self Single Category1
        HelpSelfCategory1Title ->
            "[cCc] Help in times of COVID"

        HelpSelfCategory1Resource1Title ->
            "[cCc] Economic abuse and the coronavirus outbreak"

        HelpSelfCategory1Resource1Quote1 ->
            "[cCc] I was worried about stuff during the outbreak, but this information sheet helped me take steps towards feeling safer."

        HelpSelfCategory1Resource1Quote2 ->
            "[cCc] I wasn't sure what to do about work when I found out my kids couldn't go in to school, but then I read that I was entitled to take time off. It helped me know what to say to my boss."

        HelpSelfCategory1Resource1Summary ->
            "[cCc] This pdf has suggestions for a lot of little things you can do to help during lockdown. I can help with understanding rights around employment, benefits and bills and advice around supporting your chilren."

        HelpSelfCategory1Resource1Link ->
            "[cCc] Get information to help you during the outbreak"

        -- Help Self Single Category2
        HelpSelfCategory2Title ->
            "[cCc] Help with Banking"

        HelpSelfCategory2Resource1Title ->
            "[cCc] How banks can help"

        HelpSelfCategory2Resource1Quote1 ->
            "[cCc] After reading about banking and economic abuse, I found a senior person in the bank who advocated on my behalf from within. His advice made a huge difference."

        HelpSelfCategory2Resource1Quote2 ->
            "[cCc] Another short quote about experience using the resource."

        HelpSelfCategory2Resource1Summary ->
            "[cCc] If a current or former partner has interfered with your money or other economic resources in some way to limit your choices, this information is for you. It outlines how your bank or building society can support you if you have experienced economic abuse."

        HelpSelfCategory2Resource1Link ->
            "[cCc] Find more information about how banks can help"

        HelpSelfCategory2Resource2Title ->
            "[cCc] Opening a new bank account safely"

        HelpSelfCategory2Resource2Quote1 ->
            "[cCc] I found out I could ask to speak to the vulnerable customer team. After that the bank always found a room for me, as it is difficult explaining such distressing personal information in open plan spaces."

        HelpSelfCategory2Resource2Quote2 ->
            "[cCc] Another quote about how the resource can help."

        HelpSelfCategory2Resource2Summary ->
            "[cCc] If you are experiencing economic abuse, opening a bank account independent of the abuser, can be one of the most important steps you take towards regaining control of your finances. This information is designed to provide practical tips on opening a new bank account safely, and to guide your interactions with the bank if you wish to open a new account."

        HelpSelfCategory2Resource2Link ->
            "[cCc] Find out how to get help from your bank"

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
            "Support from survivors"

        GetHelpSection1Quote ->
            "Meeting other people who've been through what I've been through is such a massive help. It's amazing to know people who can really understand what I went through."

        GetHelpSection1Description ->
            "Share your experience with others in our supportive community of economic abuse survivors."

        GetHelpSection1CallToAction ->
            "Join SEA's survivor forum"

        GetHelpSection2Title ->
            "The Financial Support Line"

        GetHelpSection2Quote ->
            "When I found this number, it was a huge relief. It made all the difference knowing I could get the right advice for what I was going through by someone who understands."

        GetHelpSection2Description ->
            "Call The Financial Support Line for Victims of Domestic Abuse (Mon–Fri, 9am–1pm & 2pm–5pm) for specialist advice to victim-survivors of domestic abuse in financial difficulty."

        GetHelpSection2CallToAction ->
            "Call 01273 664 000"

        GetHelpSection3Title ->
            "Support from other organisations"

        GetHelpSection3Quote ->
            "I'd done loads of googling but didn't really know where to start. Finding this directory was really reassuring. I didn't know there was so much help out there."

        GetHelpSection3Description ->
            "There are many organisations who may be able to help you with specialist information and advice."

        GetHelpSection3CallToAction ->
            "Find contact information for support organisations"

        ToHelpSelfReassuringText ->
            "If you are experiencing economic abuse, you are not alone."

        ToHelpSelfFromGetHelpLink ->
            "Find information that can help"
