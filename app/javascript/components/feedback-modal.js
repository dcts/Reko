const feedbackModal = () => {
  console.log("TRIGGERED : feedBackModal");

  const modal = document.getElementById("new-feedback-modal");
  const btn = document.getElementById("new-feedback-bttn");
  const span = document.getElementsByClassName("close")[0];

  btn.onclick = () => {
    modal.style.display = "block";
  }

  span.onclick = () => {
    modal.style.display = "none";
  }

  window.onclick = (event) => {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}
export { feedbackModal };
