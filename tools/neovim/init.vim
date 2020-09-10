
call plug#begin()
" Theme plugin
Plug 'jcherven/jummidark.vim'

" Editor plugins
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'

" Language plugins
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Editor settings
set number
set cursorline
set noswapfile
set guicursor=
set shiftwidth=4
set tabstop=4

syntax enable
colorscheme jummidark

" Nerdtree settings
map <C-n> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree show nerdtree by default

let g:ctrlp_custom_ignore = '\v[\/](_build|deps|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
