"general options
syntax on
set nocompatible
set ruler
set relativenumber
let mapleader = ","
set softtabstop=2 
set backspace=indent,eol,start
"set ic
"set hlsearch
"set expandtab
"set textwidth=79
"set tabstop=8
"set shiftwidth=4
"set autoindent
"set encoding=utf-8


"drupal configuration https://drupal.org/node/29325
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

"drupal Syntax highlighting https://drupal.org/node/29325
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

"drupal OmniCompletion  https://drupal.org/node/29325
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"ctags --langmap=php:.engine.inc.module.theme.install.php --php-kinds=cdfi --languages=php --recurse
":set tags=/path/to/your/ctags
"to use vim drupal setting only for drupal... add this to bashrc
"alias vid="vim -u ~/.vimrc-drupal"

"vundle	    https://github.com/gmarik/vundle
"filetype off           "require by vundle 
set rtp+=~/.vim/bundle/vundle/
"call pathogen#infect()
"call pathogen#helptags()
"call vundle#rc()
"Bundle 'gmarik/vundle'

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
"duplicate
"execute pathogen#infect()

"ruby https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
"Bundle 'vim-ruby/vim-ruby'
"rails
"Bundle 'tpope/vim-rails.git'
"Bundle 'thoughtbot/vim-rspec'
"Bundle 'tpope/vim-cucumber'

"Bundle 'tpope/vim-bundler'


"Bundle 'tpope/vim-surround'
"Bundle 'ervandew/supertab'
"Bundle 'tomtom/tcomment_vim'
"Bundle 'kchmck/vim-coffee-script'

"Bundle 'donnut/vim-php54-syntax'
"Bundle 'beberlei/vim-php-refactor'
"Bundle 'austintaylor/vim-commaobject'


"rspec
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>





"truck funky : http://www.youtube.com/watch?v=aHm36-na4-4
"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list

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

"====[ Swap : and ; to make colon commands easier to type ]======

    nnoremap  ;  :
    nnoremap  :  ;

"====[ toogle number, relativenumber ]======

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
