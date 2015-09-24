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
  " enable by default (ignore global &spell)
  let g:lexical#spell = 1
endif

if !exists('g:lexical#spelllang')
  " build on global-defined spelling language
  let g:lexical#spelllang = [&spelllang,]
endif

if !exists('g:lexical#thesaurus')
  " build on globally-defined thesaurus, if any
  let thes_list = split(&thesaurus, ',')
  if len(thes_list) > 0
    " use the globally-defined thesaurus
    let g:lexical#thesaurus = thes_list
  else
    " attempt to discover a thesaurus
    let thes_path = '~/.vim/thesaurus/mthesaur.txt'
    let g:lexical#thesaurus = [
          \ filereadable(expand(thes_path))
          \ ? thes_path
          \ : ''
          \ ]
    unlet thes_path
  endif
  unlet thes_list
endif

if !exists('g:lexical#dictionary')
  " build on globally-defined dictionary, if any
  let dict_list = split(&dictionary, ',')
  if len(dict_list) > 0
    " use the globally-defined dictionaries
    let g:lexical#dictionary = dict_list
  else
    " attempt to discover a dictionary
    let dict_path = '/usr/share/dict/words'
    let g:lexical#dictionary = [
          \ has('unix') && filereadable(dict_path)
          \ ? dict_path
          \ : ''
          \ ]
    unlet dict_path
  endif
  unlet dict_list
endif

if !exists('g:lexical#spellfile')
  " build on globally-defined spellfile, if any
  let spellfile_list = split(&spellfile, ',')
  if len(spellfile_list) > 0
    " use the globally-defined spellfile
    let g:lexical#spellfile = spellfile_list
  else
    " attempt to discover a spellfile
    let spellfile_path = '~/.vim/spell/en.utf-8.add'
    let g:lexical#spellfile = [
          \ has('unix') && filereadable(spellfile_path)
          \ ? spellfile_path
          \ : ''
          \ ]
    unlet spellfile_path
  endif
  unlet spellfile_list
endif

if !exists('g:lexical#spell_key')
  let g:lexical#spell_key = ''
endif
if !exists('g:lexical#thesaurus_key')
  let g:lexical#thesaurus_key = ''
endif
if !exists('g:lexical#dictionary_key')
  let g:lexical#dictionary_key = ''
endif
if !exists('g:lexical#spellfile_key')
  let g:lexical#spellfile_key = ''
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2
