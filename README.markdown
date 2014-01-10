# vim-lexical

> Building on Vim’s spell-check and thesaurus/dictionary completion

Though principally used as a editor for code, Vim flirts with those of us
editing documentation and prose by providing spell-check as well as
completion capabilities using both dictionary and thesaurus files.

While we can configure these settings in our `.vimrc` files, we often need
more granular control, where defaults are leveraged and configuration is
applied by file type. This plugin fills that gap.

## Installation

Best Installed using Pathogen, Vundle, Neobundle, or your favorite Vim
package manager.

## Configuration

Because spell-check, thesaurus, etc. isn’t needed for all file types, it can be
configured per file type through your `.vimrc`:

```vim
augroup lexical
  autocmd!
  autocmd FileType markdown call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
```

In the last `autocmd` statement above, dictionaries and thesauruses are
configured for the `text` file type, but spell-check is disabled by
default.

### Spell-check configuration

You can change the default setting for spell-check in your `.vimrc`:

```vim
let g:lexical#spell = 1         " 0=disabled, 1=enabled
```

This only affects buffers initialized with `lexical#init()`.

### Thesaurus configuration

If you don’t have one already, download a thesaurus from Project
Gutenberg:
[mthes10.zip](http://www.gutenberg.org/dirs/etext02/mthes10.zip). By
default _lexical_ will look for it at the following path:

```vim
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
```

Note that you can specify multiple thesauruses in the list.

You can override the default during initialization:

```vim
augroup lexical
  autocmd!
  autocmd FileType textile call lexical#init({'thesaurus': ['~/thes/thes.de.txt',]})
  ...
augroup END
```

### Dictionary configuration

On Unix-based systems (including OS X) the dictionary will default to:

```vim
let g:lexical#dictionary = ['/usr/share/dict/words',]
```

Note that you can specify multiple dictionaries in the list.

You can override this default during initialization. See thesaurus example
above.

## Commands

Vim has many default key mappings for spell-checking and completion.

### Spell-check commands

These are the _Normal_ mode commands:

* `]s`			- Move to next misspelled word after the cursor.
* `[s`			- Like `]s` but search backwards
* `]S`			- Like `]s` but only stop at bad words, not at rare words or words
  for another region.
* `[S`			- Like `]S` but search backwards.

With the following key mappings you can use Visual mode selection to select the
characters (including whitespace). Otherwise the word under the cursor is used.

* `zg`			- Mark as a good word
* `zw`			- Like `zg` but mark the word as a wrong (bad) word.
* `zug`     - Unmark as good word
* `zuw`     - Unmark as wrong (bad) word 

* `z=`			- For the word under/after the cursor suggest correctly spelled words
* `1z=`			- Use the first suggestion, without prompting
* `.`       - Redo - repeat last word replacement

* `:spellr` - Repeat the replacement done by `z=` for all matches with the
  replaced word in the current window

For spelling suggestions while in _Insert_ mode:

* `«CTRL-X» «CTRL-S»` - suggest spelling, using `«CTRL-P»` and `«CTRL-N»` to navigate.

### Thesaurus commands

For thesaurus lookup while in _Insert_ mode:

* `«CTRL-X» «CTRL-T»` - thesaurus lookup, using `«CTRL-P»` and `«CTRL-N»` to navigate.

For convenient _Normal_ mode thesaurus lookup from the cursor position,
you can define a key in your `.vimrc`:

```vim
let g:lexical#thesaurus_key = '<leader>t'
```

No key is defined or mapped by default.

### Dictionary commands

For dictionary completion while in _Insert_ mode:

* `«CTRL-X» «CTRL-K»` - dictionary completion, using `«CTRL-P»` and `«CTRL-N»` to navigate.

For convenient _Normal_ mode dictionary lookup from the cursor position,
you can define a key in your `.vimrc`:

```vim
let g:lexical#dictionary_key = '<leader>k'
```

No key is defined or mapped by default.

## See also

If you like this plugin, you might like these others from the same author:

* [vim-quotable](http://github.com/reedes/vim-quotable) - extends Vim to support typographic (‘curly’) quotes
* [vim-pencil](http://github.com/reedes/vim-pencil) - Rethinking Vim as a tool for writers
* [vim-thematic](http://github.com/reedes/vim-thematic) — Conveniently manage Vim’s appearance to suit your task and environment 
* [vim-litecorrect](http://github.com/reedes/vim-litecorrect) - Lightweight auto-correction for Vim
* [vim-colors-pencil](http://github.com/reedes/vim-colors-pencil) — A color scheme for Vim inspired by IA Writer

## Future development

If you’ve spotted a problem or have an idea on improving this plugin,
please post it to the github project issue page.

<!-- vim: set tw=74 :-->
