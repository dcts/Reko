import Siema from 'siema';

const onboardingSlider = () => {
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
  }

  const mySiema = new Siema({
    onInit: onInitCallback,
    onChange: onChangeCallback,
  });

  const prev = document.querySelector('.prev');
  const next = document.querySelector('.next');

  prev.addEventListener('click', () => mySiema.prev());
  next.addEventListener('click', () => mySiema.next());

}

export { onboardingSlider };
