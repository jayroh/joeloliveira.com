---
title: Correctly Syntax Highlight Your Shell Scripts
author: Joel
layout: post
permalink: /2016/01/05/make-vim-recognize-your-shell-scripts.html
alias: [/2016/01/05/make-vim-recognize-your-shell-scripts, /2016/01/05/correctly-syntax-highlight-your-shell-scripts]
---

Not all shell scripts are created equal. You may have a `do-something.sh` script, or maybe you call
it `do-something`? Maybe it uses the bourne shell? Maybe bash? Maybe zsh? I don't know. We all have
opinions.

You're probably using vim to edit that thing though, right? If you're reading this, you probably do.
Isn't it bothersome when you're editing that file and want it highlighted with the correct syntax?
That's easy enough, if you use the `.sh` extension.

```vim
au BufRead,BufNewFile *.sh set ft=sh
```

It's less easy if you mix and match shells or don't use the file extension. I sometimes don't. In
those cases I check for what's going on in the she-bang.

```vim
au BufRead,BufNewFile,BufWrite *
      \ if getline(1) =~ "#!/bin/bash" |
      \   set ft=sh |
      \ endif

au BufRead,BufNewFile,BufWrite *
      \ if getline(1) =~ "#!/bin/zsh" |
      \   set ft=zsh |
      \ endif
```

Maybe that's overkill. Have a better solution? I bet you do :). [Let me know][]!

[Let me know]: https://twitter.com/jayroh
