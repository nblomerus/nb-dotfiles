set tabstop=4 softtabstop=4
set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua//popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

nmap <C-n> :NERDTreeToggle<Cr>
