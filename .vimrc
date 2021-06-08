call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'

"Color themes
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
colorscheme codedark
let g:airline_theme = 'codedark'
let g:deoplete#enable_at_startup = 1
set guifont=Fira\ Code:h18

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
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
noremap ˚ :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap ∆ ddp

"coc
let g:coc_global_extensions = [ 'coc-tsserver' ]
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" CoC jump next error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


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

" Terminal
tnoremap <Esc> <C-\><C-n>

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
