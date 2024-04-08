if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fehawen/sc.vim'
Plug 'fehawen/sl.vim'

call plug#end()

" Disables bold mode
" https://vimhelp.org/term.txt.html
" set t_md=

" Must come before 'syntax on'
" https://vimdoc.sourceforge.net/htmldoc/syntax.html#xterm-color
" set t_Co=8

syntax on
filetype on
filetype plugin on
filetype indent on

scriptencoding utf-8
set encoding=utf-8

set backspace=indent,eol,start
set title
set autoread
set showmatch
set mat=2
set magic
set mouse=a " Yes, I'm sorry. Scroll wheels are convenient.
set hlsearch
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set cursorline
set nocursorcolumn
set ffs=unix,dos,mac
set wrap
set pumheight=10
set nobackup
set nowritebackup
set noswapfile
set mouse=a
" set ttymouse=xterm

set maxmempattern=20000
set completeopt-=preview

set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**

set list
set fillchars=vert:│,fold:┄,diff:╱
set listchars=tab:⋮\ ,trail:⎵
set showbreak=↪

let g:ale_sign_info = "●"
let g:ale_sign_error = "●"
let g:ale_sign_warning = "●"
let g:ale_sign_style_error = "●"
let g:ale_sign_style_warning = "●"
let g:ale_completion_enabled = 1
let g:ale_virtualtext_cursor = 0

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}

" let g:ale_linters_explicit = 1
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'typescript': ['eslint'],
" \   'typescriptreact': ['eslint'],
" \}

let g:ale_fix_on_save = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeWinSize = 31

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:sl_hide_syntax_item = 1
let g:sl_hide_file_type = 1

colorscheme sc

au VimResized * wincmd=
au BufWritePre * %s/\s\+$//e
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
au WinEnter,BufEnter * call matchadd('ColorColumn', &ft == 'python' ? '\%73v' : '\%81v', 100)
au WinLeave,BufLeave * call clearmatches()
au FileType c,cpp,go setlocal noexpandtab softtabstop=8 shiftwidth=8
au FileType yaml setlocal softtabstop=2 shiftwidth=2

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif

inoremap <expr><S-TAB> pumvisible() ? "\<Esc>" : "\<C-n>"
map <C-n> :NERDTreeToggle<CR>
map <C-f> :find<Space>
map <C-s> :vert ter<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-h> :ALEHover<CR>
nnoremap <silent> gt :ALEGoToDefinition<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
map <Tab> :noh<CR>
tnoremap <Esc> <C-\><C-n>
map § <Esc>
map! § <C-c>
nnoremap py :!python %<CR>
