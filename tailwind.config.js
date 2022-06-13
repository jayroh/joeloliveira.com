module.exports = {
  content: [
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.md',
    './*.html',
  ],
  theme: {
    extend: {
      colors: {
        'light-blue-500': '#049CDB',
      },
      fontFamily: {
        'vollkorn': [
          'Vollkorn',
          'Georgia',
          'Times',
          '"Times New Roman"',
          'serif'
        ]
      }
    },
  },
  plugins: []
}

