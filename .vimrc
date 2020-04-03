set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"--- Making Vim look good ---
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" Grep alternative
Plugin 'mileszs/ack.vim'

"--- Vim as a programmer's text editor ---

" File-system browser - use <Leader>t to toggle
Plugin 'scrooloose/nerdtree'

"--- Other text editing features ---

" Auto-close paired characters, like quotation marks and brackets
Plugin 'Raimondi/delimitMate'

"--- Rust
Plugin 'rust-lang/rust.vim'

"--- TOML
Plugin 'cespare/vim-toml'

"--- Wiki + Zettelkasten
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'michal-h21/vim-zettel'

call vundle#end()

filetype plugin indent on

"--- General Settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

set path+=**
set wildmenu

let mapleader=" "
syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "dark" for light colorscheme
"set background=dark

" Uncomment the next line if your terminal is not configured for solarized
let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized
colorscheme delek

" Map page up and page down
map <S-UP> <c-b>
map <S-DOWN> <c-f>

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

"Open/close NERDTree with <leader>f (for Filesystem viewer)
nmap <silent> <leader>f :NERDTreeToggle<CR>

"--- scrooloose/syntastic settings ---
let g:syntastic_error_symbol ='✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=.tags;,tags;
" Sensible defaults for auto-generating tags files
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with <leader>t (for Tags) 
nmap <silent> <leader>t :TagbarToggle<CR>

" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- Edit crontab files in place -----
autocmd FileType crontab setlocal nowritebackup

" ----- Vimwiki settings recommended by vim-zettel plugin -----
let g:vimwiki_list = [{'path':'~/vimwiki/','ext':'.md','syntax':'markdown'}, {"path":"~/vimwiki/"}]
let g:zettel_format = "%y%m%d-%H%M-%title"

" Add hyphen character to keyword character set so that hyphen-separated
" strings are treated as single words (allows C-] to find tag)
autocmd FileType vimwiki setlocal iskeyword+=45

" ----- Miscellaneous mappings -----
nnoremap gb :ls<CR>:b 
nnoremap <leader>m :!make<CR>

" ----- Fuzzy Finder FZF -----
" If installed using git
set rtp+=~/.fzf


