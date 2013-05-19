autocmd BufWritePost .todo.filtered.txt call todo#merge()

nnoremap <buffer> = :call todo#toggle_complete()<cr>
noremap <buffer> o o<c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr> 
noremap <buffer> O O<c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr> 
inoremap <buffer> <cr> <cr><c-r>=strftime('%Y-%m-%d')<cr> <c-r>=g:todo_filter<cr>


func! todo#execute()
  if !todo#open_attachment()
    call todo#navigate_to_url()
  endif
endfunc

func! todo#open_attachment()
  let attachment = matchstr(getline('.'), '\v\[(.+)\]')
  if attachment == ''
    return 0
  else
    let attachment = strpart(attachment, 1, strlen(attachment) - 2)
    call system('open "' . attachment . '"')
  endif
endfunc

func! todo#navigate_to_url()
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

noremap <buffer> \\ :call todo#execute()<cr>
