import Swal from 'sweetalert2';
const feedbackModal = () => {
  console.log("TRIGGERED : feedBackModal");

  // const modal = document.getElementById("new-feedback-modal");
  const btn = document.getElementById("new-feedback-bttn");
  // const span = document.getElementsByClassName("close")[0];

  btn.onclick = () => {
    Swal.fire({
      text: "We'd love to hear what you think! Leave your anonymous comments here:",
      input: "textarea",
      confirmButtonText: "Submit",
      confirmButtonColor: "#6966F6",
      showCancelButton: true,
      cancelButtonColor: "#5A5766",
      cancelButtonText: "Back",
      inputValidator: (value) => {
          if (!value) {
            return "Please don't leave this empty! We need you!"
          }
        }
    }).then(function(result) {

      if (result) {
        const authenticityToken = document.querySelector('[name="csrf-token"]').content;
        const xhr = new XMLHttpRequest();
        const toSend = {
            authenticity_token: authenticityToken,
            feedback: {
              content: result.value
            }
          };
        xhr.open("POST", "/feedbacks");
        xhr.setRequestHeader("Content-type", "application/json");
        xhr.send(JSON.stringify(toSend));
        Swal.fire({
          title: "Thanks!",
          text: "Feedback is a gift. Reko loves you.",
          confirmButtonText: "Close",
          confirmButtonColor: "#6966F6",
        });
    }});
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
