set shell=/bin/bash

"<C-i> is mapped to F20 in alacritty;
nnoremap <F20> <C-i>
inoremap fd <ESC>
vnoremap fd <ESC>
map <Space> <leader>

nnoremap <M-j> i<CR><ESC>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>ij o<Esc>k
nnoremap <leader>ik O<Esc>j
nnoremap <silent> <leader>f :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>d :Buffers<CR>
nnoremap <leader><Tab> <C-^>
nnoremap <leader>rl :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <C-s> :w<CR>
nnoremap <leader>s :BLines<CR>
nnoremap <silent><nowait> <space>w :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>k  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>q  :<C-u>CocList outline<cr>

"rebind macro as q is used for sneak
" nnoremap <leader>m q

nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>rn <Plug>(coc-rename)

map q <Plug>Sneak_s
map Q <Plug>Sneak_S

autocmd ColorScheme * hi Sneak guifg=black guibg=lightgreen ctermfg=black ctermbg=yellow
autocmd ColorScheme * hi SneakScope guifg=black guibg=lightgreen ctermfg=black ctermbg=yellow

noremap <Tab> >>_
vnoremap <Tab> >gv
inoremap <S-Tab> <C-d>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" so we want <S-Tab> to work in autocomplete, and unindent in both normal and insert mode
" <C-h> is backspace I think? But this seems to work well so whatever :)
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <S-Tab> <<_
vnoremap <S-Tab> <gv

set splitbelow
set splitright
set updatetime=250

"split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" use system clipboard
set clipboard=unnamedplus

filetype plugin indent on
set relativenumber
"set autoindent
set smartindent
set smarttab
set shiftwidth=4
set undofile
set undodir=~/.config/nvim/.vimdid
set undolevels=1000
" prevent vim from extending comments after pressing `o`
set formatoptions-=o
syntax enable

set background=dark
set t_Co=256

"fixes glitch? in colors when using vim with tmux
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufRead,BufEnter,BufNewFile * execute "set nospell"
autocmd BufRead,BufEnter,BufNewFile * execute "set colorcolumn=0"
autocmd BufRead,BufEnter,BufNewFile * execute "set hidden"

"remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre * :Autoformat

autocmd FileType fish,yaml let b:autoformat_autoindent=0
autocmd FileType typescript,javascriptreact,typescriptreact setlocal shiftwidth=2 tabstop=2

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre json,typescript,typescriptreact :Prettier<CR>


autocmd bufreadpre,bufnewfile *.bnf set ft=bnf
autocmd FileType fish compiler fish

"this is actually <C-/>
noremap <C-_> :call NERDComment(0,"toggle")<CR><CR>

let g:netrw_banner = 0

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'tpope/vim-sensible'
Plug 'killphi/vim-ebnf'
Plug 'vim-scripts/bnf.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/vader.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'chaoren/vim-wordmotion'
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate'
"Plug 'andyyu2004/vim-slash'
Plug 'alvan/vim-closetag'
Plug 'OmniSharp/omnisharp-vim'
Plug 'sheerun/vim-polyglot'
Plug 'dag/vim-fish'
Plug 'tpope/vim-eunuch'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/space-vim-dark'
Plug 'neoclide/jsonc.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'rhysd/vim-clang-format'
Plug 'stephpy/vim-yaml'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'rust-lang/rust.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'machakann/vim-swap'
Plug 'lervag/vimtex'
call plug#end()


colorscheme space-vim-dark
highlight HighlightedyankRegion cterm=reverse gui=reverse

let g:python3_host_prog="/home/leo/.pyenv/shims/python3.8"
let delimitMate_expand_cr=1

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    else
	call CocAction('doHover')
    endif
endfunction

" Remap for do codeAction of selected region
nmap <leader>. :<C-u>execute 'CocCommand actions.open '<CR>
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction



hi Comment    cterm=italic
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE

"lua require'nvim_lsp'.rust_analyzer.setup({})

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

set textwidth=100

let g:rooter_change_directory_for_non_project_files = 'current'
let g:rustfmt_autosave = 1
let g:NERDDefaultAlign = 'left'
let NERDSpaceDelims=1
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.jsx,*.tsx'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:coc_status_warning_sign = '-'
let g:coc_status_error_sign = '>'
let g:netrw_localrmdir='rm -r'
let g:clang_format#auto_format = 1


let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-pairs',
\ 'coc-rust-analyzer',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-vimlsp',
\ 'coc-highlight',
\ 'coc-actions',
\ 'coc-sql',
\ 'coc-omnisharp',
\ 'coc-python',
\ 'coc-clangd',
\ 'coc-yank',
\ ]

