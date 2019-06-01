const feedbackModal = () => {
  console.log("TRIGGERED : feedBackModal");

  // const modal = document.getElementById("new-feedback-modal");
  const btn = document.getElementById("new-feedback-bttn");
  // const span = document.getElementsByClassName("close")[0];

  btn.onclick = () => {
    swal("We'd love to hear what you think! Leave your anonymous comments here:", {
      content: "input",
    }
    )
    .then(function(value) {
      const authenticityToken = document.getElementById("auth").value;
      const xhr = new XMLHttpRequest();
      const toSend = {
          authenticity_token: authenticityToken,
          feedback: {
            content: value
          }
        };
      xhr.open("POST", "/feedbacks");
      xhr.setRequestHeader("Content-type", "application/json");
      xhr.send(JSON.stringify(toSend));
      swal(`Thanks! Feedback is a gift.`);
    });
  }

  // span.onclick = () => {
  //   modal.style.display = "none";
  // }

  // window.onclick = (event) => {
  //   if (event.target == modal) {
  //     modal.style.display = "none";
  //   }
  // }
}
export { feedbackModal };
