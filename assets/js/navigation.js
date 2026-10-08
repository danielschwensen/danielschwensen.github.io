(function () {
  'use strict';

  var button = document.getElementById('nav-trigger');
  if (!button) return;

  var navigation = button.closest('.site-nav');
  var desktop = window.matchMedia('(min-width: 600px)');

  function setOpen(open) {
    navigation.classList.toggle('is-open', open);
    button.setAttribute('aria-expanded', String(open));
  }

  button.addEventListener('click', function () {
    setOpen(!navigation.classList.contains('is-open'));
  });

  navigation.addEventListener('keydown', function (event) {
    if (event.key === 'Escape' && !desktop.matches && navigation.classList.contains('is-open')) {
      setOpen(false);
      button.focus();
      event.preventDefault();
    }
  });

  // Reset mobile state when switching between mobile and desktop layouts.
  desktop.addEventListener('change', function () {
    setOpen(false);
  });

  button.hidden = false;
  navigation.classList.add('is-enhanced');
})();
