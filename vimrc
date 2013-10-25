set nocompatible      " Use vim, no vi defaults

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on " Turn on filetype plugins

set number            " Show line numbers
set numberwidth=5     " Bit more breathing room
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8"
set t_Co=256
set t_ut=
set noshowmode
set showcmd
set hidden
set laststatus=2      " Always show the status bar
set visualbell
set cmdheight=2
set lazyredraw
set backspace=2       " Sane backspace in insert mode

set nofoldenable      " Code Folding sucks

set autoread
set autowriteall

" Don't add the comment prefix when I hit enter or o/O on a comment line
set formatoptions-=ro

" Don't wait so long for next keypress
set timeoutlen=500

" no swap, no backup
set nobackup
set nowritebackup
set noswapfile

" Persistent undos
if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=3000
  set undoreload=10000
endif

" Whitespace, softtabs, 2 spaces
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list

set autoindent
set smartindent

set shiftround " Smarter indenting

" List chars
set listchars=""
set listchars=tab:\ \
set listchars+=trail:·
set listchars+=tab:»·
set listchars+=extends:>
set listchars+=precedes:<
set showbreak=↪ " Visualize wrapped lines when wrap toggled

" only show cursorline in the current window and in normal mode
set cursorline
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END
if exists('+colorcolumn')
  set colorcolumn=80 " highlight column 80
endif

" Save when losing focus
au FocusLost * :silent! wall

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Wild settings
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" More natural feeling split positions.
set splitright
set splitbelow

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif






" buffergator splits horizontal bottom (full screen width)
let g:buffergator_viewport_split_policy = "B"

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1.2"}

" Show current file in NERDTree
map <silent> <Leader>s :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" buffergator toggle (needs to be in .vimrc.before with janus)
nnoremap <leader>b :BuffergatorToggle<CR>





" Automatically reload vimrc when it's saved
" au BufWritePost vimrc so ~/.vimrc

" Kill Trailing Whitespaces
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

let mapleader = ","

" Disable things nobody needs.
map Q <Nop>
map K <Nop>

" Don't jump when using * for search
nnoremap * *<C-o>
" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
"nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Exit insert mode and save file
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Exit insert mode not leavin home row
inoremap jk <esc>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Map Control-# to switch tabs
map  <C-0> 0gt
imap <C-0> <Esc>0gt
map  <C-1> 1gt
imap <C-1> <Esc>1gt
map  <C-2> 2gt
imap <C-2> <Esc>2gt
map  <C-3> 3gt
imap <C-3> <Esc>3gt
map  <C-4> 4gt
imap <C-4> <Esc>4gt
map  <C-5> 5gt
imap <C-5> <Esc>5gt
map  <C-6> 6gt
imap <C-6> <Esc>6gt
map  <C-7> 7gt
imap <C-7> <Esc>7gt
map  <C-8> 8gt
imap <C-8> <Esc>8gt
map  <C-9> 9gt
imap <C-9> <Esc>9gt

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Select all
map <Leader>a ggVG

" Open last/alternate buffer
map <Leader><Space> <C-^>

" Improve up / down movement on wrapped lines
nmap k gk
nmap j gj

" Jump to beginning / end
imap <C-b> <C-o>^
imap <C-e> <C-o>$
cnoremap <C-b> <home>
cnoremap <C-e> <end>

" quick new tab
map <C-t> <esc>:tabnew<CR>

" get rid of highlighting of last search result
nnoremap <CR> :noh<CR><CR>
" might be better
nnoremap <leader>h :noh<CR>

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

color xoria256_new

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
