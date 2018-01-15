set nocompatible " 오리지날 VI와 호환하지 않음
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'othree/html5.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/L9'

call plug#end()
filetype indent on "  파일 종류에 따른 구문강조

let mapleader = ","


colorscheme office-dark
let g:office_dark_LineNr = 'off'
let g:office_light_LineNr = 'off'

" colorscheme forgotten-dark
" let g:forgotten_dark_LineNr = 'off'
" let g:forgotten_light_LineNr = 'off'


" set background=dark
" set termguicolors
" colorscheme material-monokai
" let g:materialmonokai_subtle_spell=1
" let g:airline_theme='materialmonokai'


" colorscheme vrunchbang-dark
" let g:vrunchbang_dark_LineNr = 'off'
" let g:vrunchbang_light_LineNr = 'off'

set t_Co=256

" folding 관련
set foldmethod=syntax
set foldnestmax=100
set nofoldenable
set foldlevel=0

set number
set nolist " 
set textwidth=80
set ruler
set number
set cursorline " 커서가 있는 라인 하이라이팅


" indent 관련 옵션 
set autoindent  " 자동 들여쓰기
set cindent " C 프로그래밍용 자동 들여쓰기
set smartindent " 스마트한 들여쓰기




" 자동완성 관련 옵션
set showmatch " 매칭되는 괄호를 보여줌
set wmnu " tab 자동완성시 가능한 목록을 보여줌

" 파일/디렉토리명 자동완성 할 때 무시할 패턴
set wildignore=*.o,*.bak,.*.swap,*.pyc
set wildmenu " command-line 자동 완성 기능

" 화면 넘어가는 경우 한 라인을 여러줄로 표시
set wrap
set linebreak       " 라인을 끊을 때 단어 단위로 자릅니다.
set showbreak=+++\  " 윗 줄과 연결되는 줄은 '+++ ' 로 시작되어 알아볼 수 있게 합니다.



" Tab 관련 옵션
set cindent
set autoindent
set softtabstop=4
set expandtab " 탭대신 스페이스
set ts=4 " Tab 너비
set shiftwidth=4 " 자동 들여쓰기 4칸


" 파일 인코딩 관련
scriptencoding utf-8
set encoding=utf-8


" 검색 관련 옵션
set nowrapscan " 
set hlsearch " 검색어 강조, set hls 도 가능
set ignorecase
set smartcase " 대소문자 있으면 구분
set incsearch " 키워드 입력시 점진적 검색


set visualbell " 키를 잘못눌렀을 때 화면 프레시
set title " 제목을 표시
set mouse=a
set backspace=eol,start,indent "  줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000 "  vi 편집기록 기억갯수 .viminfo에 기록

" 마지막으로 수정된 곳에 커서를 위치함
" au BufReadPost *
" \ if line("'\"") > 0 && line("'\"") <= line("$") |
" \ exe "norm g`\"" |
" \ endif

set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\


" 구문 강조 사용
if has("syntax")
 syntax on
endif


" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"


" vim-cpp-enhanced-highlight 관련 세팅
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let c_no_curly_error=1


" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }


" html5.vim configure
" Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0
" Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0
" Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0
" Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0


nnoremap <F2> :w

" buffer 관련 map
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>


nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
