import { Elm } from "../Main.elm";


var hasConsented = sessionStorage.getItem("ga-cookie-consent") ? sessionStorage.getItem("ga-cookie-consent") : "null";

var elm = Elm.Main.init({
  flags: hasConsented,
  node: document.getElementById("app")
});


elm.ports.saveConsent.subscribe(function(hasConsented) {
    // User will have to re-consent every time browser is closed, but not on refresh.
    sessionStorage.setItem('ga-cookie-consent', hasConsented);
});

// Google analytics subscribe to page changes and custom events
elm.ports.updateAnalyticsPage.subscribe(function (page) {
    gtag('config', 'UA-30970110-8', { 'page_path': page });
});

elm.ports.updateAnalyticsEvent.subscribe(function (gaEvent) {
    gtag('event', gaEvent.action, { 'event_category' : gaEvent.category, 'event_label' : gaEvent.label });
});
