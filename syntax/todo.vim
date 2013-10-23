" File:        todo.txt.vim
" Description: Todo.txt syntax settings
" Author:      Leandro Freitas <freitass@gmail.com>
" Licence:     Vim licence
" Website:     http://github.com/freitass/todo.txt.vim
" Version:     0.3

if exists("b:current_syntax")
    finish
endif

"syntax  match  TodoDone       '^[xX]\s.\+$'              contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoDone       '^[xX]\s.\+$'
syntax  match  TodoAttachment '\[.\+\]'
syntax  match  TodoPriorityA  '^([aA])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityB  '^([bB])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityC  '^([cC])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityD  '^([dD])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityE  '^([eE])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityF  '^([fF])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityG  '^([gG])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityH  '^([hH])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityI  '^([iI])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityJ  '^([jJ])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityK  '^([kK])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityL  '^([lL])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityM  '^([mM])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityN  '^([nN])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityO  '^([oO])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityP  '^([pP])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityQ  '^([qQ])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityR  '^([rR])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityS  '^([sS])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityT  '^([tT])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityU  '^([uU])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityV  '^([vV])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityW  '^([wW])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityX  '^([xX])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityY  '^([yY])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoPriorityZ  '^([zZ])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoAttachment
syntax  match  TodoDate       '\d\{4\}-\d\{2\}-\d\{2\}'  contains=NONE
syntax  match  TodoProject    '+\w\+'                    contains=NONE
syntax  match  TodoContext    '@\w\+'                    contains=NONE

" Other priority colours might be defined by the user
highlight  default  link  TodoDone       Comment
highlight  default  link  TodoAttachment Comment
highlight  default  link  TodoPriorityA  Function
highlight  default  link  TodoPriorityB  Statement
highlight  default  link  TodoPriorityC  Identifier
highlight  default  link  TodoDate       PreProc
highlight  default  link  TodoProject    Special
highlight  default  link  TodoContext    Special

let b:current_syntax = "todo"
