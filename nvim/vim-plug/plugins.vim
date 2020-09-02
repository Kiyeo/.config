call plug#begin('~/.config/nvim/autoload/plugged')
	"Better Syntax Support"
	Plug 'sheerun/vim-polyglot'
	"Conquer of Completion"
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Themes"
  Plug 'liuchengxu/space-vim-dark' 
  "Delete buffers without closing windows or messing up layouts"
  Plug 'moll/vim-bbye'
  "Clang formatter"
  Plug 'rhysd/vim-clang-format'
call plug#end()
