import Siema from 'siema';

const emptyInboxSlider = () => {
  console.log("TRIGGERED : onboardingSlider");

  function onInitCallback() {
    console.log('Siema initialised bro :)');
    // runInterval();
  }

  function onChangeCallback() {
    console.log(`The index of current slide is: ${this.currentSlide}`);
    const buttonLastSlide = document.querySelector('.bttn-round');
    const linkSecondSlide = document.querySelector('.link-empty-inbox');
    if (this.currentSlide === 2) {
      buttonLastSlide.classList.add('pulsing');
    } else {
      buttonLastSlide.classList.remove('pulsing');
    }

    if (this.currentSlide === 1) {
      linkSecondSlide.classList.add('pulsing');
    } else {
      linkSecondSlide.classList.remove('pulsing');
    }

    // PLEASE DON'T REFACTOR THIS CODE INTO ITS OWN METHOD
    // IT WON'T WORK WITH this.currentSlide

    const dotFirstSlide = document.querySelector('.circle-1');
    const dotSecondSlide = document.querySelector('.circle-2');
    const dotThirdSlide = document.querySelector('.circle-3');
    if (this.currentSlide === 0) {
      dotFirstSlide.classList.add('dot-gray');
      dotSecondSlide.classList.remove('dot-gray');
      dotThirdSlide.classList.remove('dot-gray');
    } else if (this.currentSlide === 1) {
      dotFirstSlide.classList.remove('dot-gray');
      dotSecondSlide.classList.add('dot-gray');
      dotThirdSlide.classList.remove('dot-gray');
    } else if (this.currentSlide === 2) {
      dotFirstSlide.classList.remove('dot-gray');
      dotSecondSlide.classList.remove('dot-gray');
      dotThirdSlide.classList.add('dot-gray');
    }
  }


  const mySiema = new Siema({
    onInit: onInitCallback,
    onChange: onChangeCallback,
  });

  // function runInterval() {
  //   // let iterations = 0;
  //   let iterate = () => { setTimeout(() => mySiema.next(), 3000); }
  //   iterate();
  //   setTimeout(() => iterate(), 3000);
  //   // const slide = document.querySelector('.onboarding-slider');
  //   // slide.addEventListener('click', (event) => {
  //   //   window.clearInterval;
  //   // })
  //   // console.log(iterations);
  //   // if (iterations >= 1)
  //   //   clearInterval(interval);

  //   // iterations++;
  // }


  // const next = document.querySelector('.next');

  // next.addEventListener('click', () => mySiema.next());

}

export { emptyInboxSlider };
