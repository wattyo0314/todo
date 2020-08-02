(function($) {
  $('.bg-slider').bgSwitcher({
   images: ['画像のパス/画像1','画像のパス/画像2','画像のパス/画像3'], 
　 interval: 3000,
　 loop: true,
　 shuffle: true,
　 effect: "fade", // fade,blind,clip,slide,drop,hide
　 duration: 500,
　 easing: "swing" // linear,swing
   });
  });