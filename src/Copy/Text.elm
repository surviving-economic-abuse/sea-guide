module Copy.Text exposing (t)

import Copy.Keys exposing (Key(..))



-- The translate function
-- To insert bold text, surround with []
-- Example usage: View.Definition.renderWithKeywords


t : Key -> String
t key =
    case key of
        SiteTitle ->
            "Economic Abuse Support Tool"

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

        --- External Hrefs
        DomesticAbuseHref ->
            "https://www.nationaldahelpline.org.uk"

        WomensAidHref ->
            "https://chat.womensaid.org.uk"

        SeaSurvivorForumHref ->
            "https://example.com/[cCc]"

        -- Resource pdfs
        SeaOrganisationsResourceHref ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2019/12/Organisations-that-can-help___.pdf"

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

        HelpSelfCovidResource1Href ->
            "https://survivingeconomicabuse.org/coronavirus-info"

        HelpSelfCovidResource2Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/04/How-banks-can-help-during-the-Covid-19-outbreak.pdf"

        HelpSelfInfoLawResource1Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/08/Economic-abuse-and-controlling-or-coercive-behaviour.pdf"

        HelpSelfInfoLawResource2Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/01/Economic-abuse-and-the-Domestic-Abuse-Bill.pdf"

        HelpSelfSeparatingResource1Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/08/Steps-you-can-take-towards-economic-safety-2020.pdf"

        HelpSelfSeparatingResource2Href ->
            "https://survivingeconomicabuse.org/wp-content/uploads/2020/01/Separating-finances-from-the-abuser.pdf"

        -- Cookies and Privacy
        CookieBannerP ->
            "[cCc] Can we use cookies to help improve this site? We'd like to use Google Analytics cookies to collect and report information on how people use the site. Allowing us to use cookies does not allow us to identify you."

        CookieBannerPrivacyButton ->
            "[cCc] Privacy information"

        CookieAcceptButton ->
            "[cCc] Accept"

        CookieDeclineButton ->
            "[cCc] Decline"

        CookieSettingsButton ->
            "[cCc] Cookie settings"

        PrivacyContent ->
            "[cCc] This will grow. Privacy info."

        -- Not Alone page
        NotAloneTitle ->
            "You are not alone"

        -- \u{00A0} is a non-breaking space that prevents a single word wrapping to a new line
        Journey1Teaser ->
            "He threw my phone on the floor and smashed\u{00A0}it"

        Journey1Image ->
            "/Person_1.svg"

        Journey1Relatable ->
            "When I took a call from someone my boyfriend didn't approve of, he threw my [mobile phone] on the floor and smashed it. I had to buy 3 new phones last year."

        Journey1Hopeful ->
            "I spoke to a friend one day in the park who told me that wasn't ok. It was just helpful to speak to someone you know."

        Journey1Statement ->
            "Looking back on it now I can see that there were so many small things like that. I still find it difficult to trust people but at least I'm free."

        Journey2Teaser ->
            "He considered my money\u{00A0}his"

        Journey2Image ->
            "/Person_2.svg"

        Journey2Relatable ->
            "Over the years, the [criticism, blame and undermining] increased. He used to run me down, tell me I was stupid at dinner parties... He considered my money his, and when I bought something with [my money] he got very cross. He would stand over me or block the door, and once tried to push me down the stairs."

        Journey2Hopeful ->
            "The situation became dangerous and I left the house with two bags of clothes. I rent and will probably never buy, but we are safe."

        Journey2Statement ->
            "We are happy, and he no longer has control over our lives."

        Journey3Teaser ->
            "I had no control over my\u{00A0}life"

        Journey3Image ->
            "/Person_3.svg"

        Journey3Relatable ->
            "To be so [powerless], I can't explain what it's like, it's overwhelming. Not being able to [provide for your children]. You have absolutely no control over your life."

        Journey3Hopeful ->
            "Advocacy is so important, especially when you are [fearing homelessness] and losing the children. I found a senior person in the bank who advocated on my behalf from within. His advice made a huge difference."

        Journey3Statement ->
            "This will end and normality will return."

        Journey4Teaser ->
            "He controlled what I wore and who I spoke\u{00A0}to"

        Journey4Image ->
            "/Person_4.svg"

        Journey4Relatable ->
            "He controlled what I wore, what I ate and drank, who I saw, who I spoke to, my social media, [my telephone, our bank accounts, my credit card]. He controlled how much sleep I had. He made it near impossible for me to sustain a [full-time job], yet he refused to work. He trashed [my property]. He tracked and traced my every move. I was so brainwashed at the end of the relationship; I didn't know who I was anymore."

        Journey4Hopeful ->
            "My bank were aware of the abuse and they always found a room for me, as it is difficult explaining such distressing personal information in open plan spaces."

        Journey4Statement ->
            "It's really made me think. I can see the connection between the abuser's behaviour and my financial situation now."

        Journey5Teaser ->
            "He took out loans in my\u{00A0}name"

        Journey5Image ->
            "/Person_5.svg"

        Journey5Relatable ->
            "When I left the relationship I realised he had taken out [loans and credit cards] in joint names I knew nothing about."

        Journey5Hopeful ->
            "I had been putting off speaking to anyone as I didn't know how to approach these companies. But with the help of my debt advisor, I was successful in removing a contract in my name and the debt was written off in full."

        Journey5Statement ->
            "I feel like I've got my life back. I can take the kids on holiday and we are free."

        Journey6Teaser ->
            "He used our joint account for his own\u{00A0}expenses"

        Journey6Image ->
            "/Person_6.svg"

        Journey6Relatable ->
            "The abuse started with how we organised our bank accounts when we first lived together. We opened [a joint account] for household bills but within a year, he had transferred all his own direct debits to the joint account."

        Journey6Hopeful ->
            "I was so relieved when my debt advisor explained the situation to the creditor and they agreed to write it off. It's one less thing hanging over me while I start my new life."

        Journey6Statement ->
            "I refuse to be told that nothing can be done and I want change for other victims. I know first-hand how devastating the effects of economic abuse can be."

        ExpandQuoteButton ->
            "but things got better"

        ToDefinitionReassuringText ->
            "If this sounds familiar know that you're not alone."

        ToDefinitionFromNotAloneLink ->
            "Find out about economic abuse"

        CloseButton ->
            "Close button"

        ExitButton ->
            "EXIT SITE"

        EmergencyButton ->
            "I need help"

        EmergencyReassure ->
            "Do you need help?"

        EmergencyPoliceInfo ->
            "If you are in immediate danger, call the police on"

        EmergencyPoliceNumber ->
            "999"

        EmergencyNotImmediateReassure ->
            "If you are not in immediate danger but need support, there are helplines available:"

        EmergencyDomesticAbuseLink ->
            "National Domestic Abuse Helpline"

        EmergencyDomesticAbusePrompt ->
            "Call"

        EmergencyDomesticAbuseInfo ->
            "(available 24/7) or access the service online."

        EmergencyDomesticAbuseNumber ->
            "0808 2000 247"

        EmergencyWomensAidLink ->
            "Women's Aid online chat"

        EmergencyWomensAidInfo ->
            "Chat directly with a Women's Aid support worker."

        EmergencyOtherOrganisationsLink ->
            "Find other organisations that can help here."

        -- Definition page
        DefinitionTitle ->
            "Are you experiencing economic abuse?"

        DefinitionConciseP1 ->
            "In your relationship, who has control over the money? Are the bills in your name or theirs? Maybe they're the only one who can login to online banking? Or make you count every penny you spend?"

        DefinitionConciseP2 ->
            "Have they stopped you from earning money or going to work? Spent their money how they wanted while your money was used for essentials?"

        DefinitionConciseP3 ->
            "Domestic abuse is not always physical. An abuser may restrict how you make or spend your money, or control other areas of your life including housing, food and clothing. This is known as [economic abuse]. It is commonly experienced within a type of abuse called [coercive control]."

        DefinitionConciseP4 ->
            "[1 in 5] adults in the UK have experienced economic abuse at some point."

        DefinitionGetHelpLink ->
            "people and organisations who understand and who can help"

        DefinitionCategory1Title ->
            "Controlling how you access or earn money"

        DefinitionCategory1Info ->
            "An abuser may try to stop you from accessing money. Maybe they've said you should no longer be working, or told you to limit the hours you do. They might tell you your salary should be paid into their personal account or a [joint account], and that you don't need your own bank account. If you're not working, they might have told you not to claim any [benefits]."

        DefinitionCategory1Quote1 ->
            "I stayed at home to look after the children. It made sense, I felt like he could earn a lot more than me. But nothing was in my name. I hated having to ask for my allowance every week."

        DefinitionCategory1Quote2 ->
            "I'm always being offered extra shifts at work and chances to go on training, but my partner always stops me."

        DefinitionCategory2Title ->
            "Controlling what you spend money on"

        DefinitionCategory2Info ->
            "An abuser may tell you what you can and can't spend your money on. They might ask to see receipts from the weekly food shop or give you an [allowance]. You might have to [justify every single purchase]. An abuser might take control of your things - from your phone to your car. Or they may have insisted that all [assets], such as savings or the house, are put in their name. While demanding this from you, they might keep their own finances very secret."

        DefinitionCategory2Quote1 ->
            "If I bought anything, anything at all - like one time I needed something to wear to an interview — he'd demand to see exactly how much it cost, then tell me I was wasteful."

        DefinitionCategory2Quote2 ->
            "We had a joint account but he never paid anything into it. All the bills came out, even the repayments for the car. But it was in his name, not mine. And he wouldn't let me drive it without begging."

        DefinitionCategory3Title ->
            "Destroying your resources and economic security"

        DefinitionCategory3Info ->
            "An abuser may try to weaken or sabotage your finances or whatever economic resources you do have. This could mean [stealing money or property] from you or damaging your house. It could also mean spending the money set aside for [savings, holidays or bills]. They could also force all credit cards and bills to be in your name, so they don't build up debt in their name."

        DefinitionCategory3Quote1 ->
            "When I found out his new girlfriend was buying big things for him on her credit card the way I had, that sowed the seed of actually, is this a deliberate thing?"

        DefinitionCategory3Quote2 ->
            "He'd walk out of jobs, I was having to work more and more, and he continued to spend as if he was a millionaire. So I was buying from charity shops, even though I had a really good wage."

        DefinitionCategory4Title ->
            "Taking advantage of your money and economic resources"

        DefinitionCategory4Info ->
            "An abuser may attempt to take advantage of the economic resources you do have. They might refuse to contribute to household costs, like utility bills or the car. They might take wages or benefits from you, or run up [debt in your name]."

        DefinitionCategory4Quote1 ->
            "My salary had gone into his business account, of which he had sole sign-off on. I suddenly had very limited access to money, and would have to have a very specific need for him to grant me any."

        DefinitionCategory4Quote2 ->
            "He applied for multiple loans in my name by using the app on my phone. Loans for over £50,000 in total."

        DefinitionCategory5Title ->
            "Threatening you"

        DefinitionCategory5Info ->
            "Economic abuse often happens alongside other kinds of abuse. An abuser could be violent or [threaten violence] if you don't agree with their demands."

        DefinitionCategory5Quote1 ->
            "My ex made me run up debts on them which are now unaffordable for me to repay. He would push me against a wall, put his hands around my throat if I didn't give him money."

        DefinitionCategory5Quote2 ->
            "If I didn't have enough cash to pay for what he wanted, he would give me an ultimatum - what would cost more: to buy him what he wanted or the cost of the damage he would do when he smashed everything in sight. So I got my credit card out and ended up with £3,000 worth of debt."

        DefinitionCategory6Title ->
            "Manipulating or coercing you"

        DefinitionCategory6Info ->
            "Economic abuse can be hard to spot and often happens without you realising. It could start with behaviour that seems protective or caring such as [offering to take care of all the finances] or [encouraging you not to work] so that you can look after the children. Overspending and building up debts in your name can also develop slowly and may not be obvious at first. Some women may have lived with economic abuse for many years without knowing. It can also continue after leaving or [divorce]."

        DefinitionCategory6Quote1 ->
            "Even after I came out of refuge and a debt charity helped me, I don't think it clicked that it wasn't half my fault anyway. Because I think it takes a long time to get over that kind of, 'Well, you must be just crap with money then' thinking."

        DefinitionCategory6Quote2 ->
            "I often wonder how I got here. I got married to this charming man in the legal profession and we had children. But it was after I got married that I was systematically and unwittingly socially isolated, psychologically, emotionally, financially abused and controlled."

        SplitterAffirmation ->
            "If you are experiencing economic abuse, you are not alone. There are\npeople and\u{00A0}organisations who understand and who can help."

        ToGetHelpFromDefinitionLink ->
            "Find people to talk to"

        ToHelpSelfFromDefinitionLink ->
            "Find information that can help"

        -- Help Self page
        HelpSelfTitle ->
            "Get help with..."

        HelpSelfBankingLink ->
            "Banking"

        HelpSelfDebtLink ->
            "Debt"

        HelpSelfHousingLink ->
            "Housing"

        HelpSelfFinancialLink ->
            "Financial support"

        HelpSelfCovidLink ->
            "COVID-19"

        HelpSelfInfoLawLink ->
            "Economic abuse and the law"

        HelpSelfSeparatingLink ->
            "Separating finances from an abusive partner"

        ToDefinitionFromHelpSelfLink ->
            "Read more about the signs of economic abuse"

        ToNotAloneFromHelpSelfLink ->
            "Read more about survivors' experiences"

        ToGetHelpFromHelpSelfLink ->
            "Find people to talk to"

        ToHelpSelfFromSingleCategoryLink ->
            "Choose another topic"

        HelpSelfPdfDownloadLabel ->
            "Full guide: "

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
            "The debt has been written off and I feel like I've got my life back. I can take the kids on holiday and we are free."

        HelpSelfDebtResource1Summary ->
            "Forcing or coercing someone into debt is a common form of economic abuse. An abuser may convince you to take out a credit card or loan you don’t want to, use your credit card or take out a loan in your name without your knowledge. This information can help you understand what coerced debt is and provide possible solutions."

        HelpSelfDebtResource1Link ->
            "What is coerced debt? [PDF 542kB]"

        HelpSelfDebtResource2Title ->
            "Asking a lender for a debt write-off"

        HelpSelfDebtResource2Quote1 ->
            "I was already feeling vulnerable in my home life and worried about keeping myself and my children safe. But dealing with creditors chasing me for money amplified my anxiety of the whole world collapsing on top of me."

        HelpSelfDebtResource2Quote2 ->
            "I was so relieved when my debt advisor explained the situation to the creditor and they agreed to write it off. It's one less thing hanging over me while I start my new life."

        HelpSelfDebtResource2Summary ->
            "There are a number of solutions to dealing with coerced debt that you can explore with a qualified debt adviser. These include explaining the circumstances to the lender and asking them to write off the debt. This isn't a guaranteed solution but the information in this guide will help you understand your options."

        HelpSelfDebtResource2Link ->
            "Asking a lender for a debt write-off [PDF 541kB]"

        HelpSelfDebtResource3Title ->
            "Economic abuse and your credit report"

        HelpSelfDebtResource3Quote1 ->
            "The impact of economic abuse is practical - I have struggled to get a mortgage because he has left such an impact on my credit rating."

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
            "This is the reality - me and the kids sleeping at my friend's and he's in our old home, which I jointly owned."

        HelpSelfHousingResource1Quote2 ->
            "The situation became dangerous and I left the house with two bags of our clothes. I rent and will probably never buy, but we are safe."

        HelpSelfHousingResource1Summary ->
            "If you are worried about your safety and your economic situation, finding somewhere to live, away from the abuser, may be one of your first priorities. This information lays out some of the options that you may have and the support available to help ensure you have a safe place to live."

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
            "I had been putting off speaking to anyone as I didn't know how to approach these companies. But with the help of my debt advisor, I was successful in removing a contract in my name and the debt was written off in full."

        HelpSelfFinancialResource1Summary ->
            "Find information on charities and organisations that can support you with money, debt information and advice. There are also grants and payments available for people in financial need to help with day-to-day expenses."

        HelpSelfFinancialResource1Link ->
            "Grants, benefits and financial help [PDF 622kB]"

        HelpSelfFinancialResource2Title ->
            "Economic abuse and supporting children"

        HelpSelfFinancialResource2Quote1 ->
            "When we had a baby, he took it upon himself to go and register their birth while I was in hospital so he could claim child benefit."

        HelpSelfFinancialResource2Quote2 ->
            "We don't have much to live off at the moment but knowing that my child is now safe is the most important thing to me. I'm now more positive that we will find our feet financially"

        HelpSelfFinancialResource2Summary ->
            "If you are experiencing economic abuse and have children, caring for them may be a lot more challenging. You may struggle to ensure they have everything they need, but support is available. This information outlines some of the options to help you and your children find safety and financial support."

        HelpSelfFinancialResource2Link ->
            "Economic abuse and supporting children [PDF 533kB]"

        HelpSelfFinancialResource3Title ->
            "Immigration status and eligibility for benefits and public funds"

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

        HelpSelfCovidResource1Title ->
            "Economic abuse and the coronavirus outbreak"

        HelpSelfCovidResource1Summary ->
            "Recommended measures such as limiting social contact, not going to work and self-isolating at home can have implications if you are experiencing economic abuse. This resource can help support your economic wellbeing and your safety during this time."

        HelpSelfCovidResource1Quote1 ->
            "This will end and normality will return."

        HelpSelfCovidResource1Link ->
            "Economic abuse and the coronavirus outbreak [PDF 524kB]"

        HelpSelfCovidResource2Title ->
            "How banks can help during the coronavirus outbreak"

        HelpSelfCovidResource2Summary ->
            "The measures in place to control the spread of coronavirus (COVID-19) may mean that an abusive partner is able to exert more control over your economic situation, particularly in this period of economic uncertainty. Learn about how your bank or building society can support you at this time if you are experiencing economic abuse."

        HelpSelfCovidResource2Link ->
            "How banks can help during the coronavirus outbreak [PDF 497kB]"

        -- Help Self Single Info and Law
        HelpSelfInfoLawTitle ->
            "Information about economic abuse and the law"

        HelpSelfInfoLawResource1Title ->
            "Is economic abuse a crime?"

        HelpSelfInfoLawResource1Summary ->
            "Economic abuse can be a type of controlling or coercive behaviour. In 2015, controlling or coercive behaviour became a crime for the first time. This information outlines how economic abuse is linked to controlling or coercive behaviour, as well as how the law addresses this crime."

        HelpSelfInfoLawResource1Quote1 ->
            "It was sustained emotional abuse and blatant financial coercion and I couldn’t see it. I was like a frog in boiling water. If you throw it straight in, it feels the heat and hops out. If the temperature increases slowly, it is gradually melts. That is what coercive control feels like. You don’t notice until it is too late."

        HelpSelfInfoLawResource1Link ->
            "Economic abuse and controlling or coercive behaviour [PDF 527kB]"

        HelpSelfInfoLawResource2Title ->
            "Economic abuse and the Domestic Abuse Bill"

        HelpSelfInfoLawResource2Summary ->
            "The Domestic Abuse Bill includes economic abuse as a form of domestic abuse, recognising it in law for the very first time. This resource provides information on how victims and survivors can access justice through the law."

        HelpSelfInfoLawResource2Link ->
            "Economic abuse and the Domestic Abuse Bill [PDF 505kB]"

        -- Help Self Single Separating Finances from Abuser
        HelpSelfSeparatingTitle ->
            "Information to help you separate your finances from the abuser"

        HelpSelfSeparatingResource1Title ->
            "Steps you can take towards economic safety"

        HelpSelfSeparatingResource1Summary ->
            "If you are worried about your safety and your economic situation, support is available. This information outlines some immediate steps you can take to protect yourself and begin to regain control."

        HelpSelfSeparatingResource1Quote1 ->
            "I thought I was broken, then I realised I am not alone. I started to believe I could come through this."

        HelpSelfSeparatingResource1Link ->
            "Steps you can take towards economic safety [PDF 559kB]"

        HelpSelfSeparatingResource2Title ->
            "Separating your finances from the abuser"

        HelpSelfSeparatingResource2Summary ->
            "If you have experienced economic abuse and are leaving the abuser, you will be making some very brave decisions and taking some very important steps to reach safety. This resource can help you identify your financial links with the abuser, and how you can break those links to regain control of your own finances."

        HelpSelfSeparatingResource2Quote1 ->
            "When I left the relationship I realised he had taken out loans and credit cards in joint names I knew nothing about."

        HelpSelfSeparatingResource2Quote2 ->
            "He started using the joint account for cash withdrawals when it was supposed to be for bills. He then accused me of overspending."

        HelpSelfSeparatingResource2Link ->
            "Separating your finances from the abuser [PDF 528kB]"

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
            "Contact the Financial Support Line for victims of domestic abuse (Mon-Fri, 9am-1pm & 2pm-5pm) for specialist advice to victim-survivors of domestic abuse in financial difficulty."

        GetHelpSection2CallToAction1Prompt ->
            "Call or text"

        GetHelpSection2CallToAction1Number ->
            "01323 635987"

        GetHelpSection2CallToAction2 ->
            "Email DEAP@moneyadviceplus.org.uk"

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
