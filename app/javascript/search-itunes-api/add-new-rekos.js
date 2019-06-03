const addNewRekos = () => {
  // console.log("---TRIGGERED : addNewRekos");

  // // DATA NEEDED FOR REDIRECTION URL
  // let senderName;
  // const movies = [];
  // const token = document.URL.split("token=")[1];

  // // get encoded data from view
  // const authenticityToken = document.getElementById("auth").value;
  // const rekoTickImgUrl = document.getElementById("rekoTickImgUrl").value;
  // const userSignedIn = document.getElementById("userSignedIn").value === "true";

  // // LOAD DOM ELEMENTS
  // const formSubmitName = document.getElementById("formSubmitName");
  // const formAjaxSearch = document.getElementById("formAjaxSearch");
  // const inputName = document.getElementById("inputName");
  // const inputKeyword = document.getElementById("inputKeyword");
  // const cardsContainer = document.getElementById("search-cards-container");
  // const sendRekosButton = document.getElementById("sendRekosButton");
  // const instructionText = document.getElementById("search-instruction-text");

  // // VARIABLES TO CONTROLL POST REQUESTS
  // let count = 0;
  // let target;

  // // ADD SELECTION EVENT LISTENERS

  // // SEND POST REQUESTS
  // formAjaxSearch.addEventListener("submit", (event) => {
  //   event.preventDefault();
  //   // console.log("SUBMITT EVENT TRIGGERED");
  //   const movies = []; // save movie titles
  //   const cards = document.querySelectorAll(".selected");
  //   target = cards.length;
  //   cards.forEach((card) => {
  //     sendPostRequestToCreateReko(card);
  //   });
  // });

  // // GET REDIRECTION URL
  // const buildRedirectionUrl = () => {
  //   let redirectionUrl;
  //   if (userSignedIn) {
  //     redirectionUrl = "/rekos";
  //   } else {
  //     redirectionUrl = `/thankyou?token=${token}&name=${senderName}&movies=${normalize(movies.join("_and_"))}`;
  //   }
  //   return redirectionUrl
  // };

  // // document.querySelector('body').addEventListener('click', (event) => {
  // //   console.log(event.target);
  // //   console.log(event.target.classList.contains("green-layer"));
  // //   console.log(event.target.id === "sendRekosButton");
  // //   // if (event.target.tagName.toLowerCase() === 'li') {
  // //   //   // do your action on your 'li' or whatever it is you're listening for
  // //   // }
  // // });

  // // ADD EVENTLISTENERS FOR SELECTION
  // // const addSelectionListener = (card) => {
  //   // card.addEventListener("click", (event) => {
  //   //   console.log("current event:");
  //   //   console.log(event);
  //   //   console.log(event.currentTarget);
  //   //   event.currentTarget.classList.toggle("selected");
  //   // });
  // // };
  // // ADD EVENTLISTENERS FOR CARDS
  // const addSelectionListeners = () => {
  //   console.log(cardsContainer);
  //   cardsContainer.childNodes.forEach((card) => {
  //     card.addEventListener("click", (event) => {
  //       console.log("current event:");
  //       console.log(event);
  //       console.log(event.currentTarget);
  //       event.currentTarget.classList.toggle("selected");
  //       setButtonState();
  //     });
  //   });
  // };

  // // ENABLE BUTTON IF ELEMENTS ARE SELECTED
  // const setButtonState = () => {
  //   console.log("inside setButtonState");
  //   console.log(sendRekosButton);
  //   if (document.querySelectorAll(".selected").length > 0) {
  //     console.log("at least one selected");
  //     sendRekosButton.classList.remove("invisible");
  //     sendRekosButton.classList.add("visible");
  //     // sendRekosButton.style.visibility = "visible";
  //   } else {
  //     console.log("none selected");
  //     sendRekosButton.classList.remove("visible");
  //     sendRekosButton.classList.add("invisible");
  //     // sendRekosButton.style.visibility = "collapse";
  //   }
  // };

  // // ADD EVENTLISTENER FOR AJAX CALL
  // inputKeyword.addEventListener("keyup", (event)=> {
  //   apiCall(inputKeyword.value);
  // });

  // // If user is not signed in add event listener to post your name
  // if (userSignedIn == false) {
  //   formSubmitName.addEventListener("submit", (event) => {
  //     event.preventDefault();
  //     if (inputName.value.length < 2) {
  //       alert("your name has to few letters!");
  //     } else {
  //       senderName = inputName.value;
  //       formSubmitName.classList.add("invisible");
  //     }
  //   });
  // }

  // // ADD EVENT LISTENER
  // formSubmitName.addEventListener("submit", (event) => { // webkitTransitionEnd oTransitionEnd MSTransitionEnd"
  //   removeElement(formSubmitName);
  //   // instructionText.innerText = `Thanks ${senderName}`
  //   formAjaxSearch.classList.remove("invisible");
  //   formAjaxSearch.classList.add("visible");
  // });
  // // when name gets submitted
  // // -> wait for transition to end
  // // -> remove nameInputElement and make SearchInput visible
  // // "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd".split(" ").forEach((event) => {
  // //   if (userSignedIn == false) {
  // //     formSubmitName.addEventListener(event, () => { // webkitTransitionEnd oTransitionEnd MSTransitionEnd"
  // //       removeElement(formSubmitName);
  // //       // instructionText.innerText = `Thanks ${senderName}`
  // //       formAjaxSearch.classList.remove("invisible");
  // //       formAjaxSearch.classList.add("visible");
  // //     });
  // //   }
  // // });

  // const sendPostRequestToCreateReko = (card) => {
  //   const xhr = new XMLHttpRequest();
  //   // listener for server response
  //   // whenever the request gets a response the .onload() function gets triggered
  //   xhr.onload = function () {
  //     count += 1;
  //     // console.log("Yay, we got an an answer from the server (request response):");
  //     // console.log(this);
  //     // console.log("check if this was the last post request to send?");
  //     if (count == target) {
  //       window.location = buildRedirectionUrl();
  //     } else {
  //       // console.log(`Nope.. count: ${count} target: ${target}`);
  //     }
  //   };
  //   // DATA TO SEND
  //   senderName = userSignedIn ? "YOU" : senderName;
  //   const toSend = {
  //     authenticity_token: authenticityToken,
  //     reko: {
  //       itunes_id: card.dataset.itunes_id,
  //       title: card.dataset.title,
  //       image_url: card.dataset.image_url,
  //       genre: card.dataset.genre,
  //       sender_name: senderName,
  //       token: token
  //     }
  //   };
  //   xhr.open("POST", "/rekos");
  //   xhr.setRequestHeader("Content-type", "application/json");
  //   xhr.send(JSON.stringify(toSend));
  //   // console.log("POST request send with data: ");
  //   // console.log(toSend);
  // };

  // const normalize = term => {
  //   return term.replace(/ /g, '+');
  // };

  // // ITUNES API CALL FROM JS
  // const apiCall = (searchTerm) => {
  //   // NEEDED TO PREVENT CORS FAILURE? -> do more research on it when time...
  //   const proxyurl = "https://cors-anywhere.herokuapp.com/";
  //   const url = "https://itunes.apple.com/search?media=movie&term=" + normalize(searchTerm); //
  //   fetch(proxyurl + url)
  //   .then((response) => response.json())
  //   .then((data) => {
  //     let movies = [];
  //     data.results.forEach((result) => { // loop over all results
  //       if (result.kind === "feature-movie") {
  //         const movie = buildMovie(result);
  //         movies.push(movie);
  //       }
  //     });
  //     deleteCardsIfNotSelected(); // reset cards
  //     addCards(movies);
  //     addSelectionListeners();
  //   });
  // };

  // const buildMovie = (apiResultObject) => {
  //   return {
  //     "title": apiResultObject.trackName,
  //     "artworkUrl": resizeImage(apiResultObject.artworkUrl100),
  //     "itunesId": apiResultObject.trackId,
  //     "primaryGenreName": apiResultObject.primaryGenreName,
  //   }
  // };

  // const deleteCardsIfNotSelected = () => {
  //   const cards = document.querySelectorAll(".search-card");
  //   cards.forEach((card) => {
  //     if (card.classList.contains("selected") != true) {
  //       removeElement(card);
  //     }
  //   });
  // };

  // const removeElement = (el) => {
  //   el.parentNode.removeChild(el);
  // };

  // const addCards = (movies) => {
  //   movies.forEach((movie) => {
  //     const card = buildCard(movie);
  //     // addSelectionListener(card);
  //     cardsContainer.insertAdjacentElement('beforeend', card);
  //   });
  // };

  // const deleteChildren = (element) => {
  //   while (element.firstChild) {
  //     element.removeChild(element.firstChild);
  //   }
  // };

  // const addChild = (element, movie) => {
  //   element.insertAdjacentHTML("beforeend", `<p>${movie.title}</p>`);
  // };

  // const buildCard = (movie) => {
  //   // create div with class "search-card" // <div class="search-card">
  //   const searchCardDiv = createElWithClasses("div", ["search-card"]);
  //   // create div with class "green-layer" // <div class="green-layer">
  //   const greenLayerDiv = createElWithClasses("div", ["green-layer"]);
  //   // create img with src = ... and alt="tekoTickImg"
  //     // <img src="<%= asset_path 'white-check.svg' %>" alt="rekoTickImg">
  //   searchCardDiv.style.background = `url("${movie.artworkUrl}")`;
  //   searchCardDiv.style.backgroundSize = "cover";
  //   // add reko tick image to card
  //   greenLayerDiv.insertAdjacentElement('beforeend', createRekoTickImage());
  //   searchCardDiv.insertAdjacentElement('beforeend', greenLayerDiv);
  //   // insertElements(searchCardDiv, [rekoTickImg]);
  //   // set dataset attributes (for ruby backend!)
  //   searchCardDiv.dataset.title = movie.title;
  //   searchCardDiv.dataset.image_url = movie.artworkUrl;
  //   searchCardDiv.dataset.itunes_id = movie.itunesId;
  //   searchCardDiv.dataset.genre = movie.primaryGenreName;
  //   searchCardDiv.dataset.sender_name = senderName;
  //   return searchCardDiv
  // };

  // const createElWithClasses = (tagname, classnameArr) => {
  //   const el = document.createElement(tagname);
  //   classnameArr.forEach((classname) => {
  //     el.classList.add(`${classname}`);
  //   });
  //   return el
  // };

  // const createRekoTickImage = () => {
  //   const img = document.createElement('img');
  //   img.src = rekoTickImgUrl;
  //   return img
  // };

  // // const insertElements = (parent, childsArr) => {
  // //   childsArr.forEach((child) => {
  // //     parent.insertAdjacentElement('beforeend', child);
  // //   });
  // // };

  // const resizeImage = (url) => {
  //   return url.replace("100x100bb.jpg", "400x400bb.jpg");
  // };
};

export { addNewRekos };


