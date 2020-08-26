import { Elm } from "../Main.elm";

const basePath = new URL(document.baseURI).pathname;

Elm.Main.init({
  node: document.getElementById("app"),
  flags: { basePath },
});
