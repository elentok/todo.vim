let b:todo_mode = 'normal'

func! StartFilter()
  let b:todo_mode = 'filtering'
  call RenderStatusLine(1)

  while 1
    let nr = getchar()
    let chr = !type(nr) ? nr2char(nr) : nr
    if nr == 13
      break
    elseif nr == "\<Backspace>"
      let new_todo_filter = strpart(g:todo_filter, 0, strlen(g:todo_filter) - 1)
      call Filter(new_todo_filter)
    else
      call Filter(g:todo_filter . chr)
    endif
  endwhile

  call StopFilter()
endfunc

func! StopFilter()
  let b:todo_mode = 'normal'
  call RenderStatusLine(1)
endfunc

func! Filter(filter)
  let g:todo_filter = a:filter

  set modifiable
  normal ggdG
  exec "silent read !grep '" . g:todo_filter . "' " . g:todo_file
  call RenderStatusLine(0)
  normal gg$
  set nomodifiable
  redr
endfunc

map <c-f> :call StartFilter()<cr>

func! RenderStatusLine(done)
  let line = ''
  if b:todo_mode == 'normal'
    if g:todo_filter == ''
      let line = 'TODO: Showing all'
    else
      let line = 'TODO: Filtering by "' . g:todo_filter . '"'
    endif
  else
    let line = g:todo_filter_prompt . g:todo_filter . '_'
  end

  set modifiable
  call setline(1, line)
  if a:done == 1
    set nomodifiable
    redr
  endif
endfunc
