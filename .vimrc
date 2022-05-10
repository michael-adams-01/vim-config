" __     ___                    
" \ \   / (_)_ __ ___  _ __ ___ 
"  \ \ / /| | '_ ` _ \| '__/ __|
"   \ V / | | | | | | | | | (__ 
"    \_/  |_|_| |_| |_|_|  \___|
                              

"###################PLUGINS##############################

" Make sure you use single quotes for plugin directory
call plug#begin('~/.vim/plugged')
" Emmet
Plug 'mattn/emmet-vim'
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Auto pairs for '(' '[' '{'
"Plug 'jiangmiao/auto-pairs'
" Multi Cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Live Server
Plug 'turbio/bracey.vim'
"CSS Color
Plug 'ap/vim-css-color'
"Auto Format
" Plug 'chiel92/vim-autoformat'
"Commentary
Plug 'https://github.com/tpope/vim-commentary.git'
"NerdTree
Plug 'scrooloose/nerdtree'
"FZF
Plug 'junegunn/fzf'
"Goyo
Plug 'junegunn/goyo.vim'


call plug#end()

let g:user_emmet_mode="n"
let g:user_emmet_leader_key=","

" let g:VM_maps = {}
" let g:VM_maps["Select Cursor Down"] = '<C-j>'
" let g:VM_maps["Select Cursor Up"]   = '<C-k>'

let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<C-j>'   " new cursor down
let g:VM_maps["Add Cursor Up"]      = '<C-k>'   " new cursor up


"###################SETTINGS#############################

" set leader key
let g:mapleader = "\<Space>"
syntax enable
set autoindent
set clipboard=unnamedplus
set number
set number relativenumber
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
cnoreabbrev W w
set background=dark
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Splits open at the bottom and right, unlike vim defaults.
set splitbelow splitright
" Shortcutting split navigation, saving a keypress:
map <C-j> <C-w>h
map <C-h> <C-w>j
map <C-l> <C-w>k
map <C-k> <C-w>l
"Newtab with ctrl+t
nnoremap <silent> <C-t> :tabnew<CR>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo

set path=.,,**

"TABS
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" nnoremap <silent> <A-2> :tabmove +<CR>
" nnoremap <silent> <A-1> :tabmove -<CR>


"Sets vim to remember the last location in file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif


"NERDTree Settings

"nmap <A-f> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeToggle<CR>

" autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

let g:NERDTreeWinPos = "right"

let NERDTreeQuitOnOpen=1


"Bindings for splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

"Start Bracey
nnoremap <leader>b :Bracey<CR>

"Open Terminal
nnoremap <leader>t :term<CR>

"Open FZF
nnoremap <leader>s :FZF<CR>


" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Goyo
nnoremap <leader>g :Goyo<CR>


" Line Number Toggle Function
function! ToggleLineNumber()
    if v:version > 703
        set number! relativenumber!
    endif
endfunction

" Line Number Toggle Hotkey
nnoremap <leader>n :call ToggleLineNumber() <CR>

