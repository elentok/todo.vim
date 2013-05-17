if !exists('g:todo_file')
  let g:todo_file=expand("~/Dropbox/todo/todo.txt")
endif
let g:todo_filter = ''
let g:todo_filter_prompt = 'Filter by: '

func! OpenTodo(filter)
  let g:todo_filter = a:filter
  if bufexists("[Todo]")
    buffer [Todo]
  else
    call s:CreateTodo(a:filter)
  endif
endfunc

func! s:CreateTodo(filter)
  if bufname('%') != '' || &modified
    new
  end
  setlocal buftype=nofile bufhidden=hide
  set nomodifiable
  file [Todo]
  set filetype=todo
  call Filter(a:filter)
endfunc

command! -nargs=* Todo call OpenTodo(<q-args>)
