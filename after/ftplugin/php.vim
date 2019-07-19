setlocal omnifunc=phpactor#Complete
setlocal keywordprg=pman

" Not customizing equalprg or formatprg for this since phpcbf is not a filter,
" meaning it does not work well on lines or blocks, but on whole files.
noremap <buffer> <Leader>x :!phpcbf %<CR>:edit<CR>

" phpactor mappings
inoremap <buffer> <Leader>u <C-O>:call phpactor#UseAdd()<CR>
noremap <buffer> <Leader>u :call phpactor#UseAdd()<CR>
inoremap <buffer> <Leader>e <C-O>:call phpactor#ClassExpand()<CR>
noremap <buffer> <Leader>e :call phpactor#ClassExpand()<CR>
noremap <buffer> <Leader>] :call phpactor#GotoDefinition()<CR>

let g:ale_php_phpstan_level = 'max'

if filereadable('./vendor/bin/phpcbf')
  let b:ale_fixers = ['phpcbf']
endif

if filereadable('./.php_cs')
  let b:ale_fixers = ['php_cs_fixer']
endif
