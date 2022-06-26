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

