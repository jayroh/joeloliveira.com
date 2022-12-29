/* global lazySizes */
window.lazySizesConfig = window.lazySizesConfig || {}
window.lazySizesConfig.init = false
import 'lazysizes'
lazySizes.init()

import('./panel_toggle.js').then(({ PanelToggle }) => {
  new PanelToggle('panel-toggle').init()
})
