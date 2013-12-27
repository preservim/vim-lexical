" =============================================================================
" File:        plugin/lexical.vim
" Description: Dictionary support for the Vim text editor
" Maintainer:  Reed Esau <github.com/reedes>
" =============================================================================
"
if exists('g:loaded_lexical') || &cp | finish | endif
let g:loaded_lexical = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

"  if a:mode
"    " soft(1) or hard(2)
"    setlocal complete+=k        " scan dictionary
"    setlocal complete+=kspell   " use spell
"    setlocal complete+=s        " scan thesaurus
"    setlocal display+=lastline
"    setlocal nolist             " TODO make configurable
"    setlocal spell              " TODO make configurable
"    setlocal virtualedit=block
"    setlocal formatoptions+=1   " don't break line before 1 letter word
"    setlocal formatoptions+=t
"    " TODO make these configurable
"    nnoremap <buffer> <leader>s a<C-X><C-S>
"    nnoremap <buffer> <leader>h ea<C-X><C-T>
"  else
"    " off(0)
"    setlocal nospell
"    silent! nunmap <buffer> <leader>s
"    silent! nunmap <buffer> <leader>h
"  endif

"  " TODO support lists of files
"  if g:writable#dictionary != ''
"    let filepath = expand(g:writable#dictionary)
"    if filereadable(filepath)
"      execute 'setlocal dictionary+=' . filepath
"    endif
"  endif
"  if g:writable#thesaurus != ''
"    let filepath = expand(g:writable#thesaurus)
"    if filereadable(filepath)
"      execute 'setlocal thesaurus+=' . filepath
"    endif
"  endif

if !exists('g:lexical#dictionary')
  let filepath = '/usr/share/dict/words'
  if filereadable(expand(filepath))
    let g:lexical#dictionary = filepath
  else
    let g:lexical#dictionary = ''
  endif
endif

if !exists('g:lexical#thesaurus')
  let filepath = '~/.vim/thesaurus/mthesaur.txt'
  if filereadable(expand(filepath))
    let g:lexical#thesaurus = filepath
  else
    let g:lexical#thesaurus = ''
  endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2
