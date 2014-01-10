" =============================================================================
" File:        plugin/lexical.vim
" Description: Spell/Dictionary/Thesaurus support for the Vim text editor
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: January 1, 2014
" License:     The MIT License (MIT)
" =============================================================================

if exists('g:loaded_lexical') || &cp | finish | endif
let g:loaded_lexical = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

if !exists('g:lexical#spell')
  let g:lexical#spell = 1
endif

if !exists('g:lexical#spelllang')
  let g:lexical#spelllang = [&spelllang,]
endif

if !exists('g:lexical#thesaurus')
  let thes_path = '~/.vim/thesaurus/mthesaur.txt'
  let g:lexical#thesaurus = [
        \ filereadable(expand(thes_path))
        \ ? thes_path
        \ : ''
        \ ]
endif

if !exists('g:lexical#dictionary')
  let dict_path = '/usr/share/dict/words'
  let g:lexical#dictionary = [
        \ has('unix') && filereadable(dict_path)
        \ ? dict_path
        \ : ''
        \ ]
endif

if !exists('g:lexical#thesaurus_key')
  let g:lexical#thesaurus_key = ''
endif

if !exists('g:lexical#dictionary_key')
  let g:lexical#dictionary_key = ''
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2
