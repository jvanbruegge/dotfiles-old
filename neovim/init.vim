"Use vim defaults
set nocompatible

"Disable filetype detection during init
filetype off

"Vundle with automatic setup
let iCanHazVundle=1
let vundle_readme=expand('~/.config/nvim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.config/nvim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.config/nvim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.config/nvim/bundle/vundle
call vundle#begin('~/.config/nvim/bundle')

Plugin 'gmarik/vundle'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ciaranm/securemodelines'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tikhomirov/vim-glsl'
Plugin 'ntpeters/vim-better-whitespace'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

call vundle#end()
filetype plugin indent on



"Enable syntax highlighting
syntax enable

"Explicitly define xterm as environment
behave xterm

"More screen updates
set ttyfast

"Enable modelines
set modeline

"No exec
set secure

"Encoding
set encoding=utf-8

"Remove splash screen
set shortmess+=I

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

"Plugin config
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

"YouCompleteMe configuration
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.']
            \ }
