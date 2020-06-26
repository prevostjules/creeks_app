import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.getElementById('banner-typed-text');
  if (banner) {
    new Typed('#banner-typed-text', {
    strings: ["Tous les lives de vos influenceurs préférés"],
    typeSpeed: 50,
    loop: true
  });
  };

}

export { loadDynamicBannerText };
