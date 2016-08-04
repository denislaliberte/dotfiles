"general options
syntax on
set nocompatible
set ruler
set relativenumber
let mapleader = ","
set softtabstop=2 
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set number

"https://github.com/junegunn/vim-plug/wiki/faq#migrating-from-other-plugin-managers
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
    exec "set listchars=tab:\uB7\uB7,trail:\uB7,nbsp:~"
    set list
    "to work with tab terrorists todo switch in a function
    "set noet ci pi sts=0 sw=4 ts=4

"=====[ Highlight matches when jumping to next ]=============
" This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>
" briefly hide everything except the match...
    function! HLNext (blinktime)
        highlight BlackOnBlack ctermfg=black ctermbg=black
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let hide_pat = '\%<'.lnum.'l.'
                \ . '\|'
                \ . '\%'.lnum.'l\%<'.col.'v.'
                \ . '\|'
                \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
                \ . '\|'
                \ . '\%>'.lnum.'l.'
        let ring = matchadd('BlackOnBlack', hide_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction

"====[ VIM-Plug setup ]======
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'plasticboy/vim-markdown',  {'rtp': 'vim/'}
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'itspriddle/vim-jquery'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'ingydotnet/yaml-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'bigfish/vim-js-context-coloring'
Plug 'Valloric/YouCompleteMe'
Plug 'easymotion/vim-easymotion'

call plug#end()

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {'mode': 'passive'}

"utilssnip config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

autocmd BufEnter *.md set spell

let g:languagetool_jar='/home/dlaliberte/.vim/LanguageTool-3.4/languagetool-commandline.jar'

"macro
let @x='$xj'
