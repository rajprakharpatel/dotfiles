"__________                       ____   ____.__
"\______   \__ _________   ____   \   \ /   /|__| _____
" |     ___/  |  \_  __ \_/ __ \   \   Y   / |  |/     \
" |    |   |  |  /|  | \/\  ___/    \     /  |  |  Y Y  \
" |____|   |____/ |__|    \_____     \___/   |__|__|_|  /
"                                                     \/
"------------------------------options-----------------------------------------
" set UTF encoding
set updatetime=50
set enc=utf-8
scriptencoding utf-8
set noswapfile
set nobackup
set fenc=utf-8
set termencoding=utf-8
"set list lcs=tab:\|\ "(here is a space)
set termguicolors
set hidden
set smartcase
set ignorecase
set incsearch
set lazyredraw
set autoindent
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=79
set colorcolumn=80
" turn syntax highlighting on
set t_Co=256
syntax on
"" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set laststatus=2
"scroll when [count] lines to the border
set so=5
"let left right keys to switch to different line at end of line
set whichwrap=<,>,[,]
" display tabs as '>---' and trailing spaces as '-'
set list
set listchars=tab:>-,trail:-
"let terminal detect mouse input
set mouse=a
" set shellslash "plug doesn't worrk with this option set
set showtabline=2

"NERDTree's flavour
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

"---------------remaps/commands-------------------------
"To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"Folding with spacebar
nnoremap <space> za
" Edit vimrc configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
"Run current line as a command with '\e'
nnoremap <leader>e :exe getline(line('.'))<CR>
" CDC = Change to Directory of Current file
command CDF cd %:p:h
"refresh external changes into file
nnoremap <F5> :checktime<CR>
"Quit without closing tab
command Q :Sayonara!
"Add semicolon to end of line with <;>
nnoremap ; A;<esc>

" Control-S Save
map <C-S> <esc>:w<cr>
" Save + back into insert
imap <C-S> <esc>:w<cr>a

" Control-C Copy to system clipboard
vmap <C-C> "+y
nmap <C-C> "+yy
" imap <C-C> <esc>"+yya

" Control-V Paste in insert and command mode
" imap <C-V> <esc>"+pa
vmap <C-V> "+p
" paste last yank in commad mode
cmap <C-V> <C-r>0

" Toggle Transparency of background
map <leader>tr :hi Normal guibg=NONE ctermbg=NONE<CR>
map <leader>op :set background=dark<CR>

" Open project directory in Windows File Explorer
nnoremap <leader>xp :silent! !xdg-open . <CR>

"---------------autocommands-------------------
"Show relative numbering in only command/normal mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
autocmd filetype cpp nmap <F6> :w <bar> !g++ -s -O3 % -o release-%:r && release-%:r < inp.txt > out.txt <CR>
autocmd filetype cpp nmap <S-F6> :w <bar> !g++ -ulimit -ggdb -Og -Wall -Wno-unused-result -std=c++11 % -o debug-%:r && debug-%:r < inp.txt > out.txt <CR>
autocmd filetype c nmap <F6> :w <bar> !gcc -g  % -o %:r && %:r < inp.txt > out.txt <CR>
autocmd filetype java nmap <F6> :w <bar> !javac -g % && java -enableassertions %:r < inp.txt > out.txt <CR>
" to start debug server on port 5005
autocmd filetype java nmap <S-F6> :w <bar> !java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y %:r
autocmd filetype python nmap <F6> :w <bar> !python % < inp.txt > out.txt <CR>
autocmd filetype cpp nnoremap <leader>tp 0r ~/.vim/tempelate/tempelate.cpp
" let g:vimspector_enable_mappings = 'HUMAN'

"Comment toggling          "Alternative commentary by tpope
autocmd FileType c,cpp,java,json,scala,jsonc let b:comment_leader = '//'
autocmd FileType groovy                      let b:comment_leader = '//'
autocmd FileType sh,ruby,python,cmake,ps1    let b:comment_leader = '#'
autocmd FileType conf,fstab,fish,yaml,taskrc        let b:comment_leader = '#'
autocmd FileType tex                         let b:comment_leader = '%'
autocmd FileType mail                        let b:comment_leader = '>'
autocmd FileType vim                         let b:comment_leader = '"'

function! CommentToggle()
    execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/'
    execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/'
endfunction
map <c-/> :call CommentToggle()<ESC><CR>
map <c-_> :call CommentToggle()<ESC><CR>
"Comment toggling

let s:default_path = escape(&path, '\ ') " store default value of 'path'
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

"---------------diff---------------------------
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
autocmd StdinReadPre * let s:std_in=1

