set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" General style
Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-ShowTrailingWhitespace'

" Language support
Plugin 'bfrg/vim-cpp-modern'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-python/python-syntax'

" Linters/Completers
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'lunarwatcher/auto-pairs'
Plugin 'tpope/vim-commentary'

" Search
Plugin 'kien/ctrlp.vim'
Plugin 'yegappan/grep'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

" VIM base
set mouse=a
set belloff=all
set encoding=UTF-8
set viminfo=
colorscheme onedark
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent number showcmd hlsearch incsearch
syntax on
nnoremap <silent> <C-t> :tabnew<CR>

" netrw - built in file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 4
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide = 1
set autochdir
map <silent> <C-f> :Lexplore<CR>

" Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set noshowmode

" YCM
set completeopt+=popup
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['~/Code/*']
nnoremap <C-d> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-g> :YcmCompleter GoTo<CR>
imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)

" YCM Semantic Syntax Highlighting
" let g:ycm_enable_semantic_highlighting = 1
let MY_YCM_HIGHLIGHT_GROUP = {
      \   'typeParameter': 'PreProc',
      \   'macro': 'Macro',
      \   'variable': 'Normal',
      \   'parameter': 'Normal',
      \   'property': 'Identifier',
      \   'enumMember': 'Identifier',
      \   'member': 'Identifier',
      \   'method': 'Function',
      \   'class': 'Constant',
      \   'namespace': 'Special',
      \ }

for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
  call prop_type_add( 'YCM_HL_' . tokenType,
                    \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
endfor

"AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairsMultilineClose = 0
let g:AutoPairsCompleteOnlyOnSpace = 1

"ALE
let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = '-m pylint --errors-only'
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_mypy_executable = 'python3'
let g:ale_python_mypy_options = '-m mypy'
let g:ale_linters = {'python': ['pylint', 'flake8', 'mypy']}
let g:ale_linters_explicit = 1

" CtrlP
nnoremap <C-p> :CtrlP<CR>

" Git grep
command -nargs=1 Find execute "Gitgrep " <q-args> " -- :/"

"Syntax file
let g:cpp_member_highlight = 1
let g:cpp_attributes_highlight = 1
