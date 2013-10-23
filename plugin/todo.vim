" Configuration {{{1
if exists('g:todo_root')
  let g:todo_root=expand(g:todo_root)
else
  let g:todo_root=expand("~/Dropbox/todo")
endif

let $TODO_ROOT=g:todo_root

if !exists('g:todo_open_command')
  let g:todo_open_command='open'
endif

if !exists('g:todo_filter')
  let g:todo_filter = ''
endif

if !exists('g:todo_add_date_prefix')
  let g:todo_add_date_prefix = 0
endif

let s:plugin_root = expand("<sfile>:p:h") . '/../'
let s:todo_bin = s:plugin_root . 'bin/todo'

" Functions {{{1

func! todo#open(filter)
  let g:todo_filter = a:filter
  if a:filter == ''
    exec "edit " . g:todo_root . "/todo.txt"
  else
    call system(s:todo_bin . " filter " . a:filter)
    exec "edit " . expand("~/.todo/todo.filtered.txt")
  endif
endfunc

func! todo#merge()
  if todo#has_changed()
    let choice = confirm(
      \ "todo.txt has changed",
      \ "&Overwrite it\n&Lose local changes\n&Cancel")
    
    if choice == 3
      return
    elseif choice == 2
      call todo#open(g:todo_filter)
      set filetype=todo
      return
    end
  end
  call system(s:todo_bin . " merge")
endfunc

func! todo#has_changed()
  return system(s:todo_bin . " has_changed") =~ 'yes'
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

func! todo#get_task_prefix()
  let prefix = ''

  if g:todo_add_date_prefix
    let prefix = strftime('%Y-%m-%d') . ' '
  endif

  if g:todo_filter != ''
    let prefix = prefix . g:todo_filter . ' '
  endif

  return prefix
endfunc

func! todo#toggle_add_date_prefix()
  let g:todo_add_date_prefix = !g:todo_add_date_prefix
  if g:todo_add_date_prefix
    echo "Date Prefix: Enabled"
  else
    echo "Date Prefix: Disabled"
  endif
endfunc

" Commands {{{1
command! -complete=custom,todo#get_keywords -nargs=* Todo call todo#open(<q-args>)

" Auto Commands {{{1

augroup TodoVIM
  autocmd!
  autocmd BufWritePost todo.filtered.txt call todo#merge()
augroup END


" vim: foldmethod=marker
"
