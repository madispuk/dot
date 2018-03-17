call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'chriskempson/base16-vim'
Plug 'SirVer/ultisnips'
call plug#end()

filetype plugin indent on

set nocompatible
set ttyfast
set lazyredraw
set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     " Enable mouse mode
set noerrorbells       	        " No beeps
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set so=7
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set clipboard^=unnamed 	     "http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamedplus
set foldcolumn=1
set fillchars=""
set t_Co=256

" Fix some colors
hi CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
hi Visual cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
hi QuickFixLine cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
hi WildMenu cterm=NONE ctermbg=150 ctermfg=black guibg=150 guifg=black
hi StatusLine cterm=NONE ctermbg=237 ctermfg=249 guibg=237 guifg=249
hi clear VertSplit
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=150 guibg=237 guifg=249
hi FoldColumn ctermbg=0
set fillchars+=vert:│
highlight EndOfBuffer ctermfg=black ctermbg=black


"=====================================================
"===================== MAPPINGS ======================
"=====================================================
let mapleader = ' '
inoremap jk <esc>
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader>, :w<cr>
noremap Q <NOP>
map <leader>ev :e! ~/.vimrc<cr>

" textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" move between vim splits
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" Do not show stupid q: window
map q: :q

augroup filetypedetect
	command! -nargs=* -complete=help Help vertical belowright help <args>
	autocmd FileType help wincmd L
	autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
	autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
	autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
	autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
	autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
augroup END

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>

"=====================================================
"===================== PLUGINS =======================
"=====================================================

" NerdTree
" make it wider
let g:NERDTreeWinSize = 35
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$', '\.DS_Store$', "\.keep$"]
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" run the following command when brackets appear around nerdtree devicons
" let g:webdevicons_conceal_nerdtree_brackets = 1
" close Vim when NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

" vim-go
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

let g:go_sameid_search_enabled = 1

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"

let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1

let g:go_autodetect_gopath = 1
" let g:go_info_mode = "guru"
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_format_strings = 0

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []
