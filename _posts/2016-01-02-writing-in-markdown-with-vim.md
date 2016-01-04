---
title: Writing in Markdown With Vim
author: Joel
layout: post
permalink: /2016/01/02/writing-in-markdown-with-vim.html
---

While writing [a post yesterday][] I noticed there were some gaps in my vim setup for when I'm
authoring a markdown file so here are a few tips for polishing up your markdown experience in vim,
specifically for jekyll blogs.

[a post yesterday]: http://www.joeloliveira.com/2016/01/01/adios-2015-you-were-alright.html

### Front Matter

Starting at the top, literally, with the front matter. It was looking a bit weird out of the box:

![jekyll front matter better](https://www.evernote.com/l/AUqBTP-soRdBka6Ux6dYTlrPxiiMTso_GXkB/image.png)

It's rather inconsequential data compared to the meat of the document, the actual content. I found a
[helpful blog post][] with some details that worked for me. The heart of which is to parse between the
`---`s and consider this content a comment.

```vim
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
```

After, it looks a little less odd.

![jekyll front matter after](https://www.evernote.com/l/AUp8HJ6J_C9PibrDKDp7iEKyB16O5W_FAmkB/image.png)

[helpful blog post]: http://www.codeography.com/2010/02/20/making-vim-play-nice-with-jekylls-yaml-front-matter.html

### Textwidth

I prefer a little more space when I'm writing so I change the width before text wraps to something
slightly more than my default 80 character width - like 100 characters. In my autocommand group I
place something like:

```vim
au FileType markdown setlocal textwidth=100
```

### Fenced-in Languages

If you have many, or maybe super-specific, languages and syntaxes you commonly use in your markdown
you can specify them in your vimrc to be interpreted as such.

```vim
let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff']
```

### Snippets

I use [snipmate][] but I guess the same can be applied with something like [UltiSnips][]? Probably. In any
case, snippets are a lifesaver for the occasional piece of code or markup you can either never
remember the exact syntax for, or are slightly awkward to type. For me it's more often the former.

`~/.vim/snippets/markdown.snippets`

```
snippet a
	[${1:text}](${2:http://})
snippet img
	![${1:alt}](${2:http://})
snippet front
	---
	title: ${1:Title}
	author: Joel
	layout: post
	permalink: `strftime("/%Y/%m/%d")`/${2:slug}.html
	---
```

The first two are for links and image tags, respectively. I consistently confuse the two so why
leave it to guessing? The `front` snippet is handy in that date for the permalink is automatically
populated when the snippet is expanded.

[snipmate]: https://github.com/msanders/snipmate.vim
[UltiSnips]: https://github.com/SirVer/ultisnips

### Preview Your Markdown

A [tweet from Ches][] asking about previewing documents piqued my curiosity so I decided to look into it
a little further. His suggestion to try the QuickLook plugin was met with failure, as he mentioned,
as there's some weirdness when you try to launch from terminal. From finder it seems to work just
fine but that defeats the purpose of being vim-driven, right? The next best thing would be to
leverage a native mac app to get a look at what our rendered markdown files look like. The app I
prefer is called [MacDown][] and has plenty of good features if you ever feel like dropping into a gui
app instead of vim.

MacDown comes with a cli command you can use to open documents from the terminal but I've found that
it doesn't retain your preferences and switches to the defaults once you use it. Using OS X's `open`
command, however, does retain your preferences. So, about getting vim to play nice with this? Not so
hard:

```vim
map <leader>pre :w<cr>:silent! !open -a MacDown % > /dev/null &<cr>:redraw!<cr>
```

So `<leader>pre` will now open up MacDown with the current document so I can get a good look. Not
bad!

The changes to MacDown's preferences I've found useful:

* *General > Put editor on the right*. I don't care much about the editor, so it gets shoved right.
* *Rendering > Detect Jekyll front-matter*. For those of us jekyll users.

[tweet from Ches]: https://twitter.com/ches/status/683999093597716480
[MacDown]: http://macdown.uranusjr.com/

### Helpful Plugins

* [goyo.vim][] plugin. A really nice distraction free writing plugin suggested by [Thomas][].
* [tpope's markdown][] plugin. Arguably unecessary but provides some fenced codeblock extras.
* [Chris Toomey's titlecase][] plugin. *Teach Vim about titlecase, with support for motions and text objects*
* [Chris Toomey's quicklink][] plugin. This is nothing short of beautiful. *A Vim plugin for quickly
  looking up a topic in google and inserting the relevant link*. [Bonus video][] with some insight on these
  two plugins from Chris.

[Thomas]: https://twitter.com/thegreatape
[goyo.vim]: https://github.com/junegunn/goyo.vim
[tpope's markdown]: https://github.com/tpope/vim-markdown
[Chris Toomey's titlecase]: https://github.com/christoomey/vim-titlecase
[Chris Toomey's quicklink]: https://github.com/christoomey/vim-quicklink
[Bonus video]: https://www.youtube.com/watch?v=lwD8G1P52Sk
