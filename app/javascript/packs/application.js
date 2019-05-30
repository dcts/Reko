import "bootstrap";
import { copyLink } from "../components/copylink";
import { makeSwipe } from "../components/swipe";
import { searchFlow } from "../api-search/add-rekos-flow";
import toggleButtons from "../components/user-preference-choice";
import { copyToClipboard, test } from "../components/copylink-new";


copyLink();
makeSwipe();
toggleButtons();
searchFlow();
test();
