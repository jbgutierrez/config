" General settings{{{
" load vimplug managed plugins{{{
" set rtp+=~/.vim/plugged/vim-plug/
" plugin manager plugin (https://github.com/junegunn/vim-plug)
" automatically install vim-plug
" thanks: https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  !mkdir -p ~/.vim/autoload/
  !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'SirVer/ultisnips'
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'bcaccinolo/bclose'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ciaranm/detectindent'
" Plug 'duff/vim-scratch'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'editorconfig/editorconfig-vim'
Plug 'einars/js-beautify'
Plug 'elzr/vim-json'
" Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'greyblake/vim-preview'
Plug 'honza/vim-snippets'
" Plug 'isRuslan/vim-es6'
Plug 'jbgutierrez/vim-babel'
Plug 'jbgutierrez/vim-cloud-buffer'
Plug 'jbgutierrez/vim-gtd'
Plug 'jbgutierrez/vim-partial'
Plug 'jelera/vim-javascript-syntax'
Plug 'jimmyhchan/dustjs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user'
Plug 'karlbright/qfdo.vim'
" Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'nixon/vim-vmath'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
" Plug 'skammer/vim-css-color'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vividchalk'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-scripts/Align'
" Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/matchit.zip'
" Plug 'walm/jshint.vim'

" Add plugins to &runtimepath
call plug#end()

"}}}
" general configuration {{{
set nocompatible        " Use Vim defaults (much better!)
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set virtualedit=all     "allows the cursor to freely roam anywhere it likes in command mode
set viminfo='20,<50,s10 " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=1000        " keep 100 lines of command line history
set undolevels=1000     " keep last 1000 undo changes
set ruler               " show the cursor position all the time
set number              " show line numbers
set relativenumber      " show line numbers relative to the current line
set scrolloff=10        " leave 10 lines of breathing room
set title               " show title
set hidden              " allows changing of buffers without saving
set lazyredraw          " Set lazydraws so that rendering is much faster during macros
set showmode            " I like to know which mode I am in at times
set showcmd             " show the command being typed
set showmatch           " show matching brackets
set matchtime=0         " don't blick when matching"
set list                " show whitespace
set listchars=tab:▸\ ,eol:¬,trail:.  "use the same symbols as TextMate for tabstops and EOLs
set hidden
set statusline=%F%m%r%h%w[%L]%y[%p%%][%04l,%04v]%=[%{&ff},%{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"} "[%{fugitive#statusline()}]
"              | | | | |  |   |  |       |    |
"              | | | | |  |   |  |       |    + current column
"              | | | | |  |   |  |       +-- current line
"              | | | | |  |   |  +-- current % into file
"              | | | | |  |   +-- current syntax in square brackets
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the rbuffer
"}


set nrformats=            " make CTRL-A and CTRL-X commands work exclusively with decimals
set laststatus=2          " always show the last status
set wildignore+=*.bak,*.cd,*.dll,*.doc,*.exe,*.gif,*.jpg,*.o,*.obj,*.png,*.pyc,*.xls,.tmp,bower_components,node_modules,tmp,vendor,builds,nosync
set wildmode=list:longest " turn on wild mode huge list
set complete-=i           " don't need to scan included files
set wildmenu              " turn on command line completion wild style"}}}
" tabs and indentation{{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround     " round indent to multiple of 'shiftwidth'
set smartindent    " use smart indentation over autoindent
set smarttab       " smart tabulatin and backspace
set expandtab      " To spaces to tabs 'set noexpandtab' and ':retab!'
"}}}
" search{{{
" set gdefault           " global search/replace by default
set incsearch hlsearch " highlight matches as you type
set smartcase          " override ignorecase when there are uppercase characters
set ignorecase         " ignore case when searching "}}}
" wraping{{{
set textwidth=80
set colorcolumn=85
" formatting lines {{{
set formatoptions=tqw " See the help under formatoptions for details
set formatoptions+=n  " Recognize numbered lists
set formatoptions+=2  " Use indent from 2nd line of a paragraph
set formatoptions+=l  " Don't break lines that are already long
set formatoptions+=1  " Break before 1-letter words
set formatoptions+=j  " Delete comment character when joining commented lines, so two lines of comment becomes one line when joining, without comment mark.
"}}}
call matchadd('ColorColumn', '\%81v', 100)
set nowrap                   " don't wrap lines
set listchars+=extends:»     " show a » when a line goes off the right edge of the screen
set listchars+=precedes:«    " show a « when a line goes off the left edge of the screen
set linebreak                " when wrapping, try to break at characters in breakat
set breakat=\ ^I!@*-+;:,./?  " when wrapping, break at these characters
set showbreak=>              " character to show that a line is wrapped"}}}
" encoding and fileformat{{{
set enc=utf-8 nobomb
set fileformats+=mac
" set enc=iso-8859-1"}}}
" spell checking{{{
set spell spelllang=en " Z= to show suggestions and zg to add words to the dictionary
augroup spell
  au!
  au FileType markdown,gitcommit,text,mail setlocal spell | setlocal spelllang=es  " spellcheck these files by default
augroup END
set spellsuggest=5"}}}
" file backups{{{
set nobackup      " Don't make a backup before overwriting a file.
set nowritebackup " And again.
set undofile      " Save undo tree among sessions
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp"}}}
" UI settings{{{

"improve autocomplete menu color
"gui options
set guifont=Monaco:h12.00
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=R

function! TweekColorScheme()
  " tweek default highlighting groups (:help highlight-groups)
  hi Pmenu        ctermbg=238
  " hi DiffAdd      ctermbg=151
  " hi DiffChange   ctermbg=187
  " hi DiffDelete   ctermbg=181
  " hi DiffText     ctermbg=187
  " hi DiffText     ctermfg=208
  " hi DiffText     ctermfg=166
  hi Folded       cterm=bold cterm=bold
  hi ColorColumn ctermfg=0 ctermbg=1 guifg=White guibg=Red
  " ShowMarks support, better looking SignColumn
  hi clear SignColumn
  hi link ShowMarksHLl DiffAdd
  hi link ShowMarksHLu DiffChange
endfunction

if !has('nvim')
  set term=screen-256color
endif

set background=dark
if $ITERM_PROFILE == 'Solarized Light' | set background=light | endif
hi clear
syntax reset
au! ColorScheme * call TweekColorScheme()
let g:solarized_termtrans = 1
let g:colors_name = 'solarized' " check colorschemes at http://bytefluent.com/vivify/

set nospell
set cursorcolumn
set clipboard+=unnamed "accessing the system clipboard
"}}}
" mswin settings{{{
if has('win32') || has ('win64')
  so $VIMRUNTIME/mswin.vim
  behave mswin
  set ffs=dos
  let $VIMHOME='~/vimfiles'
else
  set ffs+=mac
  let $VIMHOME='~/.vim'
endif
"}}}
"}}}

" Coding settings{{{
" general{{{
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby
set timeoutlen=500    " Shorten default keystoke waiting time
" Auto save folds
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview"}}}
" never see ^M again! (DOS text files, <c-v> <c-m>) {{{
" au BufRead * silent! %s//\r/g
" alternative:
"   find . -name "*.rb" | xargs file | grep "CRLF" | awk -F: '{print $1}' | xargs gvim
"   bufdo set ff=unix | w
"}}}
" folding{{{
set foldlevel=1
set foldmethod=syntax
set foldnestmax=3
set fillchars=fold:\ "
set foldtext=MyFoldText() " Custom fold text function
function! MyFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction
"}}}
" .vimrc{{{
" When vimrc is edited, reload it
augroup vimrc
  au!
  au BufWritePost $MYVIMRC source %
  au BufRead,BufWritePost $MYVIMRC set foldmethod=marker
augroup END
" Open vim help for word under cursor
au FileType vim setlocal keywordprg=:help
"}}}
" ruby{{{
augroup RubyAuto
  function! RubyFileType()
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_rails = 1
    let g:rubycomplete_classes_in_global = 1

    let b:start = executable('pry') ? 'pry -r "%:p"' : 'irb -r "%:p"' |
    if expand('%') =~# '_test\.rb$' |
      let b:dispatch = 'testrb %' |
    elseif expand('%') =~# '_spec\.rb$' |
      let b:dispatch = 'rspec %' |
    elseif !exists('b:dispatch') |
      let b:dispatch = 'ruby -wc %' |
    endif

    " add shebang and magic headers to ruby files {{{
    function! AddRubyHeaders()
      let header = [ '#!/usr/bin/env ruby', '# coding: UTF-8', '$DEBUG = true', '' ]
      call append(0, header)
    endfunction
    nnoremap <buffer> <leader>m :call AddRubyHeaders()<cr>
    "}}}
    " rcodetools gem configuration {{{
    " plain annotations
    " Annotate the full buffer
    nmap <silent> <F1> mzggVG!xmpfilter -a<cr>'z
    imap <silent> <F1> <ESC><F1>

    " Add # => markers
    vmap <silent> <F2> !xmpfilter -m<cr>
    nmap <silent> <F2> V<F2>
    imap <silent> <F2> <ESC><F2>a
    nmap <silent> <leader>r !xmpfilter -m<cr>

    " Remove # => markers
    vmap <silent> <F3> ms:call RemoveRubyEval()<cr>
    nmap <silent> <F3> V<F3>
    imap <silent> <F3> <ESC><F3>a
    nmap <silent> <leader>R ms:call RemoveRubyEval()<cr>

    map <silent> <F4> !xmpfilter -a<cr>
    nmap <silent> <F4> V<F4>
    imap <silent> <F4> <ESC><F4>a

    function! RemoveRubyEval() range
      let begv = a:firstline
      let endv = a:lastline
      normal Hmt
      set lz
      execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
      normal 'tzt`s
      set nolz
      redraw
    endfunction"}}}

  endfunction

  au!
  au FileType ruby let g:surround_{char2nr("#")} = "#{\r}"
  au FileType ruby,eruby call RubyFileType()
augroup END
"}}}
" elixir {{{
au! BufWritePost *test.exs :!mix test
"}}}
" XML{{{
au! FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
let g:xml_syntax_folding=1
"}}}
" Java{{{
au! FileType java setlocal foldmethod=syntax
"}}}
" haml{{{
au! BufRead,BufNewFile *.haml set filetype=haml
"}}}
" css{{{
augroup css
  au!
  au FileType css setlocal foldmethod=marker
  au FileType css setlocal foldmarker={,}
  au FileType css inoremap <buffer> :<space> : ;<left>
augroup END
" Sort CSS properties alphabetically
com! SortCss :g#\({\n\)\@<=#.,/}/sort
" au FileType css inoremap <buffer> <space><space>
"}}}
" javascript {{{
augroup javascript
  au!
  au FileType javascript let g:surround_{char2nr("$")} = "${\r}"
  au FileType javascript inoremap <buffer> :f : function(){<esc>o<cr>},<esc>ki<tab>
  au FileType javascript inoremap <buffer> :<space> : ,<left>
  au FileType javascript inoremap <buffer> f<tab> <esc>:AutoCloseOff<cr>afunction(){  }<left><esc>:AutoCloseOn<cr>i
  au FileType javascript inoremap <buffer> ;; <esc>ma$a;<esc>`aa
augroup END
"}}}
" diff{{{
augroup diff
  au!
  au FileType diff setlocal fdm=expr
  au FileType diff setlocal fde=DiffFoldLevel()
  au FileType diff setlocal fdc=1
  au FileType diff setlocal foldlevel=0
  au BufReadPost {COMMIT_EDITMSG,*/COMMIT_EDITMSG} set ft=gitcommit
augroup END
"}}}
" coffescript{{{
let coffee_compile_on_save = 0
augroup coffee
  au!
  au FileType coffee let g:surround_{char2nr("#")} = "#{\r}"
  au FileType coffee nnoremap <buffer> <leader>l :normal ysiw#<cr>
  au FileType coffee vmap <buffer> <leader>l S#
  au FileType coffee nnoremap <buffer> <leader>' :normal ysiw'<cr>
  au FileType coffee nnoremap <buffer> <leader>" :normal ysiw"<cr>
  au FileType coffee nnoremap <buffer> <leader>"" :normal cs'"<cr>
  au FileType coffee nnoremap <buffer> <leader>'' :normal cs"'<cr>
  " au BufWritePost *.coffee silent CoffeeCompile -b | cwindow | redraw!
  " au BufWritePost,FileWritePost *.coffee :silent !coffee -c <afile>
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
augroup END
":[RANGE] CoffeeCompile [watch|unwatch] [vert[ical]] [WINDOW-SIZE]
"}}}
" json {{{
augroup json
  au!
  au BufNewFile,BufReadPost *.json  set filetype=json | :NoMatchParen
  au FileType setl noshowmatch nohlsearch nocursorcolumn norelativenumber nocursorline nowrap synmaxcol=100
augroup END
" foldmethod=syntax formatoptions=tcq2l
"}}}
" file types that require explicit tabs, and not spaces{{{
augroup TabbedFileTypes
  au!
  au FileType make   setlocal noexpandtab
  au FileType python setlocal tabstop=8 shiftwidth=4 softtabstop=4 expandtab
augroup END
"}}}
" load templates{{{
au! BufNewFile * exe "silent! 0r $VIMHOME/templates/".&ft.".tpl"
"}}}
" jumps to the last known position in a file just after opening it, if the '" mark is set: > {{{
au! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"}}}
" show extra whitespace as error {{{
augroup WhitespaceMatch
  au!
  hi ExtraWhitespace ctermbg=red guibg=red
  au BufWinEnter * let w:whitespace_match_number = matchadd('ExtraWhitespace', '\s\+$')
  au InsertEnter * call s:ToggleWhitespaceMatch('i')
  au InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END

function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction
"}}}
" open any file with a pre-existing swapfile in readonly mode"{{{
augroup NoSimultaneousEdits
  au!
  au SwapExists * let v:swapchoice = 'o'
  au SwapExists * echohl ErrorMsg
  au SwapExists * echo 'Duplicate edit session (readonly)'
  au SwapExists * echohl None
  au SwapExists * sleep 2
augroup END
"}}}
" operation pending motion for parenthesis{{{
onoremap p :<c-u>normal! t)vi(<cr>
"}}}
" highlight current cursor position {{{
augroup HighlightCursor
  au!
  au WinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END
"}}}
"}}}

" Key mappings{{{
" general{{{
let mapleader = ","
nnoremap <s-u> :redo<CR>            " redo
nnoremap <leader>l :set list!<CR>   " shortcut to rapidly toggle `set list` (retab! if neccesary)
noremap <leader>e :e $MYVIMRC<cr>   " fast editing of the .vimrc
"}}}
" can't be bothered to understand ESC vs <c-c> in insert mode (http://vim.wikia.com/wiki/Avoid_the_escape_key) {{{
inoremap <c-c> <esc>
inoremap ii <Esc> " press i to enter insert mode, and ii to exit.
inoremap <esc> <nop>
"}}}
" make Y behave like C and D {{{
nnoremap Y y$
"}}}
" moving around split windows{{{
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
"}}}
" change working directory{{{
nnoremap <silent>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent>lcd :lcd %:p:h<CR>:pwd<CR>
"}}}
" easy expansion of the Active File Directory {{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"}}}
" move text around{{{
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv
vnoremap <c-j> :m'>+<cr>gv=gv
" nnoremap <c-j> :m+<cr> " incompatible with tmux_navigator
vnoremap <c-k> :m-2<cr>gv=gv
" nnoremap <c-k> :m-2<cr> "incompatible with tmux_navigator
"}}}
" tmux_navigator custom bindings {{{
if has('nvim')
  nmap <bs> :TmuxNavigateLeft<CR>
endif
"}}}
" shortcuts for rails commands{{{
" noremap <leader>m :rmodel
" noremap <leader>c :rcontroller
" noremap <leader>v :rview
" noremap <leader>u :runittest
" noremap <leader>f :rfunctionaltest
" noremap <leader>tm :rtmodel
" noremap <leader>tc :rtcontroller
" noremap <leader>tv :rtview
" noremap <leader>tu :rtunittest
" noremap <leader>tf :rtfunctionaltest
" noremap <leader>sm :rsmodel
" noremap <leader>sc :rscontroller
" noremap <leader>sv :rsview
" noremap <leader>su :rsunittest
" noremap <leader>sf :rsfunctionaltest
"}}}
" folding with space{{{
nnoremap <space> za    " space - toggle current fold
nnoremap <s-space> @=((foldclosed('.') == -1) ? 'za' : 'zA')<CR>
"}}}
" evaluate unicode code points {{{
nnoremap <leader>! :%s#\\u[0-9a-f]*#\=eval('"'.submatch(0).'"')#eg<cr>
"}}}
" common alignment habits {{{
nnoremap <leader>a\| :Tab /\|<CR>
vnoremap <leader>a\| :Tab /\|<CR>
nnoremap <Leader>a= :Tab /=<CR>
vnoremap <Leader>a= :Tab /=<CR>
nnoremap <Leader>a: :Tab /:\zs<CR>
vnoremap <Leader>a: :Tab /:\zs<CR>
"}}}
" rotating among results in the quickfix window {{{
noremap <c-n> :cn<CR>
noremap <c-p> :cp<CR>
"}}}
" visual select last inserted text {{{
noremap gV `[v`]
"}}}
" replace selected text{{{
vnoremap <c-r> "9y:%S/<c-r>"//gc<left><left><left>
noremap <leader>r :%S/<c-r><c-w>//gc<left><left><left>
"}}}
" replace text with current register without droping it{{{
vnoremap s "_dP
nnoremap s "_diw"0P
"}}}
" select in visual mode last inserted text {{{
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"}}}
" upcase/downcase last inserted word without leaving insert mode{{{
inoremap <c-u> <esc>viwUea
inoremap <c-d> <esc>viwuea
"}}}
" upcase/downcase current word in normal mode{{{
nnoremap <leader>u viwU
nnoremap <leader>d viwu
"}}}
" fix the & command {{{
nnoremap & :&&<CR>
xnoremap & :&&<CR>
"}}}
" always add the current file's directory to the path and tags list if not {{{
" already there. add it to the beginning to speed up searches.
let s:default_path = escape(&path, '\ ') " store default value of 'path'
au BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path
"}}}
" faster grepping with ag {{{
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c:%m
command! TODOS :grep '\b(idea\|fix\|workaround\|fixme\|note\|todo\|optimize\|hack\|review\|refactor\|xxx)\b' -i --ignore=*.json
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"}}}
" adds custom Todo keywords {{{
au FileType *
      \ for language in [ 'coffee', 'css', 'elixir', 'erlang', 'javaScript', 'java', 'javascript', 'less', 'python', 'ruby', 'sass' ] |
      \   exe "syn keyword ".language."Todo IDEA FIXME NOTE TODO OPTIMIZE HACK REVIEW REFACTOR XXX contained" |
      \ endfor
"}}}
" search for selected text, forwards or backwards {{{
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
"}}}
" switch between buffers{{{
nnoremap <A-tab> :bn<CR>
nnoremap <A-S-tab> :bp<CR>
nnoremap <leader>d :Bclose<CR>
nnoremap <leader>D :bufdo bd<CR>
nnoremap <leader><leader> :b#<CR>
"}}}
" make search results appear in the middle of the screen{{{
nnoremap n :set hlsearch<cr>nzz
nnoremap N :set hlsearch<cr>Nzz
nnoremap * :set hlsearch<cr>*zz
nnoremap # :set hlsearch<cr>#zz
nnoremap g* :set hlsearch<cr>g*zz
nnoremap g# :set hlsearch<cr>g#zz
"}}}
" remap Backtick {{{
nnoremap ' `
nnoremap ` '
"}}}
" start an external command with a single bang {{{
nnoremap ! :!
"}}}
" allow easy navigation between wrapped lines. {{{
vmap j gj
vmap k gk
nmap j gj
nmap k gk
"}}}
" testing one-off scripts and markup files {{{
let ft_stdout_mappings = {
      \'applescript': 'osascript',
      \'bash': 'bash',
      \'bc': 'bc',
      \'haskell': 'runghc',
      \'javascript': 'node',
      \'lisp': 'sbcl',
      \'nodejs': 'node',
      \'ocaml': 'ocaml',
      \'perl': 'perl',
      \'php': 'php',
      \'python': 'python',
      \'ruby': 'ruby',
      \'scheme': 'scheme',
      \'sh': 'sh',
      \'sml': 'sml',
      \'spice': 'ngspice'
      \}
for ft_name in keys(ft_stdout_mappings)
  execute 'au Filetype ' . ft_name . ' nnoremap <buffer> <c-e> :write !'
        \. ft_stdout_mappings[ft_name] . '<CR>'
endfor

let ft_execute_mappings = {
      \'c': 'gcc -o %:r -Wall -std=c99 % && ./%:r',
      \'cpp': 'xcrun g++ % -o %:r && ./%:r',
      \'java': 'javac % && java %:r',
      \'coffee': 'coffee %',
      \'erlang': 'escript %',
      \'pascal': 'fpc % && ./%:r'
      \}
for ft_name in keys(ft_execute_mappings)
  execute 'au FileType ' . ft_name
        \. ' nnoremap <buffer> <C-e> :write \| !'
        \. ft_execute_mappings[ft_name] . '<CR>'
endfor
nmap <c-e> :Preview<CR>
"}}}
" resize stacked windows {{{
au BufEnter * :wincmd _
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>
set winheight=4
set winminwidth=4
set winminheight=4
"}}}
" allow saving of files as sudo when I forgot to start vim using sudo. {{{
cmap w!! w !sudo tee > /dev/null %
"}}}
"}}}

" plugins settings{{{
" Airline {{{
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse = 1
"}}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='💩'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_warning_symbol='❗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_warning_symbol='😢'
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
"}}}
" Tag List{{{
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen = 1      " Focus on the taglist when its toggled
let Tlist_Close_On_Select = 1              " Close when something's selected
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Use_Right_Window = 1             " Project uses the left window
let Tlist_WinWidth = 50
" Language Specifics"{{{
    " just functions and classes please
    let tlist_aspjscript_settings = 'asp;f:function;c:class'
    " just functions and subs please
    let tlist_aspvbs_settings = 'asp;f:function;s:sub'
    " don't show variables in freaking php
    let tlist_php_settings = 'php;c:class;d:constant;f:function'
    " just functions and classes please
    let tlist_vb_settings = 'asp;f:function;c:class'
"}}}
"}}}
" ToogleScratch{{{
function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction
"}}}
" JsBeautify {{{
au FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"}}}
" Fugitive {{{
au BufReadPost fugitive://* set bufhidden=delete
nmap <leader>s :Gstatus<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>ca :Gcommit --amend --reuse-message=HEAD<CR>
nmap <leader>l :Glog<CR>
"}}}
" Gitv {{{
let g:Gitv_OpenHorizontal=1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
"}}}
" Gist {{{
let g:gist_clip_command = 'pbcopy'
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1
let g:gist_get_multiplefile = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
map <leader>p :Gist -c<CR>
"}}}
" SplitJoin {{{
let g:splitjoin_split_mapping = 'gS'
let g:splitjoin_join_mapping  = 'gJ'
"}}}
" VimMath {{{
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++"}}}
" Surround {{{
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
"}}}
" Rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightgray', 'darkblue', 'darkmagenta', 'darkcyan'],
\   'operators': '_,_',
\   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\}
"}}}
" CtrlP replacement{{{
set rtp+=/usr/local/opt/fzf
imap <c-x><c-l> <plug>(fzf-complete-line)
nno <leader>t :let $FZF_DEFAULT_COMMAND='ag -g ""'<cr>:FZF<cr>
nno <leader><leader>t :let $FZF_DEFAULT_COMMAND='ag -u -g ""'<cr>:FZF<cr>
"}}}
" Unimpaired {{{
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]
"}}}
" DetectIndent {{{
" guess indent from buffer {{{
let g:detectindent_preferred_indent=2
au BufReadPost * :DetectIndent
"}}}
"}}}
" ExtractPartial {{{
let g:extract_partials_templates = {
      \ 'coffee': 'coffee %'
      \ }
"}}}
" vim-jsx {{{
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" }}}
" Goyo {{{
function! <sid>writer()
  :Goyo 60%
  setlocal listchars-=eol:¬
  setlocal nocursorcolumn
  setlocal spell
  setlocal spelllang=es
  setlocal wrap
  setlocal showbreak=
  setlocal nolist
endfunction

command! Writer :call s:writer()
"}}}
" UltiSnips {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"}}}
" Vimwiki {{{
let wiki = {'path': '/Volumes/SanDisk/ownbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'bash': 'sh', 'coffee': 'coffee', 'ruby': 'ruby', 'javascript': 'javascript'}
let g:vimwiki_list = [wiki]
au Syntax vimwiki
let g:vimwiki_rxHeader = '^\s*\s*\(#\{1,6}\|title: \)\zs[^#].*\ze$'
function! s:InlineLink()
  let url = expand('<cWORD>')
  let expr = 'curl -q -ks '.url.' | pup "title text{}"'
  let title = system(expr)[:-2]
  let repl = '['. title . '](' .url.')'
  let newline = substitute(getline('.'), url, repl ,'g')
  call setline('.', newline)
endfunction
command! InlineLink :silent call <SID>InlineLink()
"}}}
"}}}

" custom utility commands {{{
" share highlighted code{{{
function! ShareCode(first,last)
  " let g:html_number_lines = 1
  " let g:html_diff_one_file = 1
  let name = expand("%:p:t").".html"
  exe ":".a:first.",".a:last."TOhtml"
  exe ":w! /tmp/".name
  bd!
  silent exe ":!open -a Safari /tmp/".name
endfunction

command! -range=% ShareCode :call ShareCode(<line1>, <line2>)"}}}
" see changes since the file was loaded{{{
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"}}}
" open a split for each dirty file in git {{{
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
"}}}
" export Fremind mindmap to text{{{
command! FremindToText call FremindToTextFunction()
function! FreemindToTextFunction()
  silent! normal djGddgg
  silent! set ft=xml
  silent! set tw=80
  silent! set ft=
  silent! %s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/
  silent! v/^\s*-/d
  silent! call Entities()
  silent! normal gggqG
  silent! g/^-/s/- //
  silent! g/^\w/t.|s/./=/g
  silent! %s/^\s{4}//
  silent! %s/^-/o/
  silent! g/^\s*-/normal 0
  silent! g/^\s\{8}\zs-/#/
  silent! normal gg
endfunction

command! Entities :call Entities()
function! Entities()
  silent %s/$$/$/eg
  silent %s/&#160;/ /eg
  silent %s/&#38;/&/eg
  silent %s/&#39;/'/eg
  silent %s/&#60;/</eg
  silent %s/&#62;/>/eg
  silent %s/&#xAB;/'/eg
  silent %s/&#xBA;/º/eg
  silent %s/&#xBB;/'/eg
  silent %s/&#xBF;/¿/eg
  silent %s/&#xE1;/á/eg
  silent %s/&#xE7;/ç/eg
  silent %s/&#xE9;/é/eg
  silent %s/&#xED;/í/eg
  silent %s/&#xF1;/ñ/eg
  silent %s/&#xF3;/ó/eg
  silent %s/&#xFA;/ú/eg
  silent %s/&quot;/"/eg
  silent %s/\&AElig;/Æ/eg
  silent %s/\&Aacute;/Á/eg
  silent %s/\&Acirc;/Â/eg
  silent %s/\&Agrave;/À/eg
  silent %s/\&Aring;/Å/eg
  silent %s/\&Atilde;/Ã/eg
  silent %s/\&Auml;/Ä/eg
  silent %s/\&Ccedil;/Ç/eg
  silent %s/\&ETH;/Ð/eg
  silent %s/\&Eacute;/É/eg
  silent %s/\&Ecirc;/Ê/eg
  silent %s/\&Egrave;/È/eg
  silent %s/\&Euml;/Ë/eg
  silent %s/\&Iacute;/Í/eg
  silent %s/\&Icirc;/Î/eg
  silent %s/\&Igrave;/Ì/eg
  silent %s/\&Iuml;/Ï/eg
  silent %s/\&Ntilde;/Ñ/eg
  silent %s/\&Oacute;/Ó/eg
  silent %s/\&Ocirc;/Ô/eg
  silent %s/\&Ograve;/Ò/eg
  silent %s/\&Oslash;/Ø/eg
  silent %s/\&Otilde;/Õ/eg
  silent %s/\&Ouml;/Ö/eg
  silent %s/\&THORN;/Þ/eg
  silent %s/\&Uacute;/Ú/eg
  silent %s/\&Ucirc;/Û/eg
  silent %s/\&Ugrave;/Ù/eg
  silent %s/\&Uuml;/Ü/eg
  silent %s/\&Yacute;/Ý/eg
  silent %s/\&aacute;/á/eg
  silent %s/\&acirc;/â/eg
  silent %s/\&aelig;/æ/eg
  silent %s/\&agrave;/à/eg
  silent %s/\&aring;/å/eg
  silent %s/\&atilde;/ã/eg
  silent %s/\&auml;/ä/eg
  silent %s/\&ccedil;/ç/eg
  silent %s/\&eacute;/é/eg
  silent %s/\&ecirc;/ê/eg
  silent %s/\&egrave;/è/eg
  silent %s/\&eth;/ð/eg
  silent %s/\&euml;/ë/eg
  silent %s/\&iacute;/í/eg
  silent %s/\&icirc;/î/eg
  silent %s/\&igrave;/ì/eg
  silent %s/\&iuml;/ï/eg
  silent %s/\&ntilde;/ñ/eg
  silent %s/\&oacute;/ó/eg
  silent %s/\&ocirc;/ô/eg
  silent %s/\&ograve;/ò/eg
  silent %s/\&oslash;/ø/eg
  silent %s/\&otilde;/õ/eg
  silent %s/\&ouml;/ö/eg
  silent %s/\&szlig;/ß/eg
  silent %s/\&thorn;/þ/eg
  silent %s/\&uacute;/ú/eg
  silent %s/\&ucirc;/û/eg
  silent %s/\&ugrave;/ù/eg
  silent %s/\&uuml;/ü/eg
  silent %s/\&yacute;/ý/eg
  silent %s/\&yuml;/ÿ/eg
endfunction"}}}
" preserve{{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction"}}}
" get fold level for diff mode {{{
" Works with normal, context, unified, rcs, ed, subversion and git diffs.
" For rcs diffs, folds only files (rcs has no hunks in the common sense)
" fdl=1 ==> file
" fld=2 ==> hunk
" context diffs need special treatment, as hunks are defined
" via context (after '***************'); checking for '*** '
" or ('--- ') only does not work, as the file lines have the
" same marker.
" Inspired by Tim Chase.
function! DiffFoldLevel()
  let l:line=getline(v:lnum)

  if l:line =~# '^\(diff\|Index\)'	 " file
    return '>1'
  elseif l:line =~# '^\(@@\|\d\)'	 " hunk
    return '>2'
  elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$'	" context: file1
    return '>2'
  elseif l:line =~# '^--- \d\+,\d\+ ----$'	 " context: file2
    return '>2'
  else
    return '='
  endif
endfunction "}}}
" autoformat cucumber tables (from https://gist.github.com/287147) {{{
inoremap <silent>  <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction"}}}
" delete buffer without delete window {{{
function! Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
    endfor
    return list
endfunction

function! Bdeleteonly()
    let list = filter(Buflist(), 'v:val != bufname("%")')
    for buffer in list
        exec "bdelete ".buffer
    endfor
endfunction

command! BdelOnly :silent call Bdeleteonly()"}}}
" extract variable name{{{
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>
"}}}
" insert time{{{
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>
"}}}
" clean coffee{{{
function! CleanCoffee()
  " Save current position
  let cursor_position = getpos(".")

  " start at the last char in the file and wrap for the
  " first search to find match at start of file
  normal G$
  let pattern = " *var [^=]*;"
  let flags = "w"
  while search(pattern, flags) > 0
    let line = substitute(getline('.'), '\(var\|;\)', '', 'g')
    silent! normal dd
    let vars = split(line, '[ ,]', 1)
    " echo vars
    for var in vars
      if search('^ *' . var . ' =') > 0
        silent! normal ^ivar
        silent! normal G$
      endif
    endfor
  endwhile

  silent! %s/\vreturn +(.*[(=])/\1/

  " Restore caret position
  call setpos(".", cursor_position)
endfunction
"}}}
" asking for abreviations{{{
function! s:AbbrAsk(abbr,expansion)
  let answer = confirm("Use the abbreviation '" . a:abbr . "'?", "&Yes\n&No", 1)
  return answer == 1 ? a:expansion : a:abbr
endfunction
ia <expr> lorem <sid>AbbrAsk('lorem', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
"}}}
" generate doc comment template{{{
function! GenerateDOCComment()
  let l    = line('.')
  let i    = indent(l)
  let pre  = repeat(' ',i)
  let text = getline(l)
  let params   = matchstr(text,'([^)]*)')
  let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
  echomsg params
  let vars = []
  let m    = ' '
  let ml = matchlist(params,paramPat)
  while ml!=[]
    let [_,var;rest]= ml
    let vars += [pre.' * @param '.var]
    let ml = matchlist(rest,paramPat,0)
  endwhile
  let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
  call append(l-1,comment)
  call cursor(l+1,i+3)
endfunction
map <Leader>/ :call GenerateDOCComment()<cr>"}}}
" generate unicode table{{{
function! GenerateUnicode(first, last)
  let i = a:first
  while i <= a:last
    if (i%256 == 0)
      $put ='----------------------------------------------------'
      $put ='     0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F '
      $put ='----------------------------------------------------'
    endif
    let c = printf('%04X ', i)
    for j in range(16)
      let c = c . nr2char(i) . ' '
      let i += 1
    endfor
    $put =c
  endwhile
endfunction
"}}}
" compress scripts and css files{{{
let g:js_css_compress_enabled = 0
function! JsCssCompress(bang) abort
  if a:bang | let b:js_css_compress_enabled = 1 | end
  let enabled = exists("b:js_css_compress_enabled") ? b:js_css_compress_enabled : g:js_css_compress_enabled
  if !enabled | return | end

  let fileName = expand('<afile>:t')

  if fileName =~ '.min.'
    return
  end

  let fullPath = expand('<afile>:p')
  let extension = expand('<afile>:e')

  if extension == 'coffee'
    let expr = 'coffee -c '.expand('<afile>')
    cal system(expr)
    let extension = 'js'
  endif

  let partialName = expand('<afile>:t:r')
  let minFileName = partialName.".min.".extension
  let path = expand('<afile>:p:h')

  if extension == 'less'
    if executable('lessc')
      cal system( 'lessc '.path.'/'.partialName.'.'.extension.' &')
    endif
  else
    if extension == 'scss'
      let expr = 'scss '.shellescape(fullPath).' --compass --style=expanded '.path.'/'.partialName.'.css -C'
      let msg = system(expr)
      if v:shell_error
        echo 'could not compile '.fullPath.':'.msg
        return
      endif
      let extension = 'css'
    endif

    " if filewritable(path.'/'.minFileName)
    "   if extension == 'js' && executable('closure-compiler')
    "     cal system( 'closure-compiler --js '.fullPath.' > '.path.'/'.minFileName.' &')
    "   elseif executable('yuicompressor')
    "     cal system( 'yuicompressor '.fullPath.' > '.path.'/'.minFileName.' &')
    "   endif
    " endif

    let minFileName = partialName.".min.".extension
    let expr = 'java -jar ~/.bin/vendor/yuicompressor-2.4.8.jar '.path.'/'.partialName.'.'.extension.' > '.shellescape(path.'/'.minFileName).' &'
    cal system(expr)
    " let data = system(expr)
    " let lines = [data]
    " call writefile(lines, path.'/'.minFileName)
  endif
endfunction

au! FileWritePost,BufWritePost *.coffee :call JsCssCompress(0)
au! FileWritePost,BufWritePost *.js :call JsCssCompress(0)
au! FileWritePost,BufWritePost *.css :call JsCssCompress(0)
au! FileWritePost,BufWritePost *.scss :call JsCssCompress(0)

command! -nargs=? -bang JsCssCompress call JsCssCompress(<bang>0)
"}}}
" stringify html templates {{{
function! Stringify() range
  for linenum in range(a:firstline, a:lastline)
    let replaceSub = "'\\1'\ +"
    if a:lastline == linenum
      let replaceSub = "'\\1'"
    endif
    let newline = getline(linenum)
    " escape single quote
    " \\\\ is \
    " \= means previous char is optional
    let newline = substitute(newline, "\\\\\\='", "\\\\\\\'", 'g')
    " add single quotes and plus
    let newline = substitute(newline,'\(\S.*\)', replaceSub ,'g')
    call setline(linenum, newline)
  endfor
endfunction
vmap <leader>s :call Stringify()<CR>
"}}}
" extract variable name {{{
function! ExtractProperty()
  let a_save = @a
  try
    " Replace selected text with the variable name
    let properties_file = expand('%:r').'.properties'
    if filereadable(properties_file)
      normal! gv"ay
      let value       = @a
      let key         = substitute(value, ".*", "\\U\\0", "")
      let key         = substitute(key, '\W\+', "_", "g")
      if len(key) > 20
        let hash = system('md5 -qs '.key)
        let key = key[0:20-5]."_".hash[0:5]
      endif
      let key         = input("Key name: ", key)
      let replacement = "<%- t('" . key . "') %>"
      let language    = expand('%:r:e')
      let new_line    = [ key.'='.value ]

      let @a = replacement
      normal gv
      normal "_x"aP

      let lines=readfile(properties_file, 'b')
      if !empty(lines) && empty(lines[-1])
        call remove(lines, -1)
      endif
      call writefile(lines+new_line, properties_file, 'b')

    endif
  finally
    let @a = a_save
  endtry
endfunction
vnoremap <leader>t :call ExtractProperty()<cr>
"}}}
" strip trailing whitespace {{{
function! StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" au BufWritePre * :call StripTrailingWhitespaces()
"}}}
" squeeze multiple adjacent empty lines {{{
function! SqueezeMultipleAdjacentEmptyLines()
  %!cat -s
endfunction
"}}}
" insert timestamp {{{
command! Timestamp :normal a<c-r>=strftime('%F %H:%M:%S')<CR><esc>
"}}}
" copy file{{{
function! s:copy()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    redraw!
  endif
endfunction
command! Copy call s:copy()
"}}}
" JSONPretty {{{
command! JSONPretty %!python -m json.tool
"}}}
" Easily changing between Windows and POSIX file paths
" md2pdf {{{
command! Pdf silent exe "!md2pdf ".shellescape(expand("%",1))." ~/Desktop"
command! Mindmap :silent call s:mindmap()
"}}}
command! ToPosix :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>
command! ToWindows :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>
"}}}

" debugging hooks {{{
" load .vimrc or .vimrc.local project configs {{{
if filereadable($MYVIMRC . '.local') | exe 'source ' . $MYVIMRC . '.local' | endif
set exrc " Enable per-directory .vimrc files.
if filereadable('.vimrc.local') | source .vimrc.local | endif
"}}}
" profile slow code {{{
" vim --startuptime startuptime.log
command! StartProfile :profile start /tmp/profile.log | profile func * | profile file *<CR>
command! StopProfile :profile pause | e /tmp/profile.log
" }}}
" export mappings {{{
function! ExportMappings()
  redir! > vim_maps.txt
  map
  map!
  au
  au!
  redir END
endfunction
"}}}
" learn vim-script {{{
" :help vim-script-intro
"}}}
"}}}

set shell=zsh
