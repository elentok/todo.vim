nnoremap <buffer> = :call todo#toggle_complete()<cr>
noremap <buffer> o o<c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr> 
noremap <buffer> O O<c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr> 
inoremap <buffer> <cr> <cr><c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr>
noremap <buffer> \\ :call todo#execute()<cr>


