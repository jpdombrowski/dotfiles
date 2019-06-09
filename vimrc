set nocompatible      " Use vim, no vi defaults

let mapleader = ","

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on " Turn on filetype plugins

set number            " Show line numbers
set relativenumber    " use hybrid line number mode
set numberwidth=5     " Bit more breathing room
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8"
set t_Co=256
set t_ut=
set noshowmode        " Don't show mode twice with powerline enabled
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

if has('gui_running')
  set guifont=DejaVu_Sans_Mono_for_Powerline:h11
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
  au BufNewFile,BufRead *.jscsrc set filetype=javascript
  au BufNewFile,BufRead *.jsx.erb set filetype=javascript.jsx
  au BufReadPost *.conf set syntax=ini
  au BufReadPost .babelrc set syntax=json
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  au BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

augroup vimrc
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

if exists('+colorcolumn')
  set colorcolumn=80 " highlight column 80
endif

" set filetypes

" Save when losing focus (does not work in ubuntu terminal)
" au FocusLost * silent! wa


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
" set splitright
" set splitbelow

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore-dir={"node*modules","build","log","*.jpg","tmp","*.png","*.gif","bower_components","dist"}'
endif


" buffergator splits horizontal bottom (full screen width)
let g:buffergator_viewport_split_policy = "B"
" map <leader>b :BuffergatorToggle<CR>
" nnoremap <leader>b :BuffergatorToggle<CR>

" Show current file in NERDTree
map <silent> <Leader>s :NERDTree<CR><C-w>p:NERDTreeFind<CR>:set cursorline<CR>


" ctrl-s for save
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

map <C-F> :Ag<space>
map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>


function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>tn :call NumberToggle()<cr>

" not working, dont know why...
" augroup numtoggle
"   au!
"   au WinLeave * set norelativenumber
"   au WinLeave * set relativenumber
"   au InsertEnter * set norelativenumber
"   au InsertLeave * set relativenumber
" augroup END

" disable vimux slime hotkeys for now
" function! VimuxSlime()
"   call VimuxOpenPane()
"   call VimuxSendText(@v)
"   call VimuxSendKeys("Enter")
" endfunction

" If text is selected, save it in the v buffer and send that buffer to tmux
" vmap <leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
" nmap <leader>vs vip<leader>vs<CR>


" Automatically reload vimrc when it's saved
" au BufWritePost vimrc so ~/.vimrc

" Kill Trailing Whitespaces
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" Use sudo to write file
command! -bar SudoWrite :
      \ setlocal nomodified |
      \  exe (has('gui_running') ? '' : 'silent') 'write !sudo tee % >/dev/null' |
      \ let &modified = v:shell_error

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

" Exit insert mode not leavin home row
inoremap jk <ESC>

" easy new lines in insert mode
imap <C-o> <ESC>o

" jump to end of line in insert mode
imap <silent> <C-e> <ESC>A

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

" Open current file in background tab
map <leader>te :tabedit %<CR>:tabprev<CR>

" Improve up / down movement on wrapped lines
nmap k gk
nmap j gj

" Jump to beginning / end
" imap <C-b> <C-o>^
" imap <C-e> <C-o>$
" cnoremap <C-b> <home>
" cnoremap <C-e> <end>

" quick new tab
map <C-t> <esc>:tabnew<CR>

" get rid of highlighting of last search result
nnoremap <CR> :noh<CR><CR>
" might be better
nnoremap <leader>h :noh<CR>

" easy split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" nnoremap <Up>    3<C-w>-
" nnoremap <Down>  3<C-w>+
" nnoremap <Left>  3<C-w><
" nnoremap <Right> 3<C-w>>

" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

color xoria256
" color lucius
" LuciusWhiteHighContrast

hi IndentGuidesOdd                        ctermbg=234
" hi IndentGuidesEven                       ctermbg=255

source $HOME/.vimrc.local

