import "bootstrap";
import { makeSwipe } from "../components/swipe";
import { addNewRekos } from "../api-search/add-new-rekos";
import toggleButtons from "../components/user-preference-choice";
import { copyToClipboard } from "../components/copy-to-clipboard";
import { copyLink } from "../components/copylink"; // do we want to keep this function?

// IMPORTANT
// IF YOU USE JAVASCRIPT BE SURE THAT YOU FOLLOW THE FOLLOGIN PATTERN
// Be sure that your code follows that pattern. Check the following 3 files:
// - your view file   (yourpage.html.erb)
// - your js-file     (app/javascript/../your-script-name.js)
// - js importer file (app/javascript/packs/application.js) <-- THIS FILE

// Follow this link for easy copy paste templates:
// WIKI LINK: https://github.com/dcts/reko/wiki/Organising-Javascript-Code


// initializers
console.log("Hi from JS-initializer script!");

if (document.getElementById("jsTrigger-copyToClipboard")) {
  copyToClipboard();
}
if (document.getElementById("jsTrigger-addNewRekos")) {
  addNewRekos();
}
// do these later
makeSwipe();
toggleButtons();



