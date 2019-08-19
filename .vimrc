set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'maralla/completor.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

se nocompatible
set number
set nowrap
set showmatch
set encoding=utf-8
set fenc=utf-8
set mouse=a
set hlsearch
syntax enable

set clipboard=unnamed

au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> za
set foldmethod=indent
set foldlevel=99

let g:completor_python_binary='/home/lizishi/anaconda3/bin/python3.7'
let g:completor_python_binary='/home/lizishi/anaconda3/envs/pytorch/bin/python3.6'
let g:completor_min_chars=3
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>" 

set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" 总是显示状态栏
let laststatus = 2
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
let g:airline_theme="dark"      " 设置主题
let g:Powerline_symbols = 'fancy'
" 开启tabline
" let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
" let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
" let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
" let g:airline#extensions#tabline#buffer_nr_show = 1
au BufNewFile *.py exec ":call SetTitle()"

func SetTitle()
	if &filetype == 'python'
		call setline(1, "\#######################################")
                call append(line("."), "\#     > File Name: ".expand("%"))
                call append(line(".")+1, "\#     > Author: lizishi")
                call append(line(".")+2, "\#     > Mail: Mrblack_lizs@outlook.com ")
                call append(line(".")+3, "\#     > Created Time: ".strftime("%c"))
                call append(line(".")+4, "\######################################################")
                call append(line(".")+5, "#!/home/lizishi/anaconda3/envs/pytorch/bin/python")
                call append(line(".")+6, "# -*- coding:utf-8 -*-")
                call append(line(".")+7, "")
	else
		call setline(1, "/*************************************************************************")
                call append(line("."), "      > File Name: ".expand("%"))
                call append(line(".")+1, "      > Author: lizishi")
                call append(line(".")+2, "      > Mail: Mrblack_lizs@outlook.com ")
                call append(line(".")+3, "      > Created Time: ".strftime("%c"))
                call append(line(".")+4, " **********************************************************************/")
                call append(line(".")+5, "")
        endif

endfunc
autocmd BufNewFile * normal G
