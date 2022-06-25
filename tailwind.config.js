module.exports = {
  content: [
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.md',
    './*.html',
  ],
  theme: {
    extend: {
      maxWidth: {
        '24': '6rem',
      },
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

