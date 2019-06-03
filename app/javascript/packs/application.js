import "bootstrap";

import { makeSwipe } from "../components/swipe";
import { addNewRekos } from "../search-itunes-api/add-new-rekos";
import { toggleButtons } from "../components/user-preference-choice";
import { copyToClipboard } from "../components/copy-to-clipboard";
import { feedbackModal } from "../components/feedback-modal";


/*
 * IMPORTANT
 * IF YOU USE JAVASCRIPT BE SURE THAT YOU FOLLOW THE FOLLOGIN PATTERN
 * CHECK THE FOLLOWING 3 FILES:
 * - your view file   (yourpage.html.erb)
 * - your js-file     (app/javascript/../your-script-name.js)
 * - js importer file (app/javascript/packs/application.js) <-- YOU ARE CURRENTLY HERE
 *
 * Follow this link for easy copy paste templates:
 * WIKI LINK: https://github.com/dcts/reko/wiki/Organising-Javascript-Code
*/

/*
 * HELPER FUNCTION TO LOAD JAVASCRIPT FILES
 * - loads the scripts only if we are on the right page
 * - initializeFunction is a function that gets passed as variable
 * - classname is a string that defines the name of the class
*/
const triggerJsOnTarget = (initializeFunction, classname) => {
  if (document.querySelector(`.${classname}`)) { // add period (-> class selector)
    initializeFunction();                        // trigger script if element exists
  }
};

// INITIALIZERS
console.log("Hi from JS-initializer script!");
triggerJsOnTarget(copyToClipboard, "jsTrigger-copyToClipboard");
triggerJsOnTarget(addNewRekos,     "jsTrigger-addNewRekos");
triggerJsOnTarget(makeSwipe,       "jsTrigger-makeSwipe");
triggerJsOnTarget(toggleButtons,   "jsTrigger-toggleButtons");
triggerJsOnTarget(feedbackModal,   "jsTrigger-feedbackModal");









