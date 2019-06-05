import Siema from 'siema';

const emptyInboxSlider = () => {
  console.log("TRIGGERED : onboardingSlider");


  // const mysiema = new Siema({
  //   selector: '.siema',
  //   duration: 200,
  //   easing: 'ease-out',
  //   perPage: 1,
  //   startIndex: 0,
  //   draggable: true,
  //   multipleDrag: true,
  //   threshold: 20,
  //   loop: false,
  //   rtl: false,
  //   onInit: () => {},
  //   onChange: () => {},
  // });

  function onInitCallback() {
    console.log('Siema initialised bro :)');
  }

  function onChangeCallback() {
    console.log(`The index of current slide is: ${this.currentSlide}`);
    const buttonLastSlide = document.querySelector('.bttn-round');
    if (this.currentSlide === 2) {
      buttonLastSlide.classList.add('plus-button-last-slide');
    } else {
      buttonLastSlide.classList.remove('plus-button-last-slide');
    }
  }

  const mySiema = new Siema({
    onInit: onInitCallback,
    onChange: onChangeCallback
  });

  // const next = document.querySelector('.next');

  // next.addEventListener('click', () => mySiema.next());

}

export { emptyInboxSlider };
