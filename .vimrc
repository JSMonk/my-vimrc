call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'posva/vim-vue'
Plug 'elmcast/elm-vim'
Plug 'raichoo/purescript-vim'
Plug 'leafgarland/typescript-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'eagletmt/neco-ghc'
Plug 'dart-lang/dart-vim-plugin'
Plug 'fatih/vim-go'
Plug 'alx741/vim-hindent'
Plug 'w0rp/ale'
Plug 'reasonml-editor/vim-reason'
Plug 'fsharp/vim-fsharp'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

"Color themes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf'

call plug#end()

set autoread
set termguicolors
syntax enable
set cursorline
set t_Co=256
set relativenumber
set background=dark
colorscheme onehalfdark
let g:airline_theme = 'onehalfdark'
let g:deoplete#enable_at_startup = 1
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set copyindent 
set guifont=Fira\ Code:h12

set hlsearch
set incsearch
set ignorecase 
set smartcase

let g:ctrlp_working_path_mode = 'ar'

"mappings
map <C-d> :NERDTreeToggle<CR>
map <C-h> :call WinMove('h')<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-l> :call WinMove('l')<CR>
map <C-n> :tabnew<CR>
map <C-w> :tabclose<CR>
map <C-u> :call TabMove('u')<CR>
map <C-i> :call TabMove('i')<CR>
noremap ˚ :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap ∆ ddp

function! TabMove(key)
  let t:curtab = tabpagenr()
  let t:diff = 0
  if (a:key == 'u')
    let t:diff = -1
  elseif (a:key == 'i')
    let t:diff = 1
  endif
  let t:nexttab = t:curtab + t:diff
  echo t:diff
  exec "tabn ".t:nexttab
endfunction

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if(match (a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"go
let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
