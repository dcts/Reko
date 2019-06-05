import Swiper from "swiper";

const makeSwipe = () => {
  console.log("TRIGGERED : makeSwipe");

  // var menuButton = document.querySelector('.menu-button');
  const openMenu = function () {
    swiper.slidePrev();
  };

  const swiper = new Swiper('.swiper-container', {
    slidesPerView: 'auto',
    initialSlide: 1,
    resistanceRatio: 0,
    slideToClickedSlide: true,
    observer: true,
    on: {
        click: function() {
          if (!this.el.classList.contains('no-swipe-left')) {
            this.slideTo(1)
          }
        },
        observerUpdate: function() {
          console.log('update!!!')
          if (this.el.classList.contains('no-swipe-left')) {
            // this.initialSlide = 0;
            console.log(this.el)
            console.log(this.el.querySelector('.seen'));
            this.el.querySelector('.seen').setAttribute("style", "visibility:visible;");
            this.update();
            this.slideTo(0);
            // add class to add checkmark
          }
        }
      }
  });

  const removeSlideAbilityIfSeen = (sw) => {
    if (sw.el.classList.contains('no-swipe-left')) {
      sw.removeSlide(0);
    }
  };
  // CHECK HOW MANY SLIDERS ARE INITIALIZED
  // if only one is selected -> check
  // TODO:REFACTOR
  if (typeof(swiper.length) === 'undefined') {
    console.log("only one swiper instance:");
    console.log(swiper);
    removeSlideAbilityIfSeen(swiper);
  } else {
    console.log("multiple swipers:");
    console.log(swiper);
    swiper.forEach((sw) => {
      removeSlideAbilityIfSeen(sw);
    })
  }
}

export { makeSwipe };
