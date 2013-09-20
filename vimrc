set t_Co=256
set t_ut=
" color railscasts
color xoria256

set showcmd

set hidden

set autoindent
set smartindent

set cursorline
set colorcolumn=80

" More natural feeling split positions.
set splitright
set splitbelow

" Persistent undos.
set undofile
set undodir=~/.vim/undodir

" Smarter indenting.
set shiftround

" Code Folding sucks!
set nofoldenable

" Don't wait so long for next keypress...
set timeoutlen=500

let mapleader = ","

" Disable things nobody needs.
map Q <Nop>
map K <Nop>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=ro

" exit insert mode and save file
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" exit insert mode not leavin home row
inoremap jk <esc>

" this is redundant...
nmap k gk
nmap j gj

" quick new tab
map <C-t> <esc>:tabnew<CR>

" get rid of highlighting of last search result
nnoremap <CR> :noh<CR><CR>

nnoremap <Up>    3<C-w>-
nnoremap <Down>  3<C-w>+
nnoremap <Left>  3<C-w><
nnoremap <Right> 3<C-w>>

" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" easy split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
