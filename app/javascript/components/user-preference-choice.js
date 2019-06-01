const toggleButtons = () => {
  console.log("---TRIGGERED : toggleButtons");

  const userChoices = document.querySelectorAll(".user_preference_choice")
  const submitButton = document.querySelector('.user_preference_choices input[type="submit"]')
  if (userChoices) {
    userChoices.forEach(userChoice => {
      userChoice.addEventListener('click', event => {
        userChoice.classList.toggle("active")
        let userChoiceActiveCounter = 0
        userChoices.forEach(userChoice => {
          if (userChoice.classList.contains("active")) userChoiceActiveCounter += 1
        })
        submitButton.disabled = !(userChoiceActiveCounter > 0)
      })
    })
  }
}

export { toggleButtons }
