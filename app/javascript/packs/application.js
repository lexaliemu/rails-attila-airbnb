import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';

if (document.getElementById('banner-typed-text')) {
  loadDynamicBannerText();
};


import { stars } from '../components/card';

$(function() {
    $('span.stars').stars();
});
