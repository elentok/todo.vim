autocmd BufWritePost .todo.filtered.txt call todo#merge()

nnoremap <buffer> = :call todo#toggle_complete()<cr>
noremap <buffer> o o<c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr> 
noremap <buffer> O O<c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr> 
inoremap <buffer> <cr> <cr><c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr>

func! todo#navigate()
  let url = matchstr(getline('.'), '\vhttps?[^ ]+')
  echo url
  if url != ''
    call system('open "' . url . '"')
  endif
endfunc

func! todo#toggle_complete()
  if getline('.') =~ '^x'
    s/\v^x [0-9-]+ +//
  else
    exec "s/^/x " . strftime('%Y-%m-%d') . " /"
  endif
endfunc

noremap <buffer> ,gu :call todo#navigate()<cr>
