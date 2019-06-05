const switchRandomAvatar = () => {
  console.log("TRIGGERED : switchRandomAvatar");

  // LOAD DATA
  // const authenticityToken = document.getElementById("auth").value;
  const authenticityToken = document.querySelector('[name="csrf-token"]').content;
  const userId = document.getElementById("userId").value;
  // LOAD DOM ELEMENTS
  const avatarImage = document.getElementById("avatar-inbox-page");
  avatarImage.addEventListener("click", (event) => {
    switchRandomAvatar();
  });

  // send custom POST request to change image_url
  const switchRandomAvatar = () => {
    const xhr = new XMLHttpRequest();
    // process server response
    xhr.onload = function () {
      const jsonResponse = JSON.parse(this.response);
      avatarImage.src = jsonResponse.image_url;
    };
    // DATA TO SEND
    const toSend = {
      authenticity_token: authenticityToken,
      id: userId
    };
    xhr.open("POST", "/users/switch_random_avatar");
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(JSON.stringify(toSend));
    console.log("POST request send with data: ");
    console.log(toSend);
    // REDIRECT USER AFTER POST REQUEST IF YOU NEED TO
    // window.location = <REDIRECTION-URL>
  };
};

export { switchRandomAvatar };
