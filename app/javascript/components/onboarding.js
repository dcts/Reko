const onboarding = () => {
  console.log("TRIGGERED : onboarding"); // add this console log to monitor which script get triggered!

  // -----------------------
  // LOAD DATA + DOM OBJECTS
  // -----------------------

  // get authenticity token and params (from url)
  const authenticityToken = document.querySelector('[name="csrf-token"]').content;
  const senderName = document.getElementById('params_senderName').value;;
  const token = document.getElementById('params_token').value;
  // get DOM elements
  const formSubmitName = document.getElementById("formSubmitName");
  const inputName = document.getElementById("inputName");
  const buttonContinue = document.getElementById("buttonContinue");

  // ----------------------------
  // LISTENERS + HELPER FUNCTIONS
  // ----------------------------

  // make button appear when name has at least 2 characters
  inputName.addEventListener("keyup", (event) => {
    setButtonState(inputName.value);
  });

  // sets the state of the button as condition if there is enough user input provided!
  const setButtonState = (userInput) => {
    if (userInput.length >= 2) {
      buttonContinue.classList.add("visible");
      buttonContinue.classList.remove("invisible");
    } else {
      buttonContinue.classList.remove("visible");
      buttonContinue.classList.add("invisible");
    }
  };

  // add eventlistener to onboarding
  formSubmitName.addEventListener("submit", (event) => {
    event.preventDefault();
    // console.log(`/rekos/new?token=${token}&sender_name=${senderName}`);
    window.location = `/rekos/new?token=${token}&sender_name=${inputName.value}`;
  });

  // -----------------------------
  // SCRIPT THAT RUNS ALL ACTIONS!
  // -----------------------------

  // initialize button state (in case sender name is encoded in URL)
  setButtonState(senderName);
}

export { onboarding }
