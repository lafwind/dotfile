"let $VIMRUNTIME="/home/lafwind/local/apps/Laf_gVim/share/vim/vim74"
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin


let mapleader = ","

sy on "syntax on
set laststatus=2
set history=10000
set go= "no toolbar and so on

filetyp on
filetype indent on
filetype plugin on

"Indent
set autoindent "自动缩进
set smartindent "只能缩进
set cindent

"Tab
set expandtab "use  4 spaces instead of tab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set esckeys " Allow cursor keys in insert mode.
set vb t_vb= " 不要响铃
au GUIEnter * set t_vb= " 不要闪屏
set showmatch
set ruler

"Search
set hlsearch
set incsearch
set showcmd

set ignorecase

set cursorline
"set textwidth=80
set colorcolumn=80
"set cursorcolumn
"set lines=21 columns=80
"set columns=80

"set list
"set listchars=tab:▸\ ,eol:¬,trail:-,extends:❯,precedes:❮
"set listchars=eol:¬


"set wrap "自动折行
set nowrap "不自动折行

set wildmenu
set wildmode=longest:full,full

"Paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set virtualedit=block

inoremap <C-S-V> <Esc>"+p
vnoremap <C-S-C> "+y


au VimResized * exe "normal! \<c-w>="

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

set guifont=CamingoCode\ 10 "Source\ Code\ Pro\ 8.99 "Inconsolata\ 12.9 Monaco\ 8.9 Anonymous\ Pro\ 10.99 monofur\ 11.9 DejaVu\ Sans\ Mono\ 10.6  Ubuntu\ Mono\ 10.9 Lucida\ Console\ 11.6  Meslo\ LG\ S\ 10.99 Cosmic\ Sans\ Neue\ Mono\ 9.9 hermit\ 9.66  Anonymous\ Pro\ 10.3 CamingoCode\ 10 Linux下面使用
"set linespace=3 " for Anonymous Pro
"set linespace=-2 " for Anonymous Pro
"set linespace=-2 " for Source Code Pro
"set linespace=-2 " for  hermit
"
"set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI "Windos下面使用
"set gfw=Microsoft_YaHei:h12:cGB2312
"set gfw=Microsoft_YaHei:h19:cGB18030
"set gfw=YaHei_Segoe_UI:h19:cBig5

set guioptions=+
if has('gui_running')
    " if strftime("%H") > 8 + 0
    "     colorscheme Lafwind_Day
    " else
    "     colorscheme Lafwind_Night
    " endif


    "colorscheme Lafwind_Day_Ver2
    "colorscheme Lafwind_Pink
    colorscheme Lafwind_Night
    "colorscheme Lafwind_Day
    "colorscheme Lafwind_Night_Ver2
    "colorscheme Lafwind_Night_Ver3
    "colorscheme Lafwind_Night_Ver4
    "colorscheme Lafwind_Night_Ver2_light
    "colorscheme Lafwind_Green
    "colorscheme Lafwind_Ocean
    "colorscheme molokai
else
    colorscheme Lafwind_Night_Term_Ver2
    "colorscheme Lafwind_Night_Term
    "colorscheme Lafwind_Day_Term
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enconding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
""set fencs=utf-8,cp936,gb18030,gbk,ucs-bom,shift-jis
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,cp936,default ""
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"language messages = zh_CH.utf-8
set t_Co=256
set backspace=eol,start,indent

""""""""""""""""""""""""""""""""""""""""""""""""
"Some setting about Number and Relative Number
""""""""""""""""""""""""""""""""""""""""""""""""
set number

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

""nnoremap <silent> <A-n> :call NumberToggle()<cr>

if has('gui_running')
    nnoremap <silent> <A-n> :call NumberToggle()<cr>
else
    nnoremap <silent> n :call NumberToggle()<cr>
endif

autocmd InsertEnter * :set number

"autocmd InsertLeave * :set relativenumber
"au FocusLost * :set number
"au FocusGained * :set relativenumber


""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle setup
""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

 " let Vundle manage Vundle
 " required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"


"Plugin 'taglist.vim'
"Plugin 'The-NERD-tree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" Plugin 'tpope/vim-vinegar'
" Plugin 'snipMate'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'javacomplete'
Plugin 'scrooloose/syntastic'
"Plugin 'Gundo'
"Plugin 'sjl/gundo.vim'
"Plugin 'octave.vim'
"Plugin 'instant-markdown.vim'
"Plugin 'suan/vim-instant-markdown'
Plugin 'clang-complete'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'VimIM'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'yueyoum/vim-linemovement'
"Plugin 'surround.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
"Plugin 'LargeFile'
"
Plugin 'godlygeek/tabular'

Plugin 'SirVer/ultisnips'
"Plugin 'drmingdrmer/xptemplate'

"Session"
"Plugin 'xolox/vim-session'
"Plugin 'xolox/vim-misc'


"File Searching
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Lokaltog/powerline'
Plugin 'szw/vim-ctrlspace'
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" Plugin 'ack.vim'
"Plugin 'unite.vim'

Plugin 'tomtom/tcomment_vim'


"Ruby and Rails"
Plugin 'vim-ruby/vim-ruby'
Plugin 'm2ym/rsense'
"Plugin 'rails.vim'
Plugin 'tpope/vim-rails'
"Plugin 'bundler'
Plugin 'tpope/vim-bundler'
Plugin 'slim-template/vim-slim'
""Plugin 'rubycomplete.vim'

"Rust"
Plugin 'wting/rust.vim'

"Elixir
Plugin 'elixir-lang/vim-elixir'

"Python
"Plugin 'Python-mode-klen'
Plugin 'klen/python-mode'
""Plugin 'Pydiction'
""Plugin 'pythoncomplete'

" JavaScript & CoffeeScript
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'michalliu/jsruntime.vim'

" HTML $ CSS
Plugin 'mattn/emmet-vim'
"Plugin 'bitfyre/vim-indent-html'
Plugin 'othree/html5.vim'

"Scheme & Racket
Plugin 'wlangstroth/vim-racket'


"Java doc
"Plugin 'davetron5000/java-javadoc-vim'

"Writting
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-markdown'

"vim starting
Plugin 'mhinz/vim-startify'

"Git
Plugin 'tpope/vim-fugitive'

 "Plugin 'bling/vim-airline'
 "Plugin 'vim-scripts/statusline.vim'
 "Plugin 'fuenor/vim-statusline'
 "Plugin 'millermedeiros/vim-statline'
 "Plugin 'TagHighlight' "highlight more
 "Plugin 'fcitx.vim'



 ""Plugin 'AutoComplPop' for eclim completion

 ""colorscheme
 "Plugin 'Solarized'
 "Plugin 'CSApprox'
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }


 "For Markdown Language
 "Plugin 'Markdown'

 "For python complete
 "required python2, both 2 and 3 is not
 "allowed .

 "For Latex
 "Plugin 'coot/atp_vim'
 "
 "Plugin 'millermedeiros/vim-statline'
 "Plugin 'statusline.vim'
 "Plugin 'Lokaltog/vim-powerline'
 "
 """"""""""""""""""""""""""""""""""""
 " Tutor Example
 " original repos on github
 " Plugin 'tpope/vim-fugitive'
 " Plugin 'Lokaltog/vim-easymotion'
 " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Plugin 'tpope/vim-rails.git'
 " vim-scripts repos
 " Plugin 'L9'
 " Plugin 'FuzzyFinder'
 " non github repos
 " Plugin 'git://git.wincent.com/command-t.git'
 " ...

 call vundle#end()
 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CTAGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set autochdir
"set tags=/home/lafwind/Source_Codes/tags
"let Tlist_Ctags_Cmd = 'C:\Windows\System32\ctags.exe'
"set tags=tags;
"set autochdir
"
set path=.,/usr/local/include,/usr/include,/home/lafwind/Source_Codes/**


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TagList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Tlist_Auto_Open = 1
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_Highlight_Tag_On_BufEnter = 0
" let Tlist_Show_One_File = 1
" let Tlist_Use_Right_Window = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeChDirMode=2
"let NERDTreeWinPos="right"

map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap gb ^
noremap ge $
vnoremap ge $h
noremap tn <Esc>:tabnew<CR>
""nmap <F5> bi{<Esc>ea}<Esc>
""imap <> <><Esc>i
"imap {} {}<Esc>i<CR><Esc><S-o>
imap {} {}<Esc>i
imap [] []<Esc>i
imap () ()<Esc>i
imap "" ""<Esc>i
imap '' ''<Esc>i
vmap g/ y/<c-r>"<cr>
nmap <Leader>w <Plug>VimwikiIndex
noremap <silent> <F8> <Esc>:NERDTreeToggle <cr>
" nnoremap <silent> <F9> :TlistToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

inoremap <C-e> <Esc><S-a>
inoremap <C-a> <Esc><S-i>
inoremap <C-w> <Esc>bvwc
inoremap <C-k> <Esc>lv$c

"noremap <C-b> <Left>
"noremap <C-n> <Down>
"noremap <C-p> <Up>
"noremap <C-f> <Right>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap th <Esc>:tabprevious<cr>
noremap tl <Esc>:tabnext<cr>
vnoremap ( c(<Esc>pa)
vnoremap [ c[<Esc>pa]
vnoremap { c{<Esc>pa}
vnoremap ," c"<Esc>pa"
vnoremap ,' c'<Esc>pa'

noremap <silent> mh :nohls<CR>
noremap ,v :e $MYVIMRC<CR>
noremap ,r :RestartVim<CR>

" noremap ,ls :Buffers<CR>
noremap ,ls :ls<CR>:e<Space>

iab xfile <c-r>=expand("%:t")<CR>

" Startify
noremap <silent>,ss :Startify<CR>


nnoremap <A-m> :mkview<CR>
nnoremap <A-l> :loadview<CR>
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
vnoremap <A-h> y/<C-R>=escape(@",'\\/.*$^~[]')<CR><CR>



"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


""if has('gui_running')
""    nnoremap <A-m> :mkview<CR>
""    nnoremap <A-l> :loadview<CR>
""    inoremap <A-h> <Left>
""    inoremap <A-j> <Down>
""    inoremap <A-k> <Up>
""    inoremap <A-l> <Right>
""    vnoremap <A-h> y/<C-R>=escape(@",'\\/.*$^~[]')<CR><CR>
""else
""    nnoremap m :mkview<CR>
""    nnoremap l :loadview<CR>
""    inoremap h <Left>
""    inoremap j <Down>
""    inoremap k <Up>
""    inoremap l <Right>
""    vnoremap h y/<C-R>=escape(@",'\\/.*$^~[]')<CR><CR>
""endif

"noremap : q:i
"cnoremap <Tab> <c-f>


cd /home/lafwind/projects

let g:bufExplorerSplitBelow=1        " Split new window below current.

let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.


set nocp
filetype plugin on
" map <F12> :!ctags -R --c++-kinds=+p --languages=c++ --fields=+iaS --extra=+q .<CR>
map <F12> :!ctags -R . && cscope -Rbq .<CR>
cs add cscope.out /home/lafwind/Projects/


""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""AutoCmd""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

"compile"
autocmd BufReadPre *.py nnoremap<buffer><F5> :w<CR>:set makeprg=python\ %<CR>:make<CR>
autocmd BufReadPre *.py nnoremap<buffer><F6> :w<CR>:set makeprg=python3\ %<CR>:make<CR>
autocmd BufReadPre *.cpp nnoremap<buffer><F5> :w<CR>:set makeprg=g++\ %\ -g\ -Wall\ -o\ %<<CR>:make<CR>
autocmd BufReadPre *.cpp nnoremap<buffer><F6> :w<CR>:!./%<<CR>
autocmd BufReadPre *.c nnoremap<buffer><F5> :w<CR>:set makeprg=gcc\ %\ -g\ -Wall\ -o\ %<<CR>:make<CR>
autocmd BufReadPre *.c nnoremap<buffer><F6> :w<CR>:!./%<<CR>
autocmd BufReadPre *.rb nnoremap<buffer><F5> :w<CR>:set makeprg=ruby\ %<CR>:make<CR>
autocmd BufReadPre *.java nnoremap<buffer><F5> :w<CR>:set makeprg=javac\ %<CR>:make<CR>
autocmd BufReadPre *.java nnoremap<buffer><F6> :w<CR>:!java -cp "%:p:h" "%:t:r"<CR>
autocmd BufReadPre *.js nnoremap<buffer><F5> :w<CR>:set makeprg=node\ %<CR>:make<CR>

""autocmd BufReadPre *.java nnoremap<buffer><F6> :w<CR>":!java\ %<<CR>
""autocmd FileType py nmap<buffer><F5> :w<CR>:set makeprg=python\ %<CR>:make<CR>
""autocmd FileType cpp nmap<buffer><F5> :w<CR>:set makeprg=g++\ %\ -g\ -Wall\ -o\ %<<CR>:make<CR>
""autocmd FileType cpp nmap<buffer><F6> :w<CR>:!./%<<CR>


"tabstop"
"autocmd BufReadPre *.py set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufFilePre *.py set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.py set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileReadPre *.py set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufReadPre *.rb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufFilePre *.rb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.rb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileReadPre *.rb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufReadPre *.ruby set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.ruby set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufReadPre *.erb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufFilePre *.erb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.erb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileReadPre *.erb set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufReadPre *.html set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufFilePre *.html set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.html set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileReadPre *.html set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufReadPre *.css set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufFilePre *.css set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.css set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileReadPre *.css set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufReadPre *.yml set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd BufFilePre *.yml set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileType *.yml set tabstop=2 | set sw=2 | set softtabstop=2
"autocmd FileReadPre *.yml set tabstop=2 | set sw=2 | set softtabstop=2
"
"autocmd BufLeave *.py set tabstop=4 | set sw=4 | set softtabstop=4
"autocmd BufLeave *.rb set tabstop=4 | set sw=4 | set softtabstop=4
"autocmd BufLeave *.ruby set tabstop=4 | set sw=4 | set softtabstop=4
"autocmd BufLeave *.html set tabstop=4 | set sw=4 | set softtabstop=4
"autocmd BufLeave *.css set tabstop=4 | set sw=4 | set softtabstop=4
"autocmd BufLeave *.erb set tabstop=4 | set sw=4 | set softtabstop=4
"autocmd BufLeave *.yml set tabstop=4 | set sw=4 | set softtabstop=4

autocmd BufReadPre *.c set tabstop=4 | set sw=4 | set softtabstop=4
autocmd BufFilePre *.c set tabstop=4 | set sw=4 | set softtabstop=4
autocmd FileType *.c set tabstop=4 | set sw=4 | set softtabstop=4
autocmd FileReadPre *.c set tabstop=4 | set sw=4 | set softtabstop=4
autocmd BufLeave *.c set tabstop=2 | set sw=2 | set softtabstop=2

autocmd BufReadPre *.cpp set tabstop=4 | set sw=4 | set softtabstop=4
autocmd BufFilePre *.cpp set tabstop=4 | set sw=4 | set softtabstop=4
autocmd FileType *.cpp set tabstop=4 | set sw=4 | set softtabstop=4
autocmd FileReadPre *.cpp set tabstop=4 | set sw=4 | set softtabstop=4
autocmd BufLeave *.cpp set tabstop=2 | set sw=2 | set softtabstop=2

"Quickfix"
autocmd BufReadPre *.py nnoremap<buffer><F7> :copen<CR>
autocmd BufReadPre *.rb nnoremap<buffer><F7> :copen<CR>
autocmd BufReadPre *.cpp nnoremap<buffer><F7> :copen<CR>
autocmd BufReadPre *.c nnoremap<buffer><F7> :copen<CR>
autocmd BufReadPre *.java nnoremap<buffer><F7> :copen<CR>
autocmd FileType qf nnoremap<buffer><F7> :cclose<CR>

"complete"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufReadPre css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufReadPre html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd BufReadPre javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""javacomplete"""
autocmd Filetype java setlocal omnifunc=javacomplete#Complete                        "自动补全
"autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo			"参数提示
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
"autocmd Filetype java,javascript,jsp inoremap <buffer>. .<C-X><C-O><C-P>
"""end javacomplete"""

"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"Other"
autocmd BufReadPre *.py set foldmethod=indent | set foldlevel=99

"Lisp Scheme Racket
"autocmd BufReadPre *.scheme set filetype=rkt
"autocmd FileType scheme set filetype=rkt
autocmd BufReadPre  *.rkt,*.rktl set filetype=scheme
autocmd FileType rkt set filetype=scheme

"""important!!!!!!"""
"if has('python3')
"    autocmd FileType python setlocal omnifunc=python3complete#Complete    "Attention!!!!!!
"else
"    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete     "Attention!!!!!!
"endif


""autocmd BufReadPre *.py vnoremap<buffer>
set errorformat=\[ERROR]\ %f:[%l\\,%v]\ %m



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"indentLine_yggdroot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  let g:indentLine_char="┆"
else
  let g:indentLine_char="¦"
endif

let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'ruby', 'php'],
                           \ 'passive_filetypes': ['c'] }

"Default is flake8
"let g:syntastic_python_checker = 'flake8'
"let g:syntastic_python_checker = 'pyflakes'
let g:syntastic_python_checkers = ['pyflakes', 'flake8']
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Python in the Google way.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(log|jpg|png|jpeg|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"let g:ctrlp_user_command = 'find %s -type f'
"let g:ctrlp_max_depth = 40


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LineMovement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:linemovement_up="<S-l>"
"let g:linemovement_down="<C-l>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-S-u> :GundoToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set sessionoptions-=help

let g:session_autosave = 'no'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fuzzyfinder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ,,  :FufCoverageFile!<cr>
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|db/migrate|vendor)'
let g:fuf_enumeratingLimit = 5000
let g:fuf_coveragefile_prompt = '=>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ruby and Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails_proactive = 1
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Display extra whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Delete the empty line at the end of file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""fun! DeleteEmptylineEndofFile()
""    %s/\(\s*\n\)*\s*\%$//ge
""endfun
""
""autocmd BufWritePre * call DeleteEmptylineEndofFile()

fun! DeleteEmptylineEndOfFile()
    let save_cursor = getpos(".")
    :silent! %s/\(\s*\n\)*\s*\%$//ge
    call setpos('.', save_cursor)
endfun

au BufWritePre * call DeleteEmptylineEndOfFile()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Defined Status Line.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup Statusline
"   au! Statusline
"   au BufEnter * call <SID>SetFullStatusline()
"   au BufLeave,BufNew,BufRead,BufNewFile * call <SID>SetSimpleStatusline()
" augroup END
"
" function s:SetFullStatusline()
"     setlocal statusline= "clear the statusline for when vimrc is reloaded
"     setlocal statusline+=\ %n           "buffer number
"     setlocal statusline+=\ %t       "tail of the filename
"     setlocal statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
"     setlocal statusline+=%{&ff}] "file format
"     setlocal statusline+=\ %h      "help file flag
"     setlocal statusline+=\ %m      "modified flag
"     setlocal statusline+=\ %r      "read only flag
"     setlocal statusline+=\ %y      "filetype
"     setlocal statusline+=%{fugitive#statusline()}
"     setlocal statusline+=%#warningmsg#
"     setlocal statusline+=%{SyntasticStatuslineFlag()}
"     setlocal statusline+=%*
"     setlocal statusline+=\ %=   "left/right separator
"     setlocal statusline+=\ [%c,     "cursor column
"     setlocal statusline+=%l   "cursor line/total lines
"     setlocal statusline+=/%L]   "cursor line/total lines
"     setlocal statusline+=\ [%P]    "percent through file
"     "setlocal statusline+=\ [%06.6b, "ASCII
"     "setlocal statusline+=0x%04.4B] "ASCII
"     setlocal statusline+=\ [%-16{strftime(\"%Y-%m-%d\ %H:%M\")}]  "time
" endfunction
"
" fun! s:SetSimpleStatusline() "{{{
"     setlocal statusline= "clear the statusline for when vimrc is reloaded
"     setlocal statusline+=\ %n\            "buffer number
"     setlocal statusline+=\ %t\        "tail of the filename
"     setlocal statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
"     setlocal statusline+=%{&ff}]\  "file format
"     setlocal statusline+=\ %=   "left/right separator
"     setlocal statusline+=\ [%P]\     "percent through file
" endfunction "}}}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""let g:ycm_global_ycm_extra_conf = 1
""let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
""""let g:ycm_autoclose_preview_window_after_completion = 1
""""let g:ycm_autoclose_preview_window_after_insertion = 1
""let g:ycm_key_list_select_completion = []
""let g:ycm_key_list_previous_completion = []


""""""""""""""""""""""""""""""""""""""""""""""
"Auto complete HTML & CSS
""""""""""""""""""""""""""""""""""""""""""""""
""autocmd FileType css set omnifunc=csscomplete#CompleteCSS
""autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete
""""""""""""""""""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Jedi-Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Clang_Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.css = '[^. *\t]\:\w*\|\.\w*\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:goyo_width = 119

nmap <leader>g :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



    let g:startify_skiplist = [
                \ 'COMMIT_EDITMSG',
                \ $VIMRUNTIME .'/doc',
                \ 'bundle/.*/doc',
                \ '.vimgolf',
                \ ]

    let g:startify_custom_footer =
          \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

    let g:startify_custom_header = [
                \ '                __   __                                                  ',
                \ '               __ \ / __         __________________________________      ',
                \ '              /  \ | /  \       /           Hello World!!          \     ',
                \ '                  \|/          /                                    \    ',
                \ '             _,.---v---._      |              大家好！              |    ',
                \ '    /\__/\  /            \     \   我是一个粉刷匠，粉刷本领强~~     /    ',
                \ '    \_  _/ /              \    / __________________________________/     ',
                \ '      \ \_|           @ __|   /_/                                        ',
                \ '       \                \_                                               ',
                \ '        \     ,__/       /                                               ',
                \ '      ~~~`~~~~~~~~~~~~~~/~~~~                                            ',
                \ '',
                \ ]


    if has('gui_running')

        "hi StartifyBracket  guifg=red
        "hi StartifyNumber   guifg=yellow
        " if strftime("%H") > 8 + 00
        "     hi StartifyPath     guifg=black
        " else
        "     hi StartifyPath guifg=white
        " endif

        "hi StartifySlash    guifg=red
        "hi StartifySpecial  guifg=red
        hi StartifyHeader   guifg=green
        hi StartifyFooter   guifg=gray
        hi StartifyFile    guifg=red
        hi StartifyPath guifg=white
    else
        hi StartifyBracket ctermfg=240
        hi StartifyNumber  ctermfg=215
        hi StartifyPath    ctermfg=245
        hi StartifySlash   ctermfg=240
        hi StartifySpecial ctermfg=240
        hi StartifyHeader  ctermfg=114
        hi StartifyFooter  ctermfg=240
        "hi StartifyFile    ctermfg=111
    endif

    ""autocmd VimEnter *
    ""            \ if !argc() |
    ""            \   Startify |
    ""            \   NERDTree |
    ""            \   execute "normal \<c-w>w" |
    ""            \ endif

"" let g:startify_custom_header = [
""             \ '     _    _      _ _        __      ___            ',
""             \ '    | |  | |    | | |       \ \    / (_)           ',
""             \ '    | |__| | ___| | | ___    \ \  / / _ _ __ ___   ',
""             \ '    |  __  |/ _ \ | |/ _ \    \ \/ / | | `_ ` _ \  ',
""             \ '    | |  | |  __/ | | (_) |    \  /  | | | | | | | ',
""             \ '    |_|  |_|\___|_|_|\___/      \/   |_|_| |_| |_| ',
""             \ '',
""             \ '',
""             \ ]

"""""""""""""""
"""CtrlSpace
"""""""""""""""
let g:ctrlspace_default_mapping_key = "<C-i>"
hi CtrlSpaceSelected term=reverse ctermfg=187   guifg=#d7d7af ctermbg=23    guibg=#005f5f cterm=bold gui=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244   guifg=#808080 ctermbg=232   guibg=#080808 cterm=NONE gui=NONE
hi CtrlSpaceSearch   ctermfg=220  guifg=#ffd700 ctermbg=NONE  guibg=NONE    cterm=bold    gui=bold
hi CtrlSpaceStatus   ctermfg=230  guifg=#ffffd7 ctermbg=234   guibg=#1c1c1c cterm=NONE    gui=NONE

""""""""""""""""""""""""
"""vim-airline
""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" set fillchars+=stl:\ ,stlnc:\
" set ambiwidth=double
" set noshowmode
let g:airline_theme='tomorrow'


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_inctags = "a, abbr, acronym, address, b, bdo, big, blockquote, button, caption"
let g:html_indent_inctags = "center, cite, code, colgroup, del, dfn, dir, div, dl, em, fieldset, font"
let g:html_indent_inctags = "form, frameset, h1, h2, h3, h4, h5, h6, i, iframe, ins, kbd, label, legend"
let g:html_indent_inctags = "map, menu, noframes, noscript, object, ol, optgroup, q, s, samp, select"
let g:html_indent_inctags = "small, span, strong, sub, sup, table, textarea, title, tt, u, ul, var, th, td, tr, tfoot, thead"
let g:html_indent_inctags = "area, article, aside, audio, bdi, canvas, command, datalist, details, embed"
let g:html_indent_inctags = "figure, footer, header, group, keygen, mark, math, meter, nav, output"
let g:html_indent_inctags = "progress, ruby, section, svg, texture, time, video, wbr, text"

let g:molokai_original = 1
let g:rehash256 = 1

let g:indentLine_noConcealCursor=""
