set nocompatible
set modelines=0

"vim-plug with automatic setuo
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'

"Fuzzy selection
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vmchale/dhall-vim'

"Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set hidden

"Explicitly define xterm as environment
behave xterm

"More screen updates
set ttyfast

"No exec
set secure

"Scroll before reaching end of page
set scrolloff=5

"Encoding
set encoding=utf-8

"Remove splash screen
set shortmess+=I
set shortmess+=c

augroup XML
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup END

"Toggle absolute line numbers
function ToggleNumber()
    if &number
        set norelativenumber
        set nonumber
    else
        set norelativenumber
        set number
    endif
endfunction

"Toggle relative line numbers
function ToggleRelNumber()
    if &relativenumber
        set nonumber
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunction

map <F2> :call ToggleNumber() <CR>
map <F3> :call ToggleRelNumber() <CR>

"Highlight matching brackets, etc
set showmatch

"Dont need backup
set nobackup
set nowb
set noswapfile

"Spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"Enable auto-indent
set ai
set si

"Enable copy+paste from the clipboard
nnoremap <SPACE> <Nop>
let mapleader = " "

vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nmap <leader>o :FZF<CR>
nmap <leader>t :tabnew<CR>:FZF<CR>

nnoremap <leader>n :tabnew 
nnoremap H :tabp<CR>
nnoremap L :tabn<CR>

"Make split navigation easier
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <leader>g :call LanguageClient_textDocument_definition({'gotoCmd': 'tabnew'})<CR>
nnoremap <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>f :call LanguageClient_textDocument_references()<CR>
nnoremap <c-i> :call LanguageClient_textDocument_formatting()<CR>
vnoremap <c-i> :call LanguageClient_textDocument_rangeFormatting()<CR>

"Plugin config
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

syntax enable
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"Deplete completion
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><CR> pumvisible() ? "\<c-y>\<CR>" : "\<CR>"

"LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'cs': ['/opt/omnisharp-roslyn/OmniSharp.exe', '--stdio', '--lsp'],
    \ 'haskell': ['hie'],
    \ 'java': ['jdtls', '-Dlog.level=ALL']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

autocmd FileType haskell let g:LanguageClient_diagnosticsEnable = 0

"Disable annoying autoindent
set indentkeys-=<:>
