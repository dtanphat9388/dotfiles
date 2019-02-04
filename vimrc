" ############################################  Ubuntu  #############################################
"runtime! debian.vim             "enable neu dung vim trong linux


" ########################################  required config  ########################################
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on


" #########################################  basic config  ##########################################
syntax on                        " enable syntax color
set t_Co=256
" ------- mouse --------
set mouse=a                      " use mouse click anywhere in vim panel
set ttymouse=xterm2              " enable mouse interaction: resize panel
" ------- editor > line number --------
"set number                      " show current line number
set relativenumber
set cursorline	                 " highline cursor line
" ------- editor > search --------
set incsearch
set hlsearch
set ignorecase
set smartcase
" ------- editor > tabstop --------
set tabstop=2
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
set conceallevel=0	             " show quotes in json file
set foldmethod=syntax	           " set folding by (`syntax` | `indent`)
set pastetoggle=<F2>             " toggle between `:set paste` and `:set nopaste`


" ############################################  PLUGINS  ############################################
call vundle#begin()
" ------- basic config --------
Plugin 'VundleVim/Vundle.vim'                       " package management
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'        " helper: shortkey for faster
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" ------- file explorer --------
Plugin 'scrooloose/nerdtree'                        " file explorer (base)
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" ------- themes --------
Plugin 'morhetz/gruvbox'                            " full vim theme
Plugin 'joshdick/onedark.vim'                       " full vim theme
" ------- themes > airline --------
Plugin 'vim-airline/vim-airline'                    " theme: airline (base)
Plugin 'vim-airline/vim-airline-themes'             " 
" ------- DEV CONFIG --------
Plugin 'airblade/vim-gitgutter'                     " git gutter status
"Plugin 'bling/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'               " multi cursor
" ------- editor > syntax > hightline --------
Plugin 'sheerun/vim-polyglot'                       " syntax heightline
Plugin 'Yggdroot/indentLine'                        " vertical indent line

" ------- editor > utils --------
Plugin 'vim-scripts/mru.vim'                        " to manage Most Recently Used files

Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on                           " *** required ***

" #######################################  MAP KEYS CONFIG  #######################################

" -------- VIM --------
":let mapleader = "-"                                                      " --- see :help mapleader (default: '\')
":let maplocalleader = ""                                                  " --- see :help maplocalleader

map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>                     " --- paste > turnon paste mode > new line > paste from clipboard > turnoff paste mode

nnoremap <C-j> :m .+1<CR>==                                                " --- move lines 
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

inoremap jk <ESC>                                                         " `jk` or ESC

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')                     " --- j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

vnoremap < <gv                                                            " --- Stay in visual mode when indenting. You will never have to run gv after
vnoremap > >gv                                                            " performing an indentation.


noremap Y y$                                                              " --- Make Y yank everything from the cursor to the end of the line. This makes Y
                                                                          " act more like C or D because by default, Y yanks the current line (i.e. the
                                                                          " same as yy).

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2	                    " --- change spacing for language specific

" -------- PLUGINS --------

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"           " --- use tab to forward cycle

inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"       " --- use tab to backward cycle

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif	" --- Close the documentation window when completion is done


" ############################################  PLUGINS CONFIG ############################################

" ------------ Theme ------------

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set bg=dark                                                      
colorscheme gruvbox

" ------------ Theme > Airline ------------                                              
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1                       " --- enabled airline
"let g:airline#extensions#tabline#show_splits = 1	                  " --- displaying open splits per tab
"let g:airline#extensions#tabline#switch_buffers_and_tabs = 1       " --- switch position of buffers and tabs on splited tabline
"let g:airline#extensions#tabline#show_buffers = 1	                " --- displaying buffers with a single tab

" ------------ plugin > NERDTree ------------

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" ------------ plugin > vim-polyglot ------------
let g:polyglot_disabled = ['graphql']

" ------------ plugin > vim-mru ------------
let MRU_Auto_Close = 1
let MRU_Window_Height = 15
let MRU_Max_Menu_Entries = 20
let MRU_Max_Submenu_Entries = 15
let MRU_Max_Entries = 10
highlight link MRUFileName LineNr
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows