"set tabstop=4                  " number of visual spaces per TAB
set colorcolumn=1,5,9,13,17,21,72,79
highlight ColorColumn ctermbg=7
"highlight ColorColumn ctermbg=Grey
set shiftwidth=4
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " tabs are spaces
set autoindent
"set number                      " show line numbers
set ruler
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
filetype indent on              " load filetype-specific indent files
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.
set showmatch                   " highlight matching [{()}]
set incsearch                   " search as characters are entered
"set hlsearch                    " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent           " fold based on indent level
" highlight last inserted text
nnoremap gV `[v`]
autocmd Filetype yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 ai colorcolumn=1,3,5,7,9,11,13,15,17,19,21,23,79
