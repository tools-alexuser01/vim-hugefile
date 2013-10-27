" vim: et sw=2 sts=2

if exists('g:autoloaded_hugefile')
  finish
endif
let g:autoloaded_hugefile = 1

" #toggle {{{1
function! hugefile#toggle()
  if exists('b:hugefile_saved_settings')
    call s:options_restore()
  else
    call s:options_save()
    call s:options_set()
  endif
endfunction

" s:options_save {{{1
function! s:options_save()
  let b:hugefile_saved_settings = {
        \ 'eventignore': &eventignore,
        \ 'foldmethod':  &foldmethod,
        \ }
endfunction

" s:options_restore {{{1
function! s:options_restore()
  let &eventignore = b:hugefile_saved_settings.eventignore
  let &foldmethod  = b:hugefile_saved_settings.foldmethod

  unlet b:hugefile_saved_settings
endfunction

" s:options_set {{{1
function! s:options_set()
  syntax clear
  set eventignore=all
  set foldmethod=manual
endfunction

