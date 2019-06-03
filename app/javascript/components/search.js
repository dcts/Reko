const search = () => {
  console.log("TRIGGERED : search"); // add this console log to monitor which script get triggered!

  // -----------------------
  // LOAD DATA + DOM OBJECTS
  // -----------------------

  // get params (from url)
  const senderName = document.getElementById('params_senderName').value;;
  const token = document.getElementById('params_token').value;
  // get DOM elements
  const formInitialSearch = document.getElementById("formInitialSearch");
  const inputKeyword = document.getElementById("inputKeyword");
  const buttonContinue = document.getElementById("buttonContinue");
  const buttonBack = document.getElementById("buttonBack");

  // ----------------------------
  // LISTENERS + HELPER FUNCTIONS
  // ----------------------------
  formInitialSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    window.location = `/rekos/new?token=${token}&sender_name=${senderName}&search_term=${inputKeyword.value}`;
  });
  buttonBack.addEventListener("click", (event) => {
    window.location = `/rekos/new/onboarding?token=${token}&sender_name=${senderName}`;
  });
  inputKeyword.addEventListener("keyup", (event) => {
    setButtonState(inputKeyword.value);
  });
  const setButtonState = (userInput) => {
    if (userInput.length >= 2) {
      buttonContinue.classList.add("visible");
      buttonContinue.classList.remove("invisible");
    } else {
      buttonContinue.classList.remove("visible");
      buttonContinue.classList.add("invisible");
    }
  };

  // -----------
  // MAIN SCRIPT
  // -----------
  setButtonState("");
}

export { search };
