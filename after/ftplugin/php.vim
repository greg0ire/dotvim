setlocal omnifunc=phpactor#Complete
setlocal keywordprg=pman
setlocal makeprg=php\ -ln\ %
setlocal errorformat=%m\ in\ %Exception\f\ on\ line\ %l

" Not customizing equalprg or formatprg for this since phpcbf is not a filter,
" meaning it does not work well on lines or blocks, but on whole files.
noremap <Leader>f :!phpcbf %<CR>:edit<CR>
