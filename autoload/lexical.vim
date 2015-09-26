" ============================================================================
" File:        autoload/lexical.vim
" Description: autoload script for vim-lexical plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: January 1, 2014
" License:     The MIT License (MIT)
" ============================================================================

if exists("autoloaded_lexical") | finish | endif
let autoloaded_lexical = 1

function! lexical#init(...) abort
  let l:args = a:0 ? a:1 : {}

  if &buftype ==# ''
    if get(l:args, 'spell', g:lexical#spell)
      setlocal spell
      setlocal complete+=kspell
    else
      setlocal nospell
      setlocal complete-=kspell
    endif
  endif

  let l:spelllang_list = get(l:args, 'spelllang', g:lexical#spelllang)
  execute 'setlocal spelllang=' . join(l:spelllang_list, ',')

  let l:spellfile_list = get(l:args, 'spellfile', g:lexical#spellfile)
  execute 'setlocal spellfile=' . join(l:spellfile_list, ',')

  let l:thesaurus_list = get(l:args, 'thesaurus', g:lexical#thesaurus)
  execute 'setlocal thesaurus=' . join(l:thesaurus_list, ',')
  if len(&thesaurus) > 0
    setlocal complete+=s
  else
    setlocal complete-=s
  endif

  let l:dictionary_list = get(l:args, 'dictionary', g:lexical#dictionary)
  execute 'setlocal dictionary=' . join(l:dictionary_list, ',')
  if len(&dictionary) > 0
    setlocal complete+=k
  else
    setlocal complete-=k
  endif

  if len(g:lexical#spell_key) > 0
    execute 'nnoremap <buffer> ' . g:lexical#spell_key . ' vaWovEa<C-X><C-S>'
  endif
  if len(g:lexical#thesaurus_key) > 0
    execute 'nnoremap <buffer> ' . g:lexical#thesaurus_key . ' vaWovEa<C-X><C-T>'
  endif
  if len(g:lexical#dictionary_key) > 0
    execute 'nnoremap <buffer> ' . g:lexical#dictionary_key . ' vaWovEa<C-X><C-K>'
  endif

endfunction

" vim:ts=2:sw=2:sts=2
