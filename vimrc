"=============== vbundle =============="
set nocompatible              " be iMproved, required
filetype off                  " required
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'taglist.vim'
" Git integration
Plugin 'fugitive.vim'
Plugin 'The-NERD-tree'
" Color scheme
Plugin 'Solarized'
" comment shortcut using gc
Plugin 'tpope/vim-commentary'
" Python Auto-completion
Plugin 'davidhalter/jedi-vim'
" Markdown
Plugin 'godlygeek/tabular'
" Python collection
Plugin 'Python-mode-klen'
" Browsing the tags of source code files
Plugin 'majutsushi/tagbar'
" Markdown
Bundle 'gabrielelana/vim-markdown'
"Plugin 'plasticboy/vim-markdown'
" show changed lines
Plugin 'chrisbra/changesPlugin'
" status/tabline for vim
Plugin 'bling/vim-airline'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"=============== configuration =============="
"let mapjeader=","   " change the mapleader from \ to ,
set number          " always show line numbers
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set shiftwidth=4 softtabstop=4 expandtab
                    " softtabstop: number of spaces that <Tab> uses while editing
                    " shiftwidth: number of spaces to use for (auto)indent step
                    " expandtab: replace tab to space

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
autocmd BufRead,BufNewFile *.md setlocal spell      " spell check
autocmd BufRead,BufNewFile *.tex setlocal spell     " zg to add to dictionary
                                                    " z= to list suggestions

" disable logging history for netrw plugin
let g:netrw_dirhistmax = 0

" Enable syntax highlighting
set t_Co=256
syntax on

if &t_Co >= 256 || has("gui_running")
	"colorscheme proton
	colorscheme zenburn
	"syntax enable
	set background=dark
	"set background=light
	let g:solarized_termcolors=256
	"colorscheme solarized
endif


" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>

"=============== taglist =============="
"filetype on
"nmap <F7> :TlistToggle<CR>
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_Inc_Winwidth = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
nmap <F7> :TagbarToggle<CR>
"let g:tagbar_autoclose = 1
let g:tagbar_autoopen = 0
let g:tagbar_indent = 1
let g:tagbar_width = 30

""=============== NERDTree =============="
let NERDTreeWinPos = "left"
nmap <F9> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_focus_on_files=1
"autocmd VimEnter * nested :TagbarOpen

"=============== source explorer =============="
nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

" ==============line width =============="
highlight OverLength ctermbg=black ctermfg=yellow guibg=#592929
match OverLength /\%81v.\+/
set wrap


"=============== vim-futigive =============="
command GS Gstatus
nmap <F6> :Gstatus<CR>

"=============== vim-markdown =============="
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

"=============== python-mode =============="
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_breakpoint = 1
let g:pymode_folding = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'import pdb;pdb.set_trace()'
let g:pymode_rope = 0
let g:pymode_lint = 0

"=============== Custom command =============="
command -nargs=+ GG execute 'silent Ggrep!' <q-args> | cw | redraw!
"command -nargs=+ GG execute 'silent Ggrep! --color' <q-args> | cw
