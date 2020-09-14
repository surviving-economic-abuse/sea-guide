import { Elm } from "../Main.elm";

var elm = Elm.Main.init({
  node: document.getElementById("app")
});



// Google analytics subscribe to page changes and custom events
elm.ports.updateAnalyticsPage.subscribe(function (page) {
    gtag('config', 'UA-30970110-8', { 'page_path': page });
});

elm.ports.updateAnalyticsEvent.subscribe(function (gaEvent) {
    gtag('event', gaEvent.action, { 'event_category' : gaEvent.category, 'event_label' : gaEvent.label });
});

