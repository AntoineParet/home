" Skia < lordbanana25 AT mailoo DOT org >
" Released under the Beer License - 2014:2015
"
" Based on an initial vimrc by Julien (jvoisin) Voisin <julien.voisin@dustri.org>
" Released under the Beer License - 2010:2012

call plug#begin('~/.vim/plugged')
Plug 'wombat256.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
"Plug 'Shougo/neocomplete.vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/nginx.vim'
Plug 'osyo-manga/vim-over'
call plug#end()

"GENERAL
    set nocompatible            " vim, and not vi
    set history=128             " keep 128 lines of history
    set showcmd                 " show incomplete commands
    colorscheme wombat256mod	" colorsheme : wombat256
    set background=dark
    set nomodeline              " modeline are for pussies
    set textwidth=120           " max number of characters on a single line
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

"SYNTAX/LAYOUT
    filetype plugin indent on   " automatic recognition of filetype
    set wrap                    " wrap

"AUTOCOMPLETION
    set wildmode=list:longest,full
    set wildignore+=*.pyc,*.o    " ignored on autocomplete
    set completeopt=longest,menuone,preview    " cool completion view
    set complete=.,w,b,u,U,t,i,d    " mega tab completion
    set omnifunc=syntaxcomplete#Complete
" TODO complete with more filetypes
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


    let g:SuperTabDefaultCompletionType = 'context'
    autocmd FileType *
          \ if &omnifunc != '' |
          \     call SuperTabChain(&omnifunc, '<c-p>') |
          \ endif

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
    map <C-y> "+y
    map <C-p> "+p
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

" Filetype hack
	autocmd BufRead,BufNewFile *.pl		set filetype=prolog
	autocmd BufRead,BufNewFile *.md		set filetype=markdown
	autocmd Filetype pl set syntax=prolog
    au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

"BINDINGS
    " For all text files set 'textwidth' to 79 characters.
    autocmd FileType text setlocal textwidth=120

    " nerdtree
    map <silent> <C-e> :NERDTreeToggle<CR>
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
    fun! StripTrailingWhitespace()
        if exists('b:noStripWhitespace')
            return
        endif
        %s/\s\+$//e
    endfun
    autocmd BufWritePre * call StripTrailingWhitespace()
    " Don't strip on these filetypes
    autocmd FileType markdown let b:noStripWhitespace=1
    " show unwanted spaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
    " sudo with !!
    map w!! %!sudo tee % > /dev/null

    " auto cd
    autocmd BufEnter * lcd %:p:h

    "tag list
    let g:Tlist_Use_Right_Window=1

    "nerd tree
    let NERDTreeIgnore=['\.pyc$', '\.pyrc$', '\.svn$', '\.git$']
    let NERDTreeQuitOnOpen=1
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



"" Neocomplete
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"

"Load language specific config file
"autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vimrc.python
