"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" Show invisible char "tab" and "eol"
set list
set listchars=tab:▸\ ,eol:¬

" setting default working directory
" exec 'cd ' . fnameescape('/vimdir')  
" set autochdir

"Right under the scree will shows where you are
set ruler
syntax enable
syntax on

"Show full file name path
set laststatus=2
" set statusline+=%F
" set statusline=%<%F\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
" highlight StatusLine term=bold,reverse cterm=bold,reverse
"Show tabstatus
set showtabline=2

" Automatic reloading of .vimrc 
autocmd! bufwritepost .vimrc source %

"Plugins management
execute pathogen#infect()

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


"Mapping leader to comma
let mapleader = ","


"no highlight search result 
set nohls
" Set highlight search for white color
" set hlsearch
" highlight       Search    ctermfg=White
" ignore case when searching 
set ignorecase
" smart search 
set smartcase
"While searching, the match characters will be highlighting
set incsearch

set shiftwidth=4
set autoindent
set smartindent

"Break the line instead of breaking a word
set linebreak


"Do not compatible vi
set nocompatible

"backspace will delete the indent space, end of line
set backspace=indent,eol,start

"enable auto backup
set backup
"backup dir
set backupdir=/vimdir

"auto filetype detect
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

"Auto insert highlighting for blogging 
" inoremap <C-b> <cr>``` bash<CR><CR>```<CR><C-o>2k
" this function has been replaced by snipperts plugin

"Delete from current cursor to EOL in insert mode
inoremap <C-k> <Esc>C


set rnu
" =============relative number line setting ==============
function! NumberToggle()
    if(&relativenumber == 1)
        set invnu nornu
    else
        set rnu
    endif
endfunc
nnoremap <C-n><C-n> :call NumberToggle()<CR>
nnoremap <leader>r :set nornu<CR>

"Mapping showing line number
" :nmap <C-n><C-n> :set invnumber<CR>



"Change what you just type into uppercase
inoremap <C-j> <esc>gUiwea

"Mapping TAB key to 4 space
set ts=4
set expandtab

"Map \" to add " around the line 
" will be replaced by commentary plugin
" nnoremap <leader>" I"<Esc>A"<Esc>

"Add <code></code> block around a word in insert mode by using \c
" Replaced by snippets plugin
" inoremap <leader>c <Esc>bi<code><Esc>A</code>
" Replace by surround.vim
" In normal mode, ysiw<code>
" Insert mode, <C-g>s<code> before typing the word you want to highlight

set showcmd

nnoremap / /\v

"Delete the space at the end of line
"in normal mode
nmap <leader><space> g_lD

"auto fix mis-spell by using \sp
set spell
"nnoremap <leader>sp :normal! mm[s1z=`m<cr>
function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>


" Color theme
if $TERM == "xterm-256color"
    set t_Co=256
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"Highlighting current line
set cursorline
"hi CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"set cursorcolumn
" Toggle cursor row highlighting on request...
" highlight CursorLine term=bold ctermfg=black ctermbg=cyan cterm=bold
" hi CursorLine   term=bold ctermbg=red ctermfg=white cterm=bold
" hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE 

hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"
" color desert 
" color dracula
" color wombat256mod

let g:solarized_termcolors=16
" gui theme & terminal themem
if has('gui_running')
    set background=dark
    colorscheme  solarized
else
    "autocmd BufEnter * color  wombat256mod
    "autocmd BufEnter *.md color peaksea
    "autocmd BufEnter *.markdown color peaksea
    set background=dark
    colorscheme solarized
    " let g:molokai_original = 1
    " let g:rehash256 = 1
    " set background=dark
    " au FileType markdown colorscheme solarized
    " au FileType markdown set background=dark
    "au FileType *.md colorscheme peaksea
endif

" Change markdown filetype theme
" au FileType *.markdown colorscheme peaksea
" au FileType *.md colorscheme peaksea

" Python PEP8 indention 
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" Other file indention 
au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.css set tabstop=2 softtabstop=2 shiftwidth=2


" Highlight excess line length
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python,*.py highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,*.py match Excess /\%81v.*/
    autocmd FileType python,*.py set nowrap
    augroup END

"Flagging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF8 Support
set encoding=utf-8

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map sort function to a key
vnoremap <leader>s :sort<CR>


" load up the nerd tree
"autocmd vimenter * NERDTree
"map Leader>t <plug>NERDTreeTabsToggle<CR> "" move nerdtree to the right
"let g:NERDTreeWinPos = "right"

" paste toggle
set pastetoggle=<F2>

"for markdown support
let g:vim_markdown_frontmatter=1
" Disable code folding in markdown
let g:vim_markdown_folding_disabled = 1
" diable folding in markdown 
autocmd BufNewFile,BufRead *.md set nofoldenable
autocmd BufNewFile,BufRead *.markdown set nofoldenable
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'python', 'ruby', 'sass', 'xml', 'bash', 'sql', 'perl']

" To enable/disable folding use Vim's standard folding configuration.
" set [no]foldenable
" To fold in a style like python-mode, add the following to your
" let g:vim_markdown_folding_style_pythonic = 1
"
" AirlineTheme setting 
let g:airline_theme="luna"
" Airline TAB setting
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>>'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Mapping key for switch tab window
nnoremap <leader>bn :bnext!<CR>
nnoremap <leader>bp :bpre!<CR>

" Nerdtree setting 
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>' :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " " move to the first buffer
" autocmd VimEnter * wincmd p

"For gvim
set guioptions-=m
set guioptions-=T
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
set guioptions-=r
set guioptions-=L

" Mapping force logout
nnoremap <leader>qa :qall!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>z :wq!<CR>

inoremap <leader>qa <Esc>:qall!<CR>
inoremap <leader>w <Esc>:w!<CR>
inoremap <leader>z <Esc>:wq!<CR>


" While exiting vim, the file content still remain in the screen
" set  t_ti= t_te=

"Mapping Esc key 
inoremap jj <Esc>

"====[ I'm sick of typing :%s/.../.../g ]=======
"conflict with surround plugins
"nmap S :%s//g<LEFT><LEFT>

"=====[ Make Visual modes work better ]==================
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

" Make BS/DEL work as expected in visual modes (i.e. delete the selected
" text)...
vmap <BS> x

" Make vaa select the entire file...
vmap aa VGo1G

" Match angle brackets...
set matchpairs+=<:>,«:»

" Use space to jump down a page (like browsers do)...
nnoremap   <Space> <PageDown>
vnoremap   <Space> <PageDown>

" Highlight folds
" highlight Folded  ctermfg=cyan ctermbg=black

"=====[ Comments are important ]==================
highlight Comment term=bold ctermfg=cyan

" For tabular plugin
" Need 1 space arround cucumber
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" #For nerdcommentary  plug
" <leader>c<Space> "auto comment/uncomment
" Insert a space befor the comment
let g:NERDSpaceDelims=1


" ================Adding vim session manage ==================
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe "mksession! " . b:sessionfile
    echo "updating session"
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()
map <leader>m :call MakeSession()<CR>

" Fast copy to system clipboard
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" make ` execute the contents of the q register
nnoremap ` @q
vnoremap ` :normal @q<CR>

" For python, shell and other file header
autocmd BufNewFile *.sh,*.py,*.ksh,*.html exec ":call SetTitle()"
func! SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
        call append(line("."), "\#########################################################################")
        call append(line(".")+1, "\# File Name:     ".expand("%"))
        call append(line(".")+2, "\# Author:        Fung Kong")
        call append(line(".")+3, "\# Mail:          kyun.kong@gmail.com")
        call append(line(".")+4, "\# Created Time:  ".strftime('%Y-%m-%d %T', localtime()))
        call append(line(".")+5, "\# Description:   ")
        call append(line(".")+6, "\#                ")
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
    endif
    if &filetype == 'ksh'
        call setline(1, "\#!/usr/bin/env ksh")
        call append(line("."), "\#########################################################################")
        call append(line(".")+1, "\# File Name:     ".expand("%"))
        call append(line(".")+2, "\# Author:        Fung Kong")
        call append(line(".")+3, "\# Mail:          kyun.kong@gmail.com")
        call append(line(".")+4, "\# Created Time:  ".strftime('%Y-%m-%d %T', localtime()))
        call append(line(".")+5, "\# Description:   ")
        call append(line(".")+6, "\#                ")
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."), "\#-*- encoding: utf-8 -*- ")
        call append(line(".")+1, "\"\"\"")
        call append(line(".")+2, "\# Author:        Fung Kong")
        call append(line(".")+3, "\# Email:         kyun.kong@gmail.com")
        call append(line(".")+4, "\# Created Time:  ".strftime('%Y-%m-%d %T', localtime()))
        call append(line(".")+5, "\# File Name:     ".expand("%"))
        call append(line(".")+6, "\# Description:   ")
        call append(line(".")+7, "\# ")
        call append(line(".")+8, "\"\"\"")
        call append(line(".")+9,"")
    endif
    " Replace by emmet-vim: insert mode, type "html:5" and type <c-y>, there's
    " a comma here
    normal G
endfunc

" =========================
" End of File header

" for syntastic Plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Press F5 to run python script
map <f5> :w<cr>:!python %<cr>

" ====================================
" emmet plugin for html
" ====================================
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" To remap the default <C-Y> leader:
" let g:user_emmet_leader_key='<C-Z>'

" ====================================
" end of emmet plugin for html
" ====================================

" ===================================
" css3-vim plugin setting
" ===================================
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END
" ===================================
" css3-vim plugin setting end
" ===================================

" ===================================
" auto complete for some langs, keystroke is c-x c-o
" ===================================
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set omnifunc=syntaxcomplete#Complete
