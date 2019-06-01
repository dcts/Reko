import Swiper from "swiper";

const makeSwipe = () => {
  console.log("---TRIGGERED : makeSwipe");

  // var menuButton = document.querySelector('.menu-button');
    var openMenu = function () {
      swiper.slidePrev();
    };
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 'auto',
      initialSlide: 1,
      resistanceRatio: 0,
      slideToClickedSlide: true,

      on: {
        click: function() {
          this.slideTo(1)
      }
    }
    //   on: {
    //     slideChangeTransitionStart: function () {
    //       var slider = this;
    //       if (slider.activeIndex === 0) {
    //         menuButton.classList.add('cross');
    //         // required because of slideToClickedSlide
    //         menuButton.removeEventListener('click', openMenu, true);
    //       } else {
    //         menuButton.classList.remove('cross');
    //       }
    //     }
    //     , slideChangeTransitionEnd: function () {
    //       var slider = this;
    //       if (slider.activeIndex === 1) {
    //         menuButton.addEventListener('click', openMenu, true);
    //       }
    //     },
    //   }
    //
  });
}

export { makeSwipe };
