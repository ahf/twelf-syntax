" Language:     Twelf
" Author:       Alexander Færøy <ahf@0x90.dk>
" Copyright:    Based in part upon twelf.vim from the Twelf repository. Copyright (c) 2009 Alexander Færøy.
" License:      You may redistribute this under the same terms as Vim itself.

if &compatible || v:version < 603
    finish
endif

set iskeyword+=@,!,#-',*-45,47-57,59-90,94-122,\|,^:

syn keyword TwelfType           type

syn keyword TwelfPercentKeys    %mode %infix %prefix %abbrev %postfix %name %freeze %clause %define %solve
syn keyword TwelfPercentKeys    %querytabled %query %tabled %deterministic %unique %block %worlds %covers
syn keyword TwelfPercentKeys    %total %terminates %reduces %theorem %prove %assert %establish %sig %struct
syn keyword TwelfPercentKeys    %where %include %open %use

syn match TwelfTodo             "FIXME" contained
syn match TwelfTodo             "TODO" contained
syn match TwelfTodo             "XXX" contained

syn match TwelfComment          "% .*\|%%.*\|%$" contains=TwelfTodo
syn region TwelfBlockComment    start="%{" end="}%" contains=TwelfTodo

syn match TwelfPunctation       ":\|\.\|="
syn match TwelfDecleration      "^\s*[^A-Z_]\k*\s*:" contains=TwelfPunctation
syn match TwelfArrow            "->\|<-"
syn match TwelfFreeVariable     "\<[A-Z_]\k*\>" 

syn match TwelfParenthesis      "(\|)" contained
syn region TwelfParenthesis     start="(" end=")" transparent contains=ALL


hi def link TwelfType           Type
hi def link TwelfArrow          Operator
hi def link TwelfComment        Comment
hi def link TwelfBlockComment   Comment
hi def link TwelfPercentKeys    Special
hi def link TwelfDecleration    Statement
hi def link TwelfPunctation     Operator
hi def link TwelfParenthesis    PreProc
hi def link TwelfFreeVariable   Constant

let b:current_syntax = "twelf"

" vim: set et ts=4 :
