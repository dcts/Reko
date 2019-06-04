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
          this.update()
          if (this.el.classList.contains('no-swipe-left')) {
            this.initialSlide = 0;
          }
        }
      }

  });
  swiper.forEach((sw) => {
    if (sw.el.classList.contains('no-swipe-left')) {
      sw.removeSlide(0);
    }
  })
}

export { makeSwipe };
