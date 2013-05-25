" Configuration {{{1
if !exists('g:todo_root')
  let g:todo_root=expand("~/Dropbox/todo")
endif

if !exists('g:todo_open_command')
  let g:todo_open_command='open'
endif

let g:todo_filter = ''

let s:plugin_root = expand("<sfile>:p:h") . '/../'
let s:todo_bin = s:plugin_root . 'bin/todo'

" Functions {{{1

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
    call system(g:todo_open_command . ' "' . attachment . '"')
    return 1
  endif
endfunc

func! todo#navigate_to_url()
  let url = matchstr(getline('.'), '\vhttps?[^ )\]]+')
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

" Commands {{{1
command! -complete=custom,todo#get_keywords -nargs=* Todo call todo#open(<q-args>)

" vim: foldmethod=marker
