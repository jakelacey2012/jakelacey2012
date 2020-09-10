call plug#begin()
Plug 'jcherven/jummidark.vim'
Plug 'preservim/nerdtree'
call plug#end()

set number
syntax enable
colorscheme jummidark

map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
