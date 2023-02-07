" PLUGINS
" call plug#begin('~/.config/nvim/autoload/plug.vim')
call plug#begin('~/.config/nvim')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
call plug#end()

" OPTIONS
set nowrap		" Don't wrap text
set nohlsearch		" Don't hightlight search results
set number
set relativenumber
set colorcolumn=120
set background=dark
colorscheme gruvbox

" KEYBINDINGS
let mapleader = ' '
" Normal
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>/ :Commentary<CR>
nnoremap <leader>w :%s/\s\+$//<CR>



" Terminal
tnoremap <Esc> <C-\><C-n>:bd!<CR>

" NERDTREE
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END
