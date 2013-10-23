nnoremap <buffer> == :call todo#toggle_complete()<cr>
noremap <buffer> o o<c-o>0<c-o>d$<c-r>=todo#get_task_prefix()<cr>
noremap <buffer> O O<c-o>0<c-o>d$<c-r>=todo#get_task_prefix()<cr>
inoremap <buffer> <cr> <cr><c-o>0<c-o>d$<c-r>=todo#get_task_prefix()<cr>
noremap <buffer> \\ :call todo#execute()<cr>

command! -nargs=0 ToggleDates call todo#toggle_add_date_prefix()


