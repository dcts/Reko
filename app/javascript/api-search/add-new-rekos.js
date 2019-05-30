const addNewRekos = () => {
  console.log("---TRIGGERED : addNewRekos");

  // FINAL DATA
  let senderName;
  const token = document.URL.split("token=")[1];
  let movies = [];

  let formSubmitName;
  let formAjaxSearch;
  let inputName;
  let inputKeyword;
  let cardsContainer;
  let sendRekosButton;
  let authenticityToken;
  let userSignedIn;

  // LOAD ALL DOM ELEMENTS
  formSubmitName = document.getElementById("formSubmitName");
  formAjaxSearch = document.getElementById("formAjaxSearch");
  inputName = document.getElementById("inputName");
  inputKeyword = document.getElementById("inputKeyword");
  cardsContainer = document.getElementById("search-cards-container");
  sendRekosButton = document.getElementById("sendRekosButton");
  authenticityToken = document.getElementById("auth").value;
  userSignedIn = document.getElementById("userSignedIn").value === "true";

  // SEND POST REQUESTS
  formAjaxSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    console.log("SUBMITT EVENT TRIGGERED");
    const movies = []; // save movie titles
    const cards = document.querySelectorAll(".selected");
    cards.forEach((card) => {
      sendPostRequestToCreateReko(card);
    });
    let redirectUrl;
    if (userSignedIn) {
      redirectUrl = "/rekos"
    } else {
      redirectUrl = `/thankyou?token=${token}&name=${senderName}&movies=${normalize(movies.join("_and_"))}`;
    }
    console.log("redirecting NOW");
    console.log(redirectUrl)
    window.location = redirectUrl;
  });

  // ADD EVENTLISTENERS FOR SELECTION
  const addSelectionListener = (card) => {
    card.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("selected");
      setButtonState();
    });
  };

  // ENABLE BUTTON IF ELEMENTS ARE SELECTED
  const setButtonState = () => {
    if (document.querySelectorAll(".selected").length > 0) {
      sendRekosButton.disabled = false;
    } else {
      sendRekosButton.disabled = true;
    }
  };

  // ADD EVENTLISTENER FOR AJAX CALL
  inputKeyword.addEventListener("keyup", (event)=> {
    apiCall(inputKeyword.value);
  });

  // If user is not signed in add event listener to post your name
  if (userSignedIn == false) {
    formSubmitName.addEventListener("submit", (event) => {
      event.preventDefault();
      if (inputName.value.length < 2) {
        alert("your name has to few letters!");
      } else {
        senderName = inputName.value;
        formSubmitName.classList.add("invisible");
      }
    });
  }
  // when name gets submitted
  // -> wait for transition to end
  // -> remove nameInputElement and make SearchInput visible
  "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd".split(" ").forEach((event) => {
    if (userSignedIn == false) {
      formSubmitName.addEventListener(event, () => { // webkitTransitionEnd oTransitionEnd MSTransitionEnd"
        formAjaxSearch.classList.remove("invisible");
        formAjaxSearch.classList.add("visible");
        // formAjaxSearch.classList.add("visible");
      });
    }
  })

  const sendPostRequestToCreateReko = (card) => {
    const xhr = new XMLHttpRequest();
    // listener for server response
    // whenever the request gets a response the .onload() function gets triggered
    xhr.onload = function () {
      console.log("Yay, we got an an answer from the server (request response):");
      console.log(this);
    };
    // DATA TO SEND
    senderName = userSignedIn ? "YOU" : senderName;
    const toSend = {
      authenticity_token: authenticityToken,
      reko: {
        itunes_id: card.dataset.itunes_id,
        title: card.dataset.title,
        image_url: card.dataset.image_url,
        genre: card.dataset.genre,
        sender_name: senderName,
        token: token
      }
    };
    xhr.open("POST", "/rekos");
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(JSON.stringify(toSend));
    console.log("POST request send with data: ");
    console.log(toSend);
  };

  const normalize = term => {
    return term.replace(/ /g, '+');
  };

  // ITUNES API CALL FROM JS
  const apiCall = (searchTerm) => {
    // NEEDED TO PREVENT CORS FAILURE? -> do more research on it when time...
    const proxyurl = "https://cors-anywhere.herokuapp.com/";
    const url = "https://itunes.apple.com/search?media=movie&term=" + normalize(searchTerm); //
    fetch(proxyurl + url)
    .then((response) => response.json())
    .then((data) => {
      let movies = [];
      data.results.forEach((result) => { // loop over all results
        if (result.kind === "feature-movie") {
          const movie = buildMovie(result);
          movies.push(movie);
        }
      });
      deleteCardsIfNotSelected(); // reset cards
      addCards(movies);
      addSelectionListener(document.getElementById("search-cards-container"));
    });
  };

  const buildMovie = (apiResultObject) => {
    return {
      "title": apiResultObject.trackName,
      "artworkUrl": resizeImage(apiResultObject.artworkUrl100),
      "itunesId": apiResultObject.trackId,
      "primaryGenreName": apiResultObject.primaryGenreName,
    }
  };

  const deleteCardsIfNotSelected = () => {
    const cards = document.querySelectorAll(".search-card");
    cards.forEach((card) => {
      if (card.classList.contains("selected") != true) {
        removeElement(card);
      }
    });
  };

  const removeElement = (el) => {
    el.parentNode.removeChild(el);
  };

  const addCards = (movies) => {
    movies.forEach((movie) => {
      const card = buildCard(movie);
      addSelectionListener(card);
      cardsContainer.insertAdjacentElement('beforeend', card);
    });
  };

  const deleteChildren = (element) => {
    while (element.firstChild) {
      element.removeChild(element.firstChild);
    }
  };

  const addChild = (element, movie) => {
    element.insertAdjacentHTML("beforeend", `<p>${movie.title}</p>`);
  };

  const buildCard = (movie) => {
    // create div with class "search-card"
    const searchCard = createElementCustom("div", ["search-card"]);
    // set dataset attributes (for ruby backend!)
    searchCard.dataset.title = movie.title;
    searchCard.dataset.image_url = movie.artworkUrl;
    searchCard.dataset.itunes_id = movie.itunesId;
    searchCard.dataset.genre = movie.primaryGenreName;
    searchCard.dataset.sender_name = senderName;
    // create image with src="[movie.artworkUrl]" and alt="[movie.title]"
    const img = createImageCustom(movie.artworkUrl, movie.title);
    // create h2 element with value [movie.title]
    const title = document.createElement("p");
    title.innerText = movie.title;
    // append img and h2 tag to the search-card
    insertElements(searchCard, [img, title]);
    return searchCard
  };

  const createElementCustom = (tagname, classnameArr) => {
    const el = document.createElement(tagname);
    classnameArr.forEach((classname) => {
      el.classList.add(`${classname}`);
    });
    return el
  };

  const createImageCustom = (src, altText) => {
    const img = document.createElement('img');
    img.src = src;
    img.alt = altText;
    return img
  };

  const insertElements = (parent, childsArr) => {
    childsArr.forEach((child) => {
      parent.insertAdjacentElement('beforeend', child);
    });
  };

  const resizeImage = (url) => {
    return url.replace("100x100bb.jpg", "400x400bb.jpg");
  };
};

export { addNewRekos };
