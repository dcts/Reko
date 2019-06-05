import Siema from 'siema';

const emptyInboxSlider = () => {
  console.log("TRIGGERED : onboardingSlider");

  function onInitCallback() {
    console.log('Siema initialised bro :)');
    runInterval();
  }

  function onChangeCallback() {
    console.log(`The index of current slide is: ${this.currentSlide}`);
    const buttonLastSlide = document.querySelector('.bttn-round');
    if (this.currentSlide === 2) {
      buttonLastSlide.classList.add('pulsing');
    } else {
      buttonLastSlide.classList.remove('pulsing');
    }
  }

  const mySiema = new Siema({
    onInit: onInitCallback,
    onChange: onChangeCallback,
  });

  function runInterval() {
    // let iterations = 0;
    let iterate = () => { setTimeout(() => mySiema.next(), 3000); }
    iterate();
    setTimeout(() => iterate(), 3000);
    // const slide = document.querySelector('.onboarding-slider');
    // slide.addEventListener('click', (event) => {
    //   window.clearInterval;
    // })
    // console.log(iterations);
    // if (iterations >= 1)
    //   clearInterval(interval);

    // iterations++;
  }


  // const next = document.querySelector('.next');

  // next.addEventListener('click', () => mySiema.next());

}

export { emptyInboxSlider };
