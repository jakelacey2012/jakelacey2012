call plug#begin()
Plug 'jcherven/jummidark.vim'
Plug 'preservim/nerdtree'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

set number
set tabstop=2
syntax enable
colorscheme jummidark

map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

