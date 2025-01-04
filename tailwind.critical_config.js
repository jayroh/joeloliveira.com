module.exports = {
  content: [
    './_layouts/archive.html',
    './_layouts/default.html',
    './_posts/*.md'
  ],
  safelist: [
    'footnotes'
  ],
  theme: {
    extend: {
      colors: {
        'light-blue-500': '#049CDB'
      },
      fontFamily: {
        sans: [
          '"Roboto-Condensed"',
          '"Gotham"',
          '"Helvetica Neue"',
          'Helvetica',
          'Arial sans-serif'
        ],
        mono: [
          '"Inconsolata"',
          '"Monoco"',
          '"Courier New"',
          'monospace'
        ]
      }
    }
  },
  plugins: []
}
