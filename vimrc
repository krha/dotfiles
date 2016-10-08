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
Plugin 'junegunn/seoul256.vim'
" comment shortcut using gc
Plugin 'tpope/vim-commentary'
" Python Auto-completion
"Plugin 'davidhalter/jedi-vim'
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
" Git diff changes: next change ]c, previous change [c
"Plugin 'airblade/vim-gitgutter'
"let g:gitgutter_max_signs = 5000
" Use Vim as a writing tool
Plugin 'reedes/vim-pencil'
" focus on working paragraph
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
" vim-online-thesaurus. Shortcut <LocalLeader>K
Plugin 'beloglazov/vim-online-thesaurus'
" Outline structure for VIM and Markdown
Plugin 'VOoM'
" HHVM Hack plugin
Plugin 'git://github.com/hhvm/vim-hack.git'
" File navigation: http://ctrlpvim.github.io/ctrlp.vim/
Plugin 'ctrlp.vim'  " <c+p>, <c+d>, <c+j,k>
" vim tmux integration
Plugin 'benmills/vimux'


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
	colorscheme zenburn
	"colorscheme solarized
        "let g:seoul256_background = 236 " 233 (darkest) ~ 239 (lightest)
	"colorscheme seoul256
	"syntax enable
	set background=dark "or light
	"let g:solarized_termcolors=256
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
"nmap <F8> :SrcExplToggle<CR>
"nmap <C-H> <C-W>h
"nmap <C-J> <C-W>j
"nmap <C-K> <C-W>k
"nmap <C-L> <C-W>l
"let g:SrcExpl_winHeight = 8
"let g:SrcExpl_refreshTime = 100
"let g:SrcExpl_jumpKey = "<ENTER>"
"let g:SrcExpl_gobackKey = "<SPACE>"
"let g:SrcExpl_isUpdateTags = 0

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
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0  " Only when type :PymodeLint
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 1

"=============== Vim grep =============="
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt

"=============== Custom command =============="
command -nargs=+ GG execute 'silent Ggrep!' <q-args> | cw | redraw!
nnoremap <C-G> :GG <cword><CR>

" find cursor word in dictionary, works only in Mac
nmap <F5> :!open /Applications/Google\ Chrome.app http://dic.daum.net/search.do?q=<cword><CR>



"=============== Vim-Pencil =============="
let g:pencil#cursorwrap = 1     " 0=disable, 1=enable (def)
let g:pencil#wrapModeDefault = 'hard'   " default is 'hard'
let g:pencil#textwidth = 70

augroup pencil
    autocmd!
    autocmd FileType tex          call pencil#init()
    "autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

"=============== Limelight =============="
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 241

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'


"=============== Goyo =============="
function! s:goyo_enter()
    silent !tmux set status off
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
    Pencil
    "Goyo 80%
    "Voom latex
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
    NoPencil
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"=============== Synonym - Online thesaurus =============="
nnoremap <unique> <LocalLeader>s :OnlineThesaurusCurrentWord<CR>
vnoremap <unique> <LocalLeader>s y:Thesaurus <C-r>"<CR>


"=============== Voom =============="
let g:voom_tree_placement = "right"
let g:voom_tree_width = 30
"let g:voom_tree_height = 40
nmap <F8> :Voom latex<CR>

"=============== CtrlP =============="
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>t :CtrlPMRUFiles<CR>
let g:ctrlp_mruf_max = 5

"=============== Vimux =============="
" Prompt for a command to run
map rp :VimuxPromptCommand<CR>
map rl :VimuxRunLastCommand<CR>
map rq :VimuxCloseRunner<CR>
map rs :VimuxInterruptRunner<CR>
