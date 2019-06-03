const addNewRekos = () => {
  console.log("TRIGGERED : addNewRekos");
  // -----------------------
  // LOAD DATA + DOM OBJECTS
  // -----------------------
  // controll post requests
  let count = 0;
  let target;
  // selected itunes_id's selected
  let selectedItunesIds = [];
  // load img tick
  const rekoTickImgUrl = document.getElementById("rekoTickImgUrl").value;
  const userSignedIn = document.getElementById("userSignedIn").value === "true";
  const authenticityToken = document.querySelector('[name="csrf-token"]').content;
  // get params (from url)
  let senderName = document.getElementById('params_senderName').value;;
  const token = document.getElementById('params_token').value;
  const searchTerm = document.getElementById("params_searchTerm").value;
  // get DOM elements
  const formAjaxSearch = document.getElementById("formAjaxSearch");
  const inputKeyword = document.getElementById("inputKeyword");
  const cardsContainer = document.getElementById("search-cards-container");
  const sendRekosButton = document.getElementById("sendRekosButton");

  // ----------------------------
  // LISTENERS + HELPER FUNCTIONS
  // ----------------------------
  // ADD EVENTLISTENER FOR AJAX CALL
  inputKeyword.addEventListener("keyup", (event)=> {
    apiCall(inputKeyword.value);
  });

  sendRekosButton.addEventListener('click', () => {
    const cards = document.querySelectorAll(".selected");
    target = cards.length;
    cards.forEach((card) => {
      sendPostRequestToCreateReko(card);
    });
  });
  const myFunction = (event) => {
    const card = event.currentTarget;
    card.classList.toggle("selected");
    setButtonState();
  };
  const getAllCards = () => {
    const result = document.querySelectorAll(".search-card");
    return result;
  };
  const addCardEventListeners = () => {
    getAllCards().forEach((card) => {
      card.addEventListener("click", myFunction);
    });
  };
  const removeCardEventListeners = () => {
    getAllCards().forEach((card) => {
      card.removeEventListener("click", myFunction);
    });
  };

  // ENABLE BUTTON IF ELEMENTS ARE SELECTED
  const setButtonState = () => {
    if (document.querySelectorAll(".selected").length > 0) {
      sendRekosButton.classList.remove("invisible");
      sendRekosButton.classList.add("visible");
    } else {
      sendRekosButton.classList.remove("visible");
      sendRekosButton.classList.add("invisible");
    }
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
      // rdelete all event listeners from selected cards
      addCards(movies);
      removeCardEventListeners();
      addCardEventListeners();
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
    selectedItunesIds = [];
    const cards = document.querySelectorAll(".search-card");
    cards.forEach((card) => {
      if (card.classList.contains("selected") != true) {
        removeElement(card);
      } else {
        selectedItunesIds.push(card.dataset.itunes_id);
      }
    });
  };

  const removeElement = (el) => {
    el.parentNode.removeChild(el);
  };

  const addCards = (movies) => {
    movies.forEach((movie) => {
      const card = buildCard(movie);
      if (selectedItunesIds.includes(card.dataset.itunes_id) == false) {
        cardsContainer.insertAdjacentElement('beforeend', card);
      }
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
    // create div with class "search-card" // <div class="search-card">
    const searchCardDiv = createElWithClasses("div", ["search-card"]);
    // create div with class "green-layer" // <div class="green-layer">
    const greenLayerDiv = createElWithClasses("div", ["green-layer"]);
    // add background image url
    searchCardDiv.style.background = `url("${movie.artworkUrl}")`;
    searchCardDiv.style.backgroundSize = "cover";
    // add reko tick image to card
    greenLayerDiv.insertAdjacentElement('beforeend', createRekoTickImage());
    searchCardDiv.insertAdjacentElement('beforeend', greenLayerDiv);
    // set dataset attributes (for ruby backend!)
    searchCardDiv.dataset.title = movie.title;
    searchCardDiv.dataset.image_url = movie.artworkUrl;
    searchCardDiv.dataset.itunes_id = movie.itunesId;
    searchCardDiv.dataset.genre = movie.primaryGenreName;
    searchCardDiv.dataset.sender_name = senderName;
    return searchCardDiv
  };

  const createElWithClasses = (tagname, classnameArr) => {
    const el = document.createElement(tagname);
    classnameArr.forEach((classname) => {
      el.classList.add(`${classname}`);
    });
    return el
  };

  const createRekoTickImage = () => {
    const img = document.createElement('img');
    img.src = rekoTickImgUrl;
    return img
  };

  const normalize = term => {
    return term.replace(/ /g, '+');
  };

  const resizeImage = (url) => {
    return url.replace("100x100bb.jpg", "400x400bb.jpg");
  };

  formAjaxSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    const movies = []; // save movie titles
    const cards = document.querySelectorAll(".selected");
    target = cards.length;
    cards.forEach((card) => {
      sendPostRequestToCreateReko(card);
    });
  });

  // GET REDIRECTION URL
  const buildRedirectionUrl = () => {
    let redirectionUrl;
    if (userSignedIn) {
      redirectionUrl = "/rekos";
    } else {
      redirectionUrl = `/thankyou?token=${token}&name=${senderName}`; // &movies=${normalize(movies.join("_and_"))}
    }
    return redirectionUrl
  };

  const sendPostRequestToCreateReko = (card) => {
    const xhr = new XMLHttpRequest();
    // listener for server response
    // whenever the request gets a response the .onload() function gets triggered
    xhr.onload = function () {
      count += 1;
      if (count == target) {
        // console.log("REDIRECTING TO:");
        // console.log(buildRedirectionUrl());
        // console.log(userSignedIn);
        window.location = buildRedirectionUrl();
      }
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
  };

  // -----------
  // MAIN SCRIPT
  // -----------
  inputKeyword.value = searchTerm;
  apiCall(inputKeyword.value);
};

export { addNewRekos };


