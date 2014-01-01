" ============================================================================
" File:        autoload/lexical.vim
" Description: autoload script for vim-lexical plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: January 1, 2014
" License:     The MIT License (MIT)
" ============================================================================

if exists("autoloaded_lexical") | finish | endif
let autoloaded_lexical = 1

function! lexical#init(...)
  let l:args = a:0 ? a:1 : {}

  let l:spelllang = get(l:args, 'spelllang', '')
  if len(l:spelllang) > 0
    execute 'setlocal spelllang+=' . l:spelllang
  endif

  if get(l:args, 'spell', g:lexical#spell)
    setlocal spell
    setlocal complete+=kspell
  else
    setlocal nospell
    setlocal complete-=kspell
  endif

  let l:thesaurus = get(l:args, 'thesaurus', g:lexical#thesaurus)
  execute 'setlocal thesaurus+=' . l:thesaurus
  if len(l:thesaurus) > 0
    setlocal complete+=s
  else
    setlocal complete-=s
  endif

  let l:dictionary = get(l:args, 'dictionary', g:lexical#dictionary)
  execute 'setlocal dictionary+=' . l:dictionary
  if len(l:dictionary) > 0
    setlocal complete+=k
  else
    setlocal complete-=k
  endif

  if len(g:lexical#thesaurus_key) > 0
    execute 'nnoremap <buffer> ' . g:lexical#thesaurus_key . ' a<C-X><C-S>'
  endif

  if len(g:lexical#dictionary_key) > 0
    execute 'nnoremap <buffer> ' . g:lexical#dictionary_key . ' ea<C-X><C-T>'
  endif

endfunction

" vim:ts=2:sw=2:sts=2
