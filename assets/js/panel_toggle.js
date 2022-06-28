class PanelToggle {
  constructor(id) {
    this.id = id;
  }

  init() {
    document.getElementById(this.id).addEventListener('change', () => {
      const images = Array.prototype.slice.call(document.querySelectorAll('.lazyload-sidebar'));
      images.forEach((image) => {
        image.removeAttribute('src');
        image.src = image.dataset.src;
        delete image.dataset.src;
      })
    }, { once: true });
  }
}

export default PanelToggle;
