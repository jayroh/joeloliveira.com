module.exports = {
  content: [
    './_layouts/default.html',
    './_posts/*.md',
  ],
  theme: {
    extend: {
      colors: {
        'light-blue-500': '#049CDB',
      },
      fontFamily: {
        'sans': [
          '"Roboto-Condensed"',
          '"Gotham"',
          '"Helvetica Neue"',
          'Helvetica',
          'Arial sans-serif'
        ],
        'mono': [
          '"Inconsolata"',
          '"Monoco"',
          '"Courier New"',
          'monospace'
        ]
      }
    },
  },
  plugins: []
}

