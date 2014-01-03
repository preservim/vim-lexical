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

  for l:spelllang in get(l:args, 'spelllang', [])
    execute 'setlocal spelllang+=' . l:spelllang
  endfor

  if get(l:args, 'spell', g:lexical#spell)
    setlocal spell
    setlocal complete+=kspell
  else
    setlocal nospell
    setlocal complete-=kspell
  endif

  for l:thesaurus in get(l:args, 'thesaurus', g:lexical#thesaurus)
    execute 'setlocal thesaurus+=' . l:thesaurus
  endfor
  if len(&thesaurus) > 0
    setlocal complete+=s
  else
    setlocal complete-=s
  endif

  for l:dictionary in get(l:args, 'dictionary', g:lexical#dictionary)
    execute 'setlocal dictionary+=' . l:dictionary
  endfor
  if len(&dictionary) > 0
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
