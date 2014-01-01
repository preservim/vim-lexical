# vim-lexical

> Building on Vim’s spell-check and thesaurus/dictionary completion

Though principally used as a editor for code, Vim flirts with those of us
editing documentation and prose by providing spell-check as well as completion
capabilities using both dictionary and thesaurus files.

While we can configure these settings in our `.vimrc` files, we often
need more granular control, where defaults are leveraged and configuration is
applied by file type. This plugin fills that gap.

## Installation

Install using Pathogen, Vundle, Neobundle, or your favorite Vim package manager.

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

In the last `autocmd` statement above, dictionaries and thesauruses are loaded
for the `text` file type, but spell-check disabled by default.

### Spell-check configuration

You can change the default setting for spell-check in your `.vimrc`:

```vim
let g:lexical#spell = 1
```

### Thesaurus configuration

If you don’t have one already, download a thesaurus from Project Gutenberg
[mthes10.zip](http://www.gutenberg.org/dirs/etext02/mthes10.zip). By default it
will look for it at this path:

```vim
let g:lexical#thesaurus = '~/.vim/thesaurus/mthesaur.txt'
```

Note that you can have multiple thesauri, with their paths delimited by commas.

Specifying a `'thesaurus'` argument in `lexical#init()` will override this
default.

### Dictionary configuration

On Unix-based systems (including OS X) the dictionary will default to:

```vim
let g:lexical#dictionary = '/usr/share/dict/words'
```

Note that you can have multiple dictionaries, with their paths delimited by
commas.

Specifying a `'dictionary'` argument in `lexical#init()` will override this
default.

## Commands

Vim has many default key mappings for spell-checking and completion.

### Spell-check commands

These are the Normal mode commands:

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

And for Insert mode:

* `«CTRL-X»«CTRL-S»` - find suggestion, using `«CTRL-P»` and `«CTRL-N»` to
  navigate.

### Thesaurus commands

For thesaurus lookup, Vim has an Insert mode mapping of:

* `«CTRL-X»«CTRL-T»` - for thesaurus completion, using `«CTRL-P»` and
  `«CTRL-N»` to navigate.

For convenient Normal mode thesaurus lookup from the cursor position, you can
define a key:

```vim
let g:lexical#thesaurus_key = '<leader>t'
```

No key is defined by default.

### Dictionary commands

For dictionary lookup, Vim has an Insert mode mapping of:

* `«CTRL-X»«CTRL-K»` - for dictionary completion

For convenient Normal mode dictionary lookup from the cursor position, you can
define a key:

```vim
let g:lexical#dictionary_key = '<leader>k'
```

No key is defined by default.

## See also

If you like this plugin, you might like these others from the same author:

* [vim-quotable](http://github.com/reedes/vim-quotable) - extends Vim to support typographic (‘curly’) quotes
* [vim-litecorrect](http://github.com/reedes/vim-litecorrect) - Lightweight auto-correction for Vim
* [vim-thematic](http://github.com/reedes/vim-thematic) — Conveniently manage Vim’s appearance to suit your task and environment 
* [vim-writer](http://github.com/reedes/vim-writer) - Extending Vim to better support writing prose and documentation

## Future development

If you have any ideas on improving this plugin, please post them to the github
project issue page.

