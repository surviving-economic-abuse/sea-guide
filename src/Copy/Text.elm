module Copy.Text exposing (t)

import Copy.Keys exposing (Key(..))



-- The translate function


t : Key -> String
t key =
    case key of
        SiteTitle ->
            "Economic abuse support tool"

        --- Internal Href slugs
        NotAlonePageSlug ->
            "not-alone"

        DefinitionPageSlug ->
            "definition"

        GetHelpPageSlug ->
            "get-help"

        HelpSelfGridPageSlug ->
            "help-self"

        HelpSelfBankingSlug ->
            "banking"

        HelpSelfDebtSlug ->
            "debt"

        HelpSelfHousingSlug ->
            "housing"

        HelpSelfFinancialSlug ->
            "financial-support"

        HelpSelfCovidSlug ->
            "covid-and-finances"

        HelpSelfInfoLawSlug ->
            "facts-about-economic-abuse"

        HelpSelfSeparatingSlug ->
            "separating-finances"

        -- add string arg here with case for each category
        HelpSelfSinglePageSlug category ->
            category

        --- External Hrefs for People to talk to
        StatsOnEconomicAbuseHref ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/03/Statistics-on-economic-abuse.pdf"

        SeaOrganisationsResourceHref ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/12/Organisations-that-can-help___.pdf"

        SeaSurvivorForumHref ->
            "https://example.com/[cCc]"

        -- Resource pdfs
        HelpSelfPdfDownloadLabel ->
            "Full guide: "

        HelpSelfBankingResource1Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/12/How-banks-can-help__.pdf"

        HelpSelfBankingResource2Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/12/Opening-a-bank-account.pdf"

        HelpSelfDebtResource1Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/12/Coerced-debt.pdf"

        HelpSelfDebtResource2Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/04/Asking-for-a-debt-to-be-written-off.pdf"

        HelpSelfDebtResource3Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/01/Economic-abuse-and-your-credit-report.pdf"

        HelpSelfHousingResource1Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/11/A-safe-place-to-live.pdf"

        HelpSelfFinancialResource1Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/02/Grants-and-financial-help.pdf"

        HelpSelfFinancialResource2Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/02/Economic-abuse-and-supporting-children.pdf"

        HelpSelfFinancialResource3Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/01/Economic-abuse-and-no-recourse.pdf"

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
            "If this sounds familiar know that you're not alone."

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
            "Understanding what's happening to you"

        DefinitionConciseP1 ->
            "Has your partner used your bank cards without asking? Do they stop you from earning money or going to work? Have they ever stolen money from you? Or damaged or destroyed your things?"

        DefinitionConciseP2 ->
            "Who has control over all the finances? Are the bills in your name or theirs? Maybe they're the only one who can login to online banking? Or make you count every penny you spend?"

        DefinitionConciseP3 ->
            "Domestic abuse is not always physical. An abuser may restrict how you make or spend your money, or control and sabotage other areas of your life including housing, food and clothing. This is known as economic abuse, and it is commonly experienced within a context of abuse known as coercive control."

        DefinitionMoreLink ->
            "Find out more about the signs of economic abuse."

        DefinitionCategory1Title ->
            "Controlling how you access money"

        DefinitionCategory1Info ->
            "An abuser may try to stop you from accessing money. Maybe they've said you should no longer be working, or told you to limit the hours you do. They might tell you your salary should be paid into their personal account and that you don't need your own bank account. If you're not working, they might have told you not to claim any benefits."

        DefinitionCategory1Quote1 ->
            "I stayed at home to look after the children. It made sense, I felt like he could earn a lot more than me. But nothing was in my name. I hated having to ask for my allowance every week."

        DefinitionCategory1Quote2 ->
            "We were struggling. He would spend any money as soon as I earned it. But he told me that we weren't scroungers and I couldn't go and get benefits."

        DefinitionCategory1Quote3 ->
            "Even after we separated, he said that if I didn't do his washing and cooking, he wouldn't pay any child maintenance."

        DefinitionCategory2Title ->
            "Controlling what you spend money on"

        DefinitionCategory2Info ->
            "An abuser may tell you what you can and can't spend your money on and when. They might ask to see receipts from the weekly food shop or give you an allowance spending. You might have to count every penny or justify every single purchase. An abuser might take control of your things - from your phone to your car. Or they may have insisted that all assets, such as savings or the house, are put in their name. While demanding this from you, they might keep their own finances very secret."

        DefinitionCategory2Quote1 ->
            "He had access to all of my bank statements and accounts. I didn't know anything about his finances."

        DefinitionCategory2Quote2 ->
            "If I bought anything, anything at all - like one time I needed something to wear to an interview - he'd demand to see exactly how much it cost, then tell me I was wasteful."

        DefinitionCategory2Quote3 ->
            "We had a joint account but he never paid anything into it. All the bills came out, even the repayments from the car. But it was in his name, not mine. And he wouldn't let me drive it without begging."

        DefinitionCategory3Title ->
            "Sabotaging your finances and economic resources"

        DefinitionCategory3Info ->
            "An abuser may try to sabotage your finances or whatever economic resources you do have. They might steal money or property from you or may cause damage to your property to devalue the house. Abusers might spend the money set aside for savings or holidays or bills or force all credit cards and bills to be in your name."

        DefinitionCategory3Quote1 ->
            "When I found out his new girlfriend was buying big things for him on her credit card the way I had, that sowed the seed of actually, is this a deliberate thing?"

        DefinitionCategory3Quote2 ->
            "He'd walk out of jobs, I was having to work more and more, and he continued to spend as if he was a millionaire. So I was buying from charity shops, even though I had a really good wage."

        DefinitionCategory3Quote3 ->
            "He applied for multiple loans in my name by using the app on my phone. Loans for over £50,000 in total."

        DefinitionCategory4Title ->
            "Taking advantage of your finances and economic resources"

        DefinitionCategory4Info ->
            "An abuser may attempt to take advantage of the economic resources you do have. This may mean refusing to contribute to household costs like utility bills or the running of the car, taking your wages or benefits from you, or running up debt in your name."

        DefinitionCategory4Quote1 ->
            "My salary had gone into his business account, of which he had sole sign-off on. I suddenly had very limited access to money, and would have to have a very specific need for him to grant me any."

        DefinitionCategory4Quote2 ->
            "The abuse started with how we organised our bank accounts when we first lived together. We opened a joint account for household bills but within a year, he had transferred all his own direct debits to the joint account."

        DefinitionCategory4Quote3 ->
            "I was with an abusive partner for five years. Throughout the relationship he managed to get me into £30,000 worth of debt. I will be in debt for the next 20 years of my life."

        DefinitionCategory5Title ->
            "Threatening you"

        DefinitionCategory5Info ->
            "Economic abuse normally happens alongside other kinds of abuse. You might find an abuser becomes violent or threatens violence if you don't agree with their demands around money and finances or refuse to do what they say. You are not alone."

        DefinitionCategory5Quote1 ->
            "He watched me entering my PIN and stole money from my bank account, threatening me if I changed it."

        DefinitionCategory5Quote2 ->
            "My ex made me run up debts on them which are now unaffordable for me to repay. He would push me against a wall, put his hands around my throat if I didn't give him money."

        DefinitionCategory5Quote3 ->
            "If I didn't have enough cash to pay for what he wanted, he would give me an ultimatum – what would cost more: to buy him what he wanted or the cost of the damage he would do when he smashed everything in sight. So I got my credit card out and ended up with £3,000 worth of debt."

        DefinitionCategory6Title ->
            "Manipulating or coercing you"

        DefinitionCategory6Info ->
            "Economic abuse can be hard to spot and often happens without you realising. It can start slowly and could begin with behaviour that at first seems protective or caring. E.g. offering to take care of all the finances or encouraging you not to work so that you can look after the children. Overspending, and building up debts in your name can also develop slowly and may not be obvious at first. Some women may have lived with economic abuse for many years without knowing, and it can continue after leaving."

        DefinitionCategory6Quote1 ->
            "I am not a stupid woman. This could happen to anybody."

        DefinitionCategory6Quote2 ->
            "Even after I came out of refuge and a debt charity helped me, I don't think it clicked that it wasn't half my fault anyway. Because I think it takes a long time to get over that kind of, \"Well, you must be just crap with money then\" thinking."

        DefinitionCategory6Quote3 ->
            "I often wonder how I got here. I got married to this charming man in the legal profession and we had children. But it was after I got married that I was systematically and unwittingly socially isolated, psychologically, emotionally, financially abused and controlled."

        SplitterAffirmation ->
            "If you are experiencing economic abuse, you are not alone. 1 in 5 adults in the UK have experienced economic abuse at some point. And more than ever before, there are people and organisations who understand and who can help."

        ToGetHelpFromDefinitionLink ->
            "Find people to talk to"

        ToHelpSelfFromDefinitionLink ->
            "Find information that can help"

        -- Help Self page
        HelpSelfTitle ->
            "Help me with..."

        HelpSelfBankingLink ->
            "Banking"

        HelpSelfDebtLink ->
            "Debt"

        HelpSelfHousingLink ->
            "Housing"

        HelpSelfFinancialLink ->
            "Getting financial support"

        HelpSelfCovidLink ->
            "COVID-19 and my finances"

        HelpSelfInfoLawLink ->
            "Economic abuse and the law"

        HelpSelfSeparatingLink ->
            "Separating my finances from an abusive partner"

        ToDefinitionFromHelpSelfLink ->
            "Read more about the signs of economic abuse"

        ToNotAloneFromHelpSelfLink ->
            "Read about survivors' experiences"

        ToGetHelpFromHelpSelfLink ->
            "Find people to talk to"

        ToHelpSelfFromSingleCategoryLink ->
            "Choose another topic"

        -- Help Self single Category 404
        HelpSelfCategoryNotFoundTitle ->
            "404 Topic not found."

        -- Help Self single Banking
        HelpSelfBankingTitle ->
            "Information to support you with banking"

        HelpSelfBankingResource1Title ->
            "How banks can help"

        HelpSelfBankingResource1Quote1 ->
            "I found a senior person in the bank who advocated on my behalf from within. His advice made a huge difference."

        HelpSelfBankingResource1Quote2 ->
            "My bank were aware of the abuse and they always found a room for me, as it is difficult explaining such distressing personal information in open plan spaces."

        HelpSelfBankingResource1Summary ->
            "Approaching your bank about abuse can be daunting, but your bank or building society could be an important source of information and support. This information sets out how your bank can help you to regain control of your money, including separating your finances from the abuser, and making sure any new banking information is safe and secure."

        HelpSelfBankingResource1Link ->
            "How banks can help [PDF 600kB]"

        HelpSelfBankingResource2Title ->
            "Opening a new bank account safely"

        HelpSelfBankingResource2Quote1 ->
            "My salary went into his business account, and he had sole sign off. I suddenly had very limited access to money."

        HelpSelfBankingResource2Quote2 ->
            "Setting up a new bank account just for myself felt like a first step to freedom."

        HelpSelfBankingResource2Summary ->
            "Opening a bank account independent of an abuser can be one of the most important steps you take towards regaining control of your finances. This information provides practical tips on opening a new bank account safely including choosing a bank, gathering documents and selecting the right account."

        HelpSelfBankingResource2Link ->
            "Opening a new bank account [PDF 469kB]"

        -- Help Self single Debt
        HelpSelfDebtTitle ->
            "Information to support you with debt"

        HelpSelfDebtResource1Title ->
            "What is coerced debt?"

        HelpSelfDebtResource1Quote1 ->
            "He applied for multiple loans in my name by using the app on my phone. Loans for over £50,000 in total."

        HelpSelfDebtResource1Quote2 ->
            "The debt has been written off and I feel like I’ve got my life back. I can take the kids on holiday and we are free."

        HelpSelfDebtResource1Summary ->
            "Forcing or coercing someone into debt is a common form of economic abuse. If you have been forced to make transactions that led you into debt, or if you have had debts fraudulently built up in your name, this information will help."

        HelpSelfDebtResource1Link ->
            "What is coerced debt? [PDF 542kB]"

        HelpSelfDebtResource2Title ->
            "Asking a lender for a debt write-off"

        HelpSelfDebtResource2Quote1 ->
            "I was already feeling vulnerable in my home life and worried about keeping myself and my children safe. But dealing with creditors chasing me for money amplified my anxiety of the whole world collapsing on top of me."

        HelpSelfDebtResource2Quote2 ->
            "I was so relieved when my debt advisor explained the situation to the creditor and they agreed to write it off. It’s one less thing hanging over me while I start my new life."

        HelpSelfDebtResource2Summary ->
            "There are a number of solutions to dealing with coerced debt that you can explore with a qualified debt adviser. These include explaining the circumstances to the lender and asking them to write off the debt. This isn’t a guaranteed solution but the information in this guide will help you understand your options."

        HelpSelfDebtResource2Link ->
            "Asking a lender for a debt write-off [PDF 541kB]"

        HelpSelfDebtResource3Title ->
            "Economic abuse and your credit report"

        HelpSelfDebtResource3Quote1 ->
            "The impact of economic abuse is practical – I have struggled to get a mortgage because he has left such an impact on my credit rating."

        HelpSelfDebtResource3Quote2 ->
            "Bruises heal, credit files recover eventually. But hearts and minds will always remain fragile."

        HelpSelfDebtResource3Summary ->
            "This information will help you understand how your finances could be linked to an abuser on your credit report. It will guide you through how to break those links and how to be sure that nobody can access your address details through linked credit reports if you have moved."

        HelpSelfDebtResource3Link ->
            "Economic abuse and your credit report [PDF 535kB]"

        -- Help Self single Housing
        HelpSelfHousingTitle ->
            "Information to support you with housing"

        HelpSelfHousingResource1Title ->
            "Finding a safe place to live"

        HelpSelfHousingResource1Quote1 ->
            "This is the reality – me and the kids sleeping at my friend's and he's in our old home, which I jointly owned."

        HelpSelfHousingResource1Quote2 ->
            "The situation became dangerous and I left the house with two bags of our clothes. I rent and will probably never buy, but we are safe."

        HelpSelfHousingResource1Summary ->
            "The nature of economic abuse may make your housing situation complex. This information lays out some of the options that you may have and the support that may be available to help ensure you have a safe place to live."

        HelpSelfHousingResource1Link ->
            "Finding a safe place to live [PDF 507kB]"

        -- Help Self Single Financial Support
        HelpSelfFinancialTitle ->
            "Information to help you find financial support"

        HelpSelfFinancialResource1Title ->
            "Grants, benefits and financial help"

        HelpSelfFinancialResource1Quote1 ->
            "He applied for multiple loans in my name by using the app on my  phone. Loans for over £50,000 in total."

        HelpSelfFinancialResource1Quote2 ->
            "I had been putting off speaking to anyone as I didn’t know how to approach these companies. But with the help of my debt advisor, I was successful in removing a contract in my name and the debt was written off in full."

        HelpSelfFinancialResource1Summary ->
            "Find information on charities and organisations that can support you with money, debt information and advice. There are also many organisations that support people in financial difficulty with grants to help with day-to-day expenses."

        HelpSelfFinancialResource1Link ->
            "Grants, benefits and financial help [PDF 622kB]"

        HelpSelfFinancialResource2Title ->
            "Economic abuse and supporting children"

        HelpSelfFinancialResource2Quote1 ->
            "When we had a baby, he took it upon himself to go and register their births while I was in hospital so he could claim child benefit."

        HelpSelfFinancialResource2Quote2 ->
            "We don't have much to live off at the moment but knowing that my child is now safe is the most important thing to me. I'm now more positive that we will find our feet financially"

        HelpSelfFinancialResource2Summary ->
            "If you are experiencing economic abuse and have children, caring for them may be a lot more  challenging. You may struggle to ensure they have everything they need, but support is available. This information outlines some of the options to help you and your children find safety, and financial support."

        HelpSelfFinancialResource2Link ->
            "Economic abuse and supporting children [PDF 533kB]"

        HelpSelfFinancialResource3Title ->
            "Economic abuse and eligibility for benefits and public funds "

        HelpSelfFinancialResource3Quote1 ->
            "I have no recourse to public funds here in the UK. As such I have no money and so he is able to control and dictate my life."

        HelpSelfFinancialResource3Quote2 ->
            "Learning about my rights and what help there is out there has been the first step to regaining some control. I didn't even realise there were advisors who could help me."

        HelpSelfFinancialResource3Summary ->
            "If you are in the UK on a spousal visa or another visa the 'no recourse to public funds' rule means that you are not entitled to key welfare benefits and local authority housing. This can be a major barrier to escaping abuse. This information will provide steps you can take and places you can turn to for legal, housing, welfare and practical support."

        HelpSelfFinancialResource3Link ->
            "Economic abuse and no recourse to public funds [PDF 560kB]"

        -- Help Self Single Covid
        HelpSelfCovidTitle ->
            "Information about COVID-19 and your finances"

        -- Help Self Single Info and Law
        HelpSelfInfoLawTitle ->
            "Information about economic abuse and the law"

        -- Help Self Single Separating Finances from Abuser
        HelpSelfSeparatingTitle ->
            "Information to help you separate your finances from the abuser"

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
