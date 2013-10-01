set t_Co=256
set t_ut=
" color railscasts
color xoria256_new

" don't show vim mode
set noshowmode

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

" no swap, no backup
set noswapfile
set nobackup

" Smarter indenting.
set shiftround

" Code Folding sucks!
set nofoldenable

" Don't wait so long for next keypress...
set timeoutlen=500

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
au BufWritePost .vimrc.after so ~/.vimrc
au BufWritePost .vimrc.before so ~/.vimrc

let mapleader = ","

" Disable things nobody needs.
map Q <Nop>
map K <Nop>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=ro

" Visualize wrapped lines when wrap toggled
set showbreak=↪

" exit insert mode and save file
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" exit insert mode not leavin home row
inoremap jk <esc>

" Select all
map <Leader>a ggVG

" Show current file in NERDTree
map <silent> <Leader>s :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" Open last/alternate buffer
map <Leader><Space> <C-^>

" Improve up / down movement on wrapped lines
nmap k gk
nmap j gj

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Jump to beginning / end of line in insert mode
imap <C-b> <C-o>^
imap <C-e> <C-o>$

" quick new tab
map <C-t> <esc>:tabnew<CR>

" get rid of highlighting of last search result
nnoremap <CR> :noh<CR><CR>
" might be better
nnoremap <leader>h :noh<CR>

" buffergator toggle (needs to be in .vimrc.before with janus)
nnoremap <leader>b :BuffergatorToggle<CR>
" buffergator splits horizontal bottom (full screen width)
let g:buffergator_viewport_split_policy = "B"

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

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
