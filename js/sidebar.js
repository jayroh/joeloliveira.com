document.getElementById('panel-toggle').addEventListener(
  'change',
  (event) => {
    const images = Array.prototype.slice.call(document.querySelectorAll('.lazyload-sidebar'));
    images.forEach((image) => {
      image.removeAttribute('src');
      image.src = image.dataset.src;
      delete image.dataset.src;
    })
  },
  { once: true }
);
