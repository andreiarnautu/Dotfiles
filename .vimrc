set nocompatible              " be iMproved, required
filetype off                  " required

packadd! dracula_pro

syntax on
filetype indent plugin indent on
set omnifunc=syntaxcomplete#Complete

if has("termguicolors")     " set true colors
    let t_8f="\[[38;2;%lu;%lu;%lum"
    let t_8b="\[[48;2;%lu;%lu;%lum"
    set termguicolors
endif

highlight Normal ctermbg=None
set listchars=eol:¬
set list

" -------------------------------- Plugins -----------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" -------- The project source tree browser.
Plugin 'scrooloose/nerdtree'

" -------- The enhanced editor status bar.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" -------- C/C++ plugins
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'

" -------- Javascript and python plugins
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}  " using this for C++, Python, JS, TS, React and Rust autocompletion
Plugin 'vim-python/python-syntax'

" -------- Theme plugins
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
Plugin 'arcticicestudio/nord-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'dracula/vim'
Plugin 'AlessandroYorba/Alduin'

" -------- Other plugins
Plugin 'elzr/vim-json'              " show the quotes in json files
Plugin 'Yggdroot/indentLine'        " indentation guide
Plugin 'ryanoasis/vim-devicons'       " adds icons in NerdTree
Plugin 'dag/vim2hs'
"Plugin 'neovimhaskell/haskell-vim'

call vundle#end()            " required
filetype indent plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" -------------------------------- End of Plugins -----------------------------------

syntax enable

" ----------- Nord -----------
"colorscheme nord
let g:nord_bold=1
let g:nord_italic=1
let g:nord_italic_comments=1
let g:nord_underline=1
let g:nord_termtrans=1

" ----------- Gruvbox ------------
"set background=dark
let g:gruvbox_contrast_dark="soft"
set background=light
let g:gruvbox_contrast_light="soft"
let g:gruvbox_bold=0
let g:gruvbox_italic=0
let g:gruvbox_transparent_bg=1
let g:gruvbox_termcolors=16
"colorscheme gruvbox

" ----------- Dracula ------------
"colorscheme dracula
"let g:dracula_colorterm = 0
colorscheme dracula_pro_buffy

" ----------- Alduin ------------

"colorscheme alduin

" ---------- General Settings ----------
set backspace=indent,eol,start

set scrolloff=10

syntax enable

" Show line numbers
set number

" Highlight matching brace
set showmatch

" Highlight all search results
set hlsearch

" Highlight the current cursor line
set cursorline

" Highlight the 80 columns margin.
"set colorcolumn=80

" Trim the trailing white space on save.
autocmd BufWritePre <buffer> :%s/\s\+$//e

"  Copy and paste to the system's clipboard
set clipboard=unnamedplus

set relativenumber

" ---------- Indentation ----------
set autoindent

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" ---------- Folding ----------
let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! NeatFoldText()
    let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
    let l:first=substitute(getline(v:foldstart), '\v *', '', '')
    let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
    return s:raquo . s:middot . s:middot . l:lines . l:dashes . l:dashes
endfunction


if has('folding')
    if has('windows')
        set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
        set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    endif
    set foldmethod=indent               " not as cool as syntax, but faster
    set foldlevelstart=0                " start unfolded
    set foldtext=NeatFoldText()
endif

" Do not fold the code by default
"set foldlevel=1

" ---------- Airline Theme ----------
let g:airline_theme='dracula'
" Enable wordcount
let g:airline#extensions#wordcount#enabled = 1
" Add notes to filetypes
let g:airline#extensions#wordcount#filetypes = '\vnotes|help|markdown|rst|org|text|asciidoc|tex|mail'
"let g:airline_theme='base16_nord'
" ---------- NerdTree Project Browser ----------
"nnoremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ---------- Indent line -------
filetype indent plugin on
syntax on

"let g:indentLine_enabled = 1
let g:indentLine_conceallevel=1
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_char_list=['ⵗ']


" --------- JavaScript syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" --------- vim-json
let g:vim_json_syntax_conceal = 0

" -------- coc-nvim
let g:coc_disable_startup_warning=1
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-eslint',
    \ 'coc-tslint',
    \ 'coc-tslint-plugin',
    \ 'coc-python',
    \ 'coc-rls']
"  \ 'coc-rust-analyzer',

" Trigger auto-completion with C-space.
inoremap <silent><expr> <c-space> coc#refresh()
" Make <TAB> select next completion and Shift-<TAB> to select previous.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<S-TAB>" :
    \ coc#refresh()

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" ---------- Enhanced C++ syntax highlighting ----------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" ---------- YCM Auto Complete ----------
nnoremap <F12> :YcmCompleter GoTo<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_autoclose_preview_window_after_completion=1
let mapleader = " "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> \ ]
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "objc":1,
    \ "sh":1,
    \ "zsh":1,
    \ "zimbu":1,
    \ "python":1,
    \ "rust":1
\ }

" ---------- Neovide ----------
let g:neovide_transparency=0

let g:python_highlight_all = 1

" ---------- Haskell ----------
let g:haskell_conceal = 0
