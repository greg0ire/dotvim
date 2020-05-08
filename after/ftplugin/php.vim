setlocal omnifunc=phpactor#Complete
setlocal keywordprg=pman

" Not customizing equalprg or formatprg for this since phpcbf is not a filter,
" meaning it does not work well on lines or blocks, but on whole files.
noremap <buffer> <Leader>x :!phpcbf %<CR>:edit<CR>

" phpactor mappings
inoremap <buffer> <Leader>u <C-O>:PhpactorImportClass<CR>
noremap <buffer> <Leader>u :PhpactorImportClass<CR>
inoremap <buffer> <Leader>e <C-O>:PhpactorClassExpand<CR>
noremap <buffer> <Leader>e :PhpactorClassExpand<CR>
noremap <buffer> <Leader>] :PhpactorGotoDefinition<CR>
noremap <buffer> <Leader>te :TestFile --testdox<CR>

let g:ale_php_phpstan_level = 'max'
let g:ale_psalm_langserver_options = '--config="$HOME/.config/psalm/psalm.xml"'

if filereadable('./vendor/bin/phpcbf')
  let b:ale_fixers = ['phpcbf']
endif

if filereadable('./.php_cs')
  let b:ale_fixers = ['php_cs_fixer']
endif
