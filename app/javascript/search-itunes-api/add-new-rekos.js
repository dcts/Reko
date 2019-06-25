const addNewRekos = () => {
  console.log("TRIGGERED : addNewRekos");

  // -----------------------
  // LOAD DATA + DOM OBJECTS
  // -----------------------
  // controll post requests
  let count = 0;
  let target;
  // selected itunes_id's
  let selectedItunesIds = []; // UPDATE: now they are TMDb Id's
  // load assets
  const rekoTickImgUrl = document.getElementById("rekoTickImgUrl").value;
  const authenticityToken = document.querySelector('[name="csrf-token"]').content;
  const base = document.getElementById('base').value;
  const classifier = document.getElementById('classifier').value;
  // get params (from url)
  let senderName = document.getElementById('params_senderName').value;;
  const token = document.getElementById('params_token').value;
  const ownerToken = document.getElementById('params_ownerToken').value;
  const redirectHome = document.getElementById("params_redirectHome").value === "true";
  // get DOM elements
  const formAjaxSearch = document.getElementById("formAjaxSearch");
  const inputKeyword = document.getElementById("inputKeyword");
  const cardsContainer = document.getElementById("search-cards-container");
  const sendRekosButton = document.getElementById("sendRekosButton");
  const instructionsContainer = document.getElementById("instructionsContainer");
  const instructionsParagraph = document.getElementById("instructionsParagraph");
  const instructionsBackBttn = document.getElementById("instructionsBackBttn");
  // ----------------------------
  // LISTENERS + HELPER FUNCTIONS
  // ----------------------------
  // ADD EVENTLISTENER FOR AJAX CALL
  inputKeyword.addEventListener("keyup", (event)=> {
    deleteCardsIfNotSelected(); // reset cards
    if (inputKeyword.value.length >= 3) { // min characters to trigger API call = 3
      apiCall(inputKeyword.value);
    } else {
      setInstructionsState();
    }
  });
  formAjaxSearch.addEventListener("submit", (event) => {
    event.preventDefault();
    // const cards = document.querySelectorAll(".selected");
    // target = cards.length;
    // cards.forEach((card) => {
    //   sendPostRequestToCreateReko(card);
    // });
  });
  sendRekosButton.addEventListener('click', () => {
    const cards = document.querySelectorAll(".selected");
    target = cards.length;
    cards.forEach((card) => {
      sendPostRequestToCreateReko(card);
    });
  });
  const toggleCard = (event) => {
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
      card.addEventListener("click", toggleCard);
    });
  };
  const removeCardEventListeners = () => {
    getAllCards().forEach((card) => {
      card.removeEventListener("click", toggleCard);
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
  // ENABLE BUTTON IF ELEMENTS ARE SELECTED
  const setInstructionsState = () => {
    console.log("inside instructions state func...");
    if (document.querySelectorAll(".search-card").length > 0) {
      console.log("at least one card present!");
      instructionsParagraph.style.visibility = "hidden";
      instructionsBackBttn.style.visibility = "hidden";
      // instructionsContainer.style.height = "0px";z.style.visibility = "collapse";
      // instructionsContainer.style.height = "0px";
    } else {
      console.log("no cards present!");
      instructionsParagraph.style.visibility = "visible";
      instructionsBackBttn.style.visibility = "visible";
      // instructionsContainer.style.visibility = "visible";
      // instructionsContainer.style.height = "300px";
    }
  };

  // TMDb API CALL FROM JS
  const apiCall = (searchTerm) => {
    const query = searchTerm;
    const url = `${base}${classifier}&query=${query}`;
    console.log(url);
    fetch(url)
    .then((response) => response.json())
    .then((data) => {
      let results = data.results;
      const movies = []; // contains movies, series and documentaries!
      results.forEach((result) => {
        if (validResult(result)) {
          if (result.media_type === "movie" && typeof result.title !== 'undefined') {
            const movie = buildMovie(result);
            movies.push(movie);
          } else if (result.media_type === "tv" && typeof result.name !== 'undefined') {
            const movie = buildSeries(result);
            movies.push(movie);
          }
        }
      });
      addCards(movies);
      removeCardEventListeners();
      addCardEventListeners();
      setInstructionsState();
    });
  };

  const buildMovie = (result) => {
    return {
      "title": result.title,
      "artworkUrl": buildImageUrl(result.poster_path),
      "itunesId": result.id,
      "primaryGenreName": `Movie${contentType(result.genre_ids[0])}`,
    }
  };
  const buildSeries = (result) => {
    return {
      "title": result.name,
      "artworkUrl": buildImageUrl(result.poster_path),
      "itunesId": result.id,
      "primaryGenreName": `Series${contentType(result.genre_ids[0])}`,
    }
  };

  // returns type of the movie or series (documentary or normal)
  // genre ID taken from TMDb
  const contentType = (genreId) => {
    return (genreId === 99 ? " (doc)" : "");
  };
  // validate result
  const validResult = (result) => {
    // id needs to exist
    if (typeof result.id === 'undefined') {
      return false;
    // genre_ids needs to exist
    } else if (typeof result.genre_ids === 'undefined') {
      return false;
    // poster_path cant be null or undefined
    } else if (typeof(result.poster_path) === 'undefined' || result.poster_path == null) {
      return false;
    }
    // all validations passed!
    return true;
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

  // JS DOM HELPER METHODS
  const removeElement = (el) => {
    el.parentNode.removeChild(el);
  };

  const deleteChildren = (element) => {
    while (element.firstChild) {
      element.removeChild(element.firstChild);
    }
  };

  const addChild = (element, movie) => {
    element.insertAdjacentHTML("beforeend", `<p>${movie.title}</p>`);
  };

  const createElWithClasses = (tagname, classnameArr) => {
    const el = document.createElement(tagname);
    classnameArr.forEach((classname) => {
      el.classList.add(`${classname}`);
    });
    return el
  };

  const addCards = (movies) => {
    movies.forEach((movie) => {
      const card = buildCard(movie);
      if (selectedItunesIds.includes(card.dataset.itunes_id) == false) {
        cardsContainer.insertAdjacentElement('beforeend', card);
      }
    });
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

  const createRekoTickImage = () => {
    const img = document.createElement('img');
    img.src = rekoTickImgUrl;
    return img
  };

  const normalize = term => {
    return term.replace(/ /g, '+');
  };

  // BUILD URLS
  const buildImageUrl = (posterPath) => {
    return `https://image.tmdb.org/t/p/w200${posterPath}`;
  };

  // GET REDIRECTION URL
  const buildRedirectionUrl = () => {
    return redirectHome ? `/rekos?owner_token=${ownerToken}` : `/thankyou?token=${token}&name=${senderName}`
  };

  const sendPostRequestToCreateReko = (card) => {
    const xhr = new XMLHttpRequest();
    // .onload() function gets triggered when server response arrives
    xhr.onload = function () {
      count += 1;
      if (count == target) {
        window.location = buildRedirectionUrl();
      }
    };
    // DATA TO SEND
    senderName = redirectHome ? "YOU" : senderName;
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
};

export { addNewRekos };


