setlocal textwidth=72
setlocal cc=72
inoremap <buffer> <Leader>e <C-O>:call phpactor#ClassExpand()<CR>
noremap <buffer> <Leader>e :call phpactor#ClassExpand()<CR>
