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

### Helpful Plugins

* [tpope's markdown][] plugin. Arguably unecessary but provides some fenced codeblock extras.
* [Chris Toomey's titlecase][] plugin. *Teach Vim about titlecase, with support for motions and text objects*
* [Chris Toomey's quicklink][] plugin. This is nothing short of beautiful. *A Vim plugin for quickly
  looking up a topic in google and inserting the relevant link*. [Bonus video][] with some insight on these
  two plugins from Chris.

[tpope's markdown]: https://github.com/tpope/vim-markdown
[Chris Toomey's titlecase]: https://github.com/christoomey/vim-titlecase
[Chris Toomey's quicklink]: https://github.com/christoomey/vim-quicklink
[Bonus video]: https://www.youtube.com/watch?v=lwD8G1P52Sk
