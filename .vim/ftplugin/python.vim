"AUTOCOMPLETION
set smartindent cinwords=if,else,elif,for,while,except,finally,def,class,with
let python_highlight_all=1
set omnifunc=pythoncomplete#Complete

"SEARCH/REPLACE
set iskeyword+=_

"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m set makeprg=python
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

nmap <F5> :!python %<CR>

"KEYMAP
noremap ## <Esc>I#<Esc>j
