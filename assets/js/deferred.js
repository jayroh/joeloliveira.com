/* global lazySizes */
import 'lazysizes'
window.lazySizesConfig = window.lazySizesConfig || {}
window.lazySizesConfig.init = false
lazySizes.init()

import('./panel_toggle.js').then(({ PanelToggle }) => {
  new PanelToggle('panel-toggle').init()
})
