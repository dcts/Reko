import "bootstrap";
// import { copyLink } from "../components/copylink";
import { makeSwipe } from "../components/swipe";
import { addNewRekos } from "../api-search/add-new-rekos";
import toggleButtons from "../components/user-preference-choice";
import { copyToClipboard } from "../components/copy-to-clipboard";


// copyLink();
makeSwipe();
toggleButtons();
addNewRekos();
copyToClipboard();
