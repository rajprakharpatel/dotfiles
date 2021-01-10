set runtimepath^=~\.vim runtimepath+=~\.vim\after
let &packpath = &runtimepath
set runtimepath+=~\.config\nvim
"If you want to include any previous vim config(all feature may not be compatiblle)
"source ~/.vimrc

"Failed attempt to configure powershell as the default inside vim
    "sending commands as string in '!' and vundle uses '&&' in shell commands which is not supported by powershell
" if (has('win32') || has('gui_win32')) && executable('powershell')
    " set shell=powershell
    " set shellquote=\"
    " set shellpipe=\|
    " shellxquote must be a literal space character.
    " set shellxquote= 
    " set shellcmdflag=\ -ExecutionPolicy\ RemoteSigned\ -Nologo\ -NoProfile\ -NonInteractive\ -Command
" endif

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

"----------------vundle-------------------------
"set nocompatible   (always in nvim) " be iMproved, required
filetype off                         " required

" set the runtime path to include Vundle and initialize
set rtp+=~\.vim\bundle\Vundle.vim
call vundle#begin('~\.vim\bundle')
" let g:firenvim_config = {
    " \ 'globalSettings': {
        " \ 'alt': 'all',
    " \  },
    " \ 'localSettings': {
        " \ '.*': {
            " \ 'cmdline': 'neovim',
            " \ 'priority': 0,
            " \ 'selector': 'textarea',
            " \ 'takeover': 'always',
        " \ },
    " \ }
" \ }
" let fc = g:firenvim_config['localSettings']
" let fc['https://studio.youtube.com.*'] = { 'takeover': 'never', 'priority': 1 }
" let fc['https?://instagram.com.*'] = { 'takeover': 'never', 'priority': 1 }
" let fc['https?://twitter.com.*'] = { 'takeover': 'never', 'priority': 1 }
" let fc['https://.*gmail.com.*'] = { 'takeover': 'never', 'priority': 1 }
" let fc['https?://.*twitch.tv.*'] = { 'takeover': 'never', 'priority': 1} 
"Core Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'         "Search for anyting from vim

"Main Plugins
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'

"visual Plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'felixhummel/setcolors.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'        "displaying thin vertical lines at each indentation level for code indented with spaces
Plugin 'kristijanhusak/vim-hybrid-material' "colorscheme
Plugin 'ryanoasis/vim-devicons'
" Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

"pure vim scripts with no dependencies
Plugin 'tpope/vim-abolish'
Plugin 'zhimsel/vim-stay'
Plugin 'wsdjeg/vim-fetch'
Plugin 'Konfekt/FastFold'
Plugin 'mhinz/vim-sayonara'
" Plugin 'tpope/vim-dispatch'

"Helpful Generic Tools
Plugin 'kshenoy/vim-signature'
Plugin 'mg979/vim-visual-multi'
Plugin 'machakann/vim-swap'
Plugin 'junegunn/vim-easy-align'        "An alternative is tabular
Plugin 'tommcdo/vim-exchange'
Plugin 'pelodelfuego/vim-swoop'         "call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
Plugin 'sk1418/Join'                    "[range]Join[!] [separator] [count] [flags]
Plugin 'matze/vim-move'                 "move selection as whole around
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-rooter'        "automatically sets project directory using rules in vimrc

"Experimental
Plugin 'qpkorr/vim-bufkill'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'romainl/vim-qf'                 "don't recommend vim-qf to Syntastic/Neomake/ALE users
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'liuchengxu/vim-which-key'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Raimondi/delimitMate'
Plugin 'sheerun/vim-polyglot'
"LSP/autocomplete
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'python-rope/ropevim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'
Plugin 'wellle/targets.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'andymass/vim-matchup'
Plugin 'puremourning/vimspector'
Plugin 'szw/vim-maximizer'
Plugin 'tweekmonster/startuptime.vim'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'RRethy/vim-illuminate'
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }
Plugin 'honza/vim-snippets'
Plugin 'ptzz/lf.vim'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'rhysd/wandbox-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'RishabhRD/nvim-cheat.sh'
Plugin 'RishabhRD/popfix'
" Plugin 'vim-fat-finger' manually added

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
let g:fastfold_minlines = 3

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
let g:rooter_patterns = ['.git', 'CMakeLists.txt', 'Makefile', '*.sln', '.idea', '.CProot']

"==>airline
let g:airline_theme='hybrid'
" let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"tabline
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#excludes = ['qf', 'vim-plug', 'help', 'diff', 'man', 'fugitive', 'nerdtree', 'tagbar', 'codi']
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buf_label_first = 0

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

nmap <leader>gd <plug>(coc-definition)
nmap <leader>gy <plug>(coc-type-definition)
nmap <leader>gu <plug>(coc-implementation)
nmap <leader>gr <plug>(coc-references)
nmap <leader>rn <plug>(coc-rename)
nmap <A-f> :CocFix<CR>
nmap <C-A-l> :call CocAction('format')<CR>
" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)

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

" nmap <F1> :CocCommand java.debug.vimspector.start<CR>
function! JavaStartDebugCallback(err, port)
  execute "cexpr! 'Java debug started on port: " . a:port . "'"
  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
endfunction

function JavaStartDebug()
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartDebugCallback'))
endfunction

nmap <F1> :call JavaStartDebug()<CR>
"==>indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"==>simpylfold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1

"==>rope
let ropevim_vim_completion=1
let ropevim_extended_complete=1
let g:ropevim_goto_def_newwin="tabnew"
autocmd FileType python setlocal omnifunc=RopeCompleteFunc

"==>vim-spector
source ~/AppData/Local/nvim/which-key.vim 

nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

"==>cheat
let g:CheatSheetSilent=1

"==>rainbow_levels
function RainbowBackgroundToggle() abort
    hi RainbowLevel0 ctermbg=240 guibg=#585858
    hi RainbowLevel1 ctermbg=239 guibg=#4e4e4e
    hi RainbowLevel2 ctermbg=238 guibg=#444444
    hi RainbowLevel3 ctermbg=237 guibg=#3a3a3a
    hi RainbowLevel4 ctermbg=236 guibg=#303030
    hi RainbowLevel5 ctermbg=235 guibg=#262626
    hi RainbowLevel6 ctermbg=234 guibg=#1c1c1c
    hi RainbowLevel7 ctermbg=233 guibg=#121212
    hi RainbowLevel8 ctermbg=232 guibg=#080808
    execute ":RainbowLevelsToggle"
endfunction

function RainbowLevelsToggle() abort
    for level in range(0, 10, 2)
      exe 'hi! RainbowLevel'.level.' guifg=magenta'
      exe 'hi! RainbowLevel'.(level+1).' guifg=cyan'
    endfor
    execute ":RainbowLevelsToggle"
endfunction
nnoremap <leader>rbf :call RainbowLevelsToggle() <CR>
nnoremap <leader>rbb :call RainbowBackgroundToggle()<CR>

"==>FZF
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"==>illuminate
augroup illuminate_augroup
        autocmd!
            autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
        augroup END

"==>vim-lf
nnoremap <leader>f <Plug>LfSplit
let g:lf_replace_netrw = 1 "open lf when vim open a directory

"==>floaterm
" let g:floaterm_shell = sh
" let g:floaterm_wintype = 'normal'
let g:floaterm_rootmarkers = ['.project', '.vscode', '.idea', '.git', '.hg', '.svn', '.root', '.gitignore', '.CP']
let g:floaterm_open_command  = 'vsplit'
let g:floaterm_keymap_new    = '<Leader>ft'
let g:floaterm_keymap_prev   = '<leader>fp'
let g:floaterm_keymap_next   = '<leader>fn'
let g:floaterm_keymap_toggle = '<M-t>'
let g:floaterm_keymap_kill   = '<leader>fk'
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan
hi FloatermNC guibg=gray

command! LF FloatermNew lf

"==>incsearch.vim
" Implemented in easymotion below
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"==>incsearch-fuzzy
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

"==>easymotion
map <Leader> <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"==>incsearch-easymotion

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" incsearch.vim x fuzzy x vim-easymotion

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

"==>UltiSnips
" Trigger configuration. You need to change this to something other than <tab>
" if you use one of the following:
let g:UltiSnipsExpandTrigger="<c-s-<space>>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"==>vimwiki

let taskList = {}
let taskList.path = '~/workspace/vimwiki/'
" let taskList.html_template = '~/public_html/template.tpl'
let taskList.path_html = '~/workspace/vimwiki/'
let taskList.syntax = 'markdown'
let taskList.ext =  '.md'
" let taskList.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let g:vimwiki_list = [taskList]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
nmap <space>t <Plug>VimwikiToggleListItem <CR>
let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

"----------------options------------------------
let g:vimspector_base_dir='C:\Users\rajpr\.vim\bundle\vimspector'
" set UTF encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set list lcs=tab:\|\ "(here is a space)
set termguicolors
colorscheme hybrid_reverse
" execute ":AirlineToggleWhitespace"
" hi Quote ctermbg=109 guifg=#83a598
set hidden
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
" wrap lines at 120 chars. 80 is some what antiquated with nowadays displays.
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
"let left right keys to switch to different line at end of line
set whichwrap=<,>,[,]
" display tabs as '>---' and trailing spaces as '-'
set listchars=tab:>-,trail:-
"let terminal detect mouse input
set mouse=a
set shellslash
" set ttymouse=xtem2
set showtabline=2


let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools']
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
" Edit vimrc configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
"Run current line as a command with '\e'
nnoremap <leader>e :exe getline(line('.'))<CR>
" CDC = Change to Directory of Current file
command CDF cd %:p:h
"refresh external changes into file
nnoremap <F5> :checktime <CR>
"Quit without closing tab
command Q :Sayonara!
"Add semicolon to end of line with <;>
nnoremap ; A;<esc>
nnoremap <leader>pl :PluginInstall<CR>

" Control-S Save
map <C-S> <esc>:w<cr>
" Save + back into insert
imap <C-S> <esc>:w<cr>a

" Control-C Copy to system clipboard
vmap <C-C> "+y
nmap <C-C> "+yy
imap <C-C> <esc>"+yya

" Control-V Paste in insert and command mode
imap <C-V> <esc>"+pa
vmap <C-V> "+p
" paste last yank in commad mode
cmap <C-V> <C-r>0

" Toggle Transparency of background
map <leader>tr :hi Normal guibg=NONE ctermbg=NONE<CR>
map <leader>op :set background=dark<CR>

"---------------autocommands-------------------
"Show relative numbering in only command mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
autocmd filetype cpp nmap <F6> :w <bar> !g++ -ulimit -g -Wall -Wno-unused-result -std=c++11 % -o %:r && %:r < inp.txt > out.txt <CR>
autocmd filetype c nmap <F6> :w <bar> !gcc -g  % -o %:r && %:r < inp.txt > out.txt <CR>
autocmd filetype java nmap <F6> :w <bar> !javac -g % && java -enableassertions %:r < inp.txt > out.txt <CR>
" to start debug server on port 5005
autocmd filetype java nmap <S-F6> :w <bar> :FloatermNew java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y %:r
autocmd filetype python nmap <F6> :w <bar> !python % < inp.txt > out.txt <CR>
autocmd filetype cpp nnoremap <leader>tp 0r ~/.vim/tempelate/tempelate.cpp
" let g:vimspector_enable_mappings = 'HUMAN'

"Comment toggling          "Alternative commentary by tpope
autocmd FileType c,cpp,java,json,scala,jsonc let b:comment_leader = '//'
autocmd FileType sh,ruby,python,cmake,ps1    let b:comment_leader = '#'
autocmd FileType conf,fstab                  let b:comment_leader = '#'
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

