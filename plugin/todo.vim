if !exists('g:todo_root')
  let g:todo_root=expand("~/Dropbox/todo")
endif

if !exists('g:todo_open_command')
  let g:todo_open_command='open'
endif

let g:todo_filter = ''

let s:plugin_root = expand("<sfile>:p:h") . '/../'
let s:todo_bin = s:plugin_root . 'bin/todo'

func! todo#open(filter)
  let g:todo_filter = a:filter
  if a:filter == ''
    exec "edit " . g:todo_root . "/todo.txt"
  else
    call system(s:todo_bin . " filter " . a:filter)
    exec "edit " . g:todo_root . "/.todo.filtered.txt"
  endif
endfunc

func! todo#merge()
  call system(s:todo_bin . " merge")
endfunc

func! todo#get_keywords(argLead, cmdLine, curPos)
  return system(s:plugin_root . 'bin/todo keywords')
endfunc

command! -complete=custom,todo#get_keywords -nargs=* Todo call todo#open(<q-args>)
