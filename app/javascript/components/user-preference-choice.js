const toggleButtons = () => {
  console.log("TRIGGERED : toggleButtons");

  const userChoices = document.querySelectorAll(".user_preference_choice")
  const userChoiceInputs = document.querySelectorAll(".user_preference_choice_input")
  const submitButton = document.querySelector('.user_preference_choices input[type="submit"]')

  userChoiceInputs.forEach(userChoiceInput => {
    var labels = document.getElementsByTagName('LABEL');
    for (var i = 0; i < labels.length; i++) {
        if (labels[i].htmlFor != '') {
             var elem = document.getElementById(labels[i].htmlFor);
             if (elem)
                elem.label = labels[i];
        }
    }

    if (userChoiceInput.checked) {
      userChoiceInput.label.classList.add("active");
      submitButton.disabled = false;
    }
  })

  userChoices.forEach(userChoice => {
    userChoice.addEventListener('click', event => {
      userChoice.classList.toggle("active")
      let userChoiceActiveCounter = 0
      userChoices.forEach(userChoice => {
        if (userChoice.classList.contains("active")) userChoiceActiveCounter += 1
      })
      submitButton.disabled = !(userChoiceActiveCounter > 0)
    });
  });
};

export { toggleButtons }
