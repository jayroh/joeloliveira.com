module.exports = {
  content: [
    './_includes/sidebar.html',
    './_layouts/post.html'
  ],
  theme: {
    extend: {
      maxWidth: {
        24: '6rem'
      },
      fontFamily: {
        sans: [
          '"Roboto-Condensed"',
          '"Gotham"',
          '"Helvetica Neue"',
          'Helvetica',
          'Arial sans-serif'
        ]
      }
    }
  },
  plugins: []
}
