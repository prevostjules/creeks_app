import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.getElementById('banner-typed-text');
  if (banner) {
    new Typed('#banner-typed-text', {
    strings: ["booker / streamer / encaisser.."],
    typeSpeed: 50,
    loop: true
  });
  };

}

export { loadDynamicBannerText };
