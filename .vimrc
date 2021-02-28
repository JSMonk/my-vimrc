call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'easymotion/vim-easymotion'
Plug 'alx741/vim-hindent'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-crystal/vim-crystal'

"Color themes
Plug 'arcticicestudio/nord-vim'

call plug#end()

set autoread
syntax enable
set cursorline
set t_Co=256
set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set background=dark
set termguicolors
colorscheme nord
let g:airline_theme = 'nord'
let g:deoplete#enable_at_startup = 1
set guifont=Fira\ Code:h18

set hlsearch
set incsearch
set ignorecase
set smartcase

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

"coc
let g:coc_global_extensions = [ 'coc-tsserver' ]
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
