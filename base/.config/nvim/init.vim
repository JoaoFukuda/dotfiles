nnoremap <SPACE> <Nop>
let mapleader=" "

call plug#begin()

" Language support
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'

" New functionalities
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'neovim/nvim-lspconfig'

" Better motion
Plug 'justinmk/vim-sneak'

" Utils
Plug 'godlygeek/tabular'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-fugitive'

" Improve other commands
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-submode'
Plug 'mg979/vim-visual-multi'

" Prettify
Plug 'nvim-lua/completion-nvim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

lua require('plugin_configs')
lua require('configs')
lua require('lsp_configs')
lua require('maps')

" Visual stuff and style {
augroup python
	autocmd!
	autocmd FileType python\|elixir setlocal ts=3 sw=3 tw=0 cindent noexpandtab smarttab autoindent wrap
augroup end
" }

autocmd FileType markdown\|html\|tex\|gitcommit set spell

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Submodes and their keybinds

" Resize windows
call submode#enter_with('resize', 'n', '', '<C-w><C-h>', '<C-w><')
call submode#enter_with('resize', 'n', '', '<C-w><C-j>', '<C-w>+')
call submode#enter_with('resize', 'n', '', '<C-w><C-k>', '<C-w>-')
call submode#enter_with('resize', 'n', '', '<C-w><C-l>', '<C-w>>')
call submode#leave_with('resize', 'n', '', '<Esc>')
call submode#map('resize', 'n', '', '<C-h>', '<C-w><')
call submode#map('resize', 'n', '', '<C-j>', '<C-w>+')
call submode#map('resize', 'n', '', '<C-k>', '<C-w>-')
call submode#map('resize', 'n', '', '<C-l>', '<C-w>>')


