"basic setting
let mapleader=' '

set fileencoding=utf-8

set scrolloff=5
" search setting
set hlsearch
set incsearch
set ignorecase
set smartcase
noremap <LEADER><CR> :nohl<CR>

function! SearchPlusPlus()
    call search("<++>", 'w')
endfunction

map <Leader><Leader> <Esc>/<++><CR>:nohl<CR>c4l
set hidden

" let backspace valid
set nocompatible
set backspace=indent,eol,start

" set indent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set cindent

" split screen
" quick split
map s <nop>
nnoremap sj :set splitbelow<CR>:sp<CR>
nnoremap sk :set nosplitbelow<CR>:sp<CR>
nnoremap sl :set splitright<CR>:vsp<CR>
nnoremap sh :set nosplitright<CR>:vsp<CR>
" resize
map <up> :res +2<CR>
map <down> :res -2<CR>
map <left> :vertical res -2<CR>
map <right> :vertical res +2<CR>

" code editor
syntax on 
set relativenumber 
set number
"set cursorline 
"set cursorcolumn
set showcmd

" parenthesis matching
inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap ( ()<Esc>i

" compile and run 
nnoremap <Leader>,r :!clear<CR>:call CompileRaceCpp()<CR>
function! CompileRaceCpp()
    execute "w"
    if &filetype == "cpp"
        execute "!g++ -std=c++11 -g % -o %<"
    endif
endfunction

" plug-in
call plug#begin('~/.vim/plugs')

Plug 'kien/rainbow_parentheses.vim'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'skywind3000/vim-auto-popmenu'
"Plug 'skywind3000/vim-dict'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'

" translate
Plug 'voldikss/vim-translator'
" code
Plug 'honza/vim-snippets'
" comment
Plug 'preservim/nerdcommenter'
" display

" indent
Plug 'Yggdroot/indentLine'
" themes
Plug 'morhetz/gruvbox'
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
" tools
" copy and paste
Plug 'ojroques/vim-oscyank'
call plug#end()

" plug config

" indentLine
set conceallevel=1

" themes

" snazzy
"color snazzy
"let g:SnazzyTransparent=1

" gruvbox
set background=dark
let g:gruvbox_transparent_bg=1
color gruvbox
" transparent background
hi Normal guibg=NONE ctermbg=NONE
" change Line number 
highlight LineNr ctermfg=DarkGreen

" rainbow_parentheses seetting
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-indent-guides setting
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 1
"let g:indent_guides_space_guides = 1

" vim-auto-popmenu setting
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
"let g:apc_enable_ft = {'text':1, 'md':1, 'cpp':1, 'markdown':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
"set cpt=.,k,w,b
" 不要自动选中第一个选项。
"set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
"set shortmess+=c

" coc.nvim config

let g:coc_global_extensions = [
           \'coc-json',
           \'coc-vimlsp',
           \'coc-pyright',
           \'coc-clangd',
           \'coc-snippets',
           \]


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-translator
let g:translator_target_lang="zh"
"let g:translator_proxy_url = 'socks5h://127.0.0.1:1089'
let g:translator_default_engines = ['haici', 'youdao']
" Echo translation in the cmdline
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vim-oscyank
vnoremap <leader>c :OSCYank<CR>
