set runtimepath^=~\.vim runtimepath+=~\.vim\after
let &packpath = &runtimepath
set runtimepath+=~\.config\nvim
"If you want to include any previous vim config(all feature may not be compatiblle)
"source ~/.vimrc


"----------------vundle-------------------------
"set nocompatible   (always in nvim) " be iMproved, required
filetype off                         " required

" set the runtime path to include Vundle and initialize
set rtp+=~\.vim\bundle\Vundle.vim
call vundle#begin('~\.vim\bundle')

"Core Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'         "Search for anyting from vim

"Main Plugins
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
" Plugin 'itchyny/lightline.vim'          "light status line

"visual Plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"pure vim scripts with no dependencies
Plugin 'tpope/vim-abolish'
Plugin 'zhimsel/vim-stay'
Plugin 'wsdjeg/vim-fetch'
Plugin 'Konfekt/FastFold'
Plugin 'kassio/neoterm'
Plugin 'mhinz/vim-sayonara'
" Plugin 'tpope/vim-dispatch'

"Helpful Generic Tools
Plugin 'kshenoy/vim-signature'
Plugin 'mg979/vim-visual-multi'
Plugin 'machakann/vim-swap'
Plugin 'junegunn/vim-easy-align'        "An alternative is tabular
Plugin 'tommcdo/vim-exchange'
Plugin 'pelodelfuego/vim-swoop'         "call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'sk1418/Join'                    "[range]Join[!] [separator] [count] [flags]
Plugin 'matze/vim-move'                 "move selection as whole around
Plugin 'flazz/vim-colorschemes'
Plugin 'felixhummel/setcolors.vim'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-rooter'        "automatically sets project directory using rules in vimrc

"Experimental
Plugin 'qpkorr/vim-bufkill'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'romainl/vim-qf'                 "don't recommend vim-qf to Syntastic/Neomake/ALE users


"LSP/autocomplete
" Plugin 'pylint.vim'
" Plugin 'psf/black'
" Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }
Plugin 'jackguo380/vim-lsp-cxx-highlight'

call vundle#end()            " required
filetype plugin indent on    " required

"----------------Plugin-Options-----------------


"==>vim-move
let g:move_key_modifier = 'C'

"==>easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==>vim-stay
set viewoptions=cursor,folds,slash,unix

"==>undo-tree
nnoremap <F7> :UndotreeToggle<cr>
" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "")
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "")
endif
set undodir=~/.vim/undo-dir
set undofile

"==>FastFold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:fastfold_minlines = 0

xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

"==>Goyo & limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"==>neoterm
" 3<leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au VimEnter,BufRead,BufNewFile *.idr set filetype=idris
au VimEnter,BufRead,BufNewFile *.lidr set filetype=lidris
au VimEnter,BufRead,BufNewFile *.lfe set filetype=lfe
"To use the jupyter console REPL present on your path
function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction
let g:neoterm_repl_python = Chomp(system('which jupyter')) . ' console'

"==>tag-bar
map <F9> :TagbarToggle<CR>

"==>vim-easytags
let g:easytags_async=1
"autocmd FileType python let b:easytags_auto_highlight = 0          "example how to disable highlighting for a filetype
let g:easytags_file = '~/.vim/tags'

set tags=./tags;
let g:easytags_dynamic_files = 1

"==>vim-shell
let g:shell_fullscreen_always_on_top = 0

"==>vim-rooter
let g:rooter_patterns = ['.git', 'CMakeLists.txt', 'Makefile', '*.sln', '.idea']

"==>airline
let g:airline_theme='sol'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"tabline
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#excludes = ['qf', 'vim-plug', 'help', 'diff', 'man', 'fugitive', 'nerdtree', 'tagbar', 'codi']
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buf_label_first = 1

"==>Coc
"remap <cr> to make sure it confirms completion when popup menu is visible
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() :"\<C-g>u\<CR>"
" nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-Tab>" :
      \ coc#refresh()
" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floatingRightside<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"==> ALE

" let g:ale_fix_on_save = 1
" let g:ale_lint_on_save= 1
" let g:ale_lint_on_enter = 0
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning ='⚠'

" let g:ale_linters = {
            " \   'python':     ['pylint'],
            " \   'javascript': ['eslint'],
            " \   'vim':        ['vimls'],
            " \   'cpp':        ['clangtidy',],
            " \}
" let g:ale_fixers = {
  " \   'python': [
  " \       'add_blank_lines_for_python_control_statements',
  " \       'black',
  " \             ],
  " \   'cpp'   : [
  " \       'clangtidy',
  " \             ],
  " \                }

" nmap <silent> <C-l> <Plug>(ale_previous_wrap)
" nmap <silent> <C-h> <Plug>(ale_next_wrap)
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1
" let g:ale_disable_lsp = 1
"----------------options------------------------
" set UTF encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

colorscheme dracula
set noshowmode          "only if a status line plugin is installed
set smartcase
set ignorecase
set incsearch
set lazyredraw
set autoindent
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=79
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
"let lefft right keys toswith to different line at end of line
set whichwrap=<,>,[,]
" display tabs as '>---' and trailing spaces as '-'
set listchars=tab:>-,trail:-
"let terminal detect mouse input
set mouse=a
set shellslash
" set ttymouse=xtem2
"set guifont=Hack_NF:h11
set showtabline=2

"---------------remaps/commands-------------------------
"To use `ALT+{h,j,k,l}` to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
"Folding with spacebar
nnoremap <space> za
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
"Run current line as a command with '\e'
nnoremap <leader>e :exe getline(line('.'))<CR>
" CDC = Change to Directory of Current file
command CDC cd %:p:h
"refresh external changes into file
nnoremap <F5> :checktime <CR>

"---------------autocommands-------------------
"Show relative numbering in only command mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

"Comment togglinng          "Alternative commentary by tpope
autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
function! CommentToggle()
    execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/'
    execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/'
endfunction
map <c-/> :call CommentToggle()<ESC><CR>
map <c-_> :call CommentToggle()<ESC><CR>
"Comment togglinng

" au Filetype python let python_highlight_all=1
let g:python3_host_prog='C:\Users\rajpr\Anaconda3/python.EXE'

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

