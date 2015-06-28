set nocompatible              " be iMproved, required
filetype off                  " required

" begin Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jeetsukumaran/vim-buffergator'

call vundle#end()
" end Vundle
" in vim, run :PluginInstall

filetype plugin indent on    " load the plugin and indent settings for the detected filetype
syntax on

set wildignore+=*/tmp/*cache/**
set wildignore+=*/tmp/locale_assets/**
set wildignore+=*/tmp/letter_opener/**

set nocompatible
set number
set showcmd
set ruler
set antialias
set guifont=Source\ Code\ Pro\ Light:h15
set laststatus=2
set statusline=%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)

set background=dark
if has ('gui_running')
	colorscheme solarized
else
	colorscheme default
endif
autocmd FileType ruby setlocal nosi ts=2 sts=2 sw=2 et tw=78
autocmd FileType python setlocal autoindent tabstop=8 shiftwidth=4 softtabstop=4 et tw=80
autocmd FileType c setlocal autoindent ts=4 sts=4 sw=4 et tw=80
autocmd FileType html setlocal autoindent ts=2 sts=2 sw=2 et

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=LightMagenta guibg=LightMagenta
" match WhitespaceEOL /\s\+$/

command! NT NERDTree
command! SWS StripWhitespace

let g:ctrlp_custom_ignore = 'tmp\/\|log\/\|public\/assets\/'
