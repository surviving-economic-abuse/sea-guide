port module Analytics exposing (updateAnalytics, updateAnalyticsEvent, updateAnalyticsPage)

-- js ports can only take one arg - so bundle event strings


type alias GaEvent =
    { category : String
    , action : String
    , label : String
    }



-- We only want to send analytics info if we have cookie consent


updateAnalytics : Bool -> Cmd msg -> Cmd msg
updateAnalytics hasConsented sendAnalyticsMessage =
    if hasConsented then
        sendAnalyticsMessage

    else
        Cmd.none


port updateAnalyticsPage : String -> Cmd msg


port updateAnalyticsEvent : GaEvent -> Cmd msg
