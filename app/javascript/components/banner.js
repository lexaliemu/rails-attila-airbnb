import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Awesome movies for awesome people"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
