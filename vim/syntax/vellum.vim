" Vim syntax file
" Language:	Vellum
" Maintainer:	Erich Heine <eheine@pavlovmedia.com>
" URL:
" Last Change:	$Date$
" Filenames:	*.vel
" Version:	0.0.1
"
"
" Still needs much work.
" TODO: include all builtin commands, and a way for automatically discovering
" and adding user specific commands

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Keywords
syn match   vellumComment	"#.*$" display contains=vellumTodo
syn keyword vellumTodo		TODO FIXME XXX HACK contained
syn keyword vellumStanzas	imports options depends targets
syn region vellumCalls matchgroup=vellumStructs start=!.\{-\}\(|\|\$\|>\)! end=!\n! contained oneline keepend
syn region vellumLists matchgroup=vellumStructs start=+\[+ end=+]+ contains=vellumFuncCalls,vellumLists,vellumDicts,vellumCmds,vellumCalls,vellumWords
syn region vellumDicts matchgroup=vellumStructs start=+(+ end=+)+ contains=vellumFuncCalls,vellumLists,vellumDicts,vellumDictKey,vellumCmds,vellumWords
syn match vellumDictKey	![a-zA-Z.]\+! contained nextgroup=vellumLists,vellumDicts,vellumWords,vellumCmds,vellumCalls
syn match vellumWords !'.\{-\}'\|".\{-\}"! contained
syn match vellumFuncCalls	"[a-zA-Z]\+("me=e-1
syn keyword vellumCmds	py

command -nargs=+ HiLink hi def link <args>

HiLink vellumStanzas	Structure
HiLink vellumComment	Comment
HiLink vellumTodo	Todo
HiLink vellumLists	Normal
HiLink vellumStructs	String
HiLink vellumFuncCalls	Statement
HiLink vellumCalls	Normal
HiLink vellumCmds	Statement
HiLink vellumDictKey	Function
HiLink vellumWords	Normal

delcommand HiLink

let b:current_syntax = "vellum"

