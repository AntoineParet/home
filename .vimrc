" Skia < lordbanana25 AT mailoo DOT org >
" Released under the Beer License - 2014:2015
"
" Based on an initial vimrc by Julien (jvoisin) Voisin <julien.voisin@dustri.org>
" Released under the Beer License - 2010:2012

"GENERAL
    set nocompatible            " vim, and not vi
    set history=128             " keep 128 lines of history
    set showcmd                 " show incomplete commands
    colorscheme default			" colorsheme : default for now
    set nomodeline              " modeline are for pussies
    set textwidth=120           " max number of characters on a single line
    set background=dark
    filetype plugin on


"ENCODING
    set encoding=utf-8
    set fileencoding=utf-8


"SEARCH and/or REPLACE
    set ignorecase              " caseless search
    set smartcase               " except when using capitals
    set showmatch               " show matching brackets
    set incsearch               " instant search
    set nohlsearch              " don't highlight the search
    set wrapscan                " wrap search
    set gdefault                " assume /g flag on :s/


"UI
    set cursorline              " print cursorline
    set number                  " print the line number
    syntax on                   " activate the syntax
    set ruler                   " always show the current position
    set so=7                    " 9 lines margin to the cursor when moving
    set t_Co=256                " 256 colors
    set splitbelow              " split below current window
    set ttyfast                 " smooth !

    "change color of char that are beyond the 79th column
    highlight rightMargin ctermfg=grey
    match rightMargin /.\%>119v/


" MOUSE
    set mousehide               " hide mouse pointer while typing
    set mouse=a                 " mouse support
    behave xterm                " behave like xterm


"FOLDING
    set foldmethod=manual       " folding on indentation
    set foldlevel=99            " maxindent = inf !


"AUTOCOMPLETION
    set wildmode=list:longest,full
    set wildignore+=*.pyc,*.o    " ignored on autocomplete
    set completeopt=longest,menuone,preview    " cool completion view
    set complete=.,w,b,u,U,t,i,d    " mega tab completion
    set omnifunc=synthaxcomplete#Complete

"SYNTAX/LAYOUT
    filetype plugin indent on   " automatic recognition of filetype
    set wrap                    " wrap

"SPELLCHECK
    "setlocal spell spelllang=fr
    "setlocal spell spelllang=en_gb
    set nospell

"BACKUP
    set nobackup                " no backup : everything is on git/svn
    set nowb
    set noswapfile              " I said everything was on git !


"MAPPING
    " ROT13, olol !
    map <F12> ggVGg?
    set backspace=indent,eol,start " allow backspacing over everything in insert mode
    let mapleader = ","        " remap the leader key to ','


"IDENT
    set autoindent            " Auto-ident
    set smartindent           " Smart ident
    set smarttab              " Reset autoindent after a blank line
    set expandtab             " tabs are spaces
    set tabstop=4             " how many spaces on tab
    set softtabstop=4         " one tab = 4 spaces
    set shiftwidth=4          " reduntant with above

"skeleton
    autocmd BufnewFile *.sh     0r ~/.vim/skeleton.sh|3
    autocmd BufnewFile *.py     0r ~/.vim/skeleton.py|4
    autocmd BufnewFile *.cpp    0r ~/.vim/skeleton.cpp|7
    autocmd BufnewFile *.c      0r ~/.vim/skeleton.c|5
    autocmd BufnewFile *.tex    0r ~/.vim/skeleton.tex|47

" Prolog hack
	autocmd BufRead,BufNewFile *.pl		set filetype=prolog
	autocmd BufRead,BufNewFile *.md		set filetype=markdown
	autocmd Filetype pl set syntax=prolog

"BINDINGS
    " For all text files set 'textwidth' to 79 characters.
    autocmd FileType text setlocal textwidth=120

    " nerdtree
    map <silent> <F6> :tabprevious<CR>
    map <silent> <F7> :tabnext<CR>
    map <silent> <F8> :set spell!<CR>
    set pastetoggle=<F9>


    " Shifting visual block should keep it selected
    vnoremap < <gv
    vnoremap > >gv

    " Auto brackets
    inoremap (( ()<Esc>i
    inoremap [[ []<Esc>i
    inoremap {{ {}<Esc>i
    inoremap "" ""<Esc>i
    inoremap '' ''<Esc>i

    " nice xml !
    inoremap <buffer> </ </<C-x><C-o><Esc>a
    inoremap <buffer> <!D <!D<C-x><C-o>
    inoremap <buffer> <!- <!--<Space><Space>--><Esc>3hi

    " mousepaste
    map <MouseMiddle> <esc>"*p


" MISC
    set visualbell            " no beep !
    " no trailing spaces !
	autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
    " sudo with !!
    map w!! %!sudo tee % > /dev/null

    "tag list
    let g:Tlist_Use_Right_Window=1

    "nerd tree
    let NERDTreeIgnore=['\.pyrc$', '\.svn$', '\.git$']
	"autocmd BufEnter * NERDTreeMirror

    "Phase of the Moon calculation
    let time = localtime()
    let fullday = 86400
    let offset = 592500
    let period = 2551443
    let phase = (time - offset) % period
    let phase = phase / fullday


" USEFUL FUNCTIONS
    if has("autocmd")
      " When editing a file, always jump to the last cursor position
      autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
    endif

" specific stuffs
" no tabexpand for makefiles
    autocmd FileType make setlocal noexpandtab


