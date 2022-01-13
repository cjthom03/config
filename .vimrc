" Noah Ezekwugo  (Stolen from Josh Kuiros)
" .vimrc

set autoread
autocmd FocusGained * checktime

set nocompatible

" Use system clipboard
set clipboard=unnamed

" Turn file autodetect off, required for Vundle
filetype off

" Show relative line numbers
set number relativenumber
set noswapfile

" Make searches case-insensitive, unless they contain upper-case letters
set ignorecase
set smartcase
" Encoding is utf-8
set encoding=utf-8
set fileencoding=utf-8
" Enable matchit plugin, ships with vim and enhances '%'
" Required for vim-textobj-rubyblock
runtime macros/matchit.vim
" Automatically delete line breaks or automatically inserted
" Identation on insert mode backspace
set backspace=indent,eol,start
" Don't unload buffers when they are abandoned, stay in background
set hidden
" Set unix line endings
set fileformat=unix
" Unix for new bufferes and fallback line endings to dos
set fileformats=unix,dos
" Save up to 100 marks, enable capital marks
set viminfo='100,f1
" No redraw while running macros, registers, or other non-typed comments
set lazyredraw
" Indentation
set expandtab       " map tabs to sapces
set autoindent      " autoindent based on line above
set smartindent     " smarter indent for c-like languages
set shiftwidth=2    " 2 space tabs when reading
set softtabstop=2   " 2 space tabs in insert mode
set tabstop=2       " Set tab width to 2

" Spell check
set spelllang=en
set spellfile=$HOME/vim/spell/en.utf-8.add
set spell

" Autocmds
augroup WhiteSpace
  autocmd!
  autocmd BufEnter * EnableStripWhitespaceOnSave  " trim whitespace on save
augroup END
" Loads vim-plug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plug - used for Prettier
call plug#begin('~/.local/share/nvim/plugged')
" General Plugins
Plug 'scrooloose/nerdtree'            " Directory Tree
Plug 'vim-scripts/l9'                 " required for FuzzyFinder
Plug 'vim-airline/vim-airline'        " Status/tabline
Plug 'vim-airline/vim-airline-themes' " Status/tabline themes
Plug 'tpope/vim-surround'             " Editing, deleting strings, parentheses, brackets, etc
Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Search for files
Plug 'junegunn/fzf.vim'
"Plug 'rakr/vim-one'                   " Atom one dark theme
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ntpeters/vim-better-whitespace' " Trims trailing whitespace
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'qpkorr/vim-bufkill' " Close buffers without closing window with :BD
"Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
"Plug 'maxbrunsfeld/vim-yankstack'
Plug 'andrewradev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Asheq/close-buffers.vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'kana/vim-textobj-line'
Plug 'henrik/vim-reveal-in-finder'
" Plug 'ervandew/supertab' " Tab autocomplete
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-abolish'
" Web Dev Plugins
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }     " Javascript Highlighter
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                 " JSX Syntax Highlighter
Plug 'leafgarland/typescript-vim'                           " TypeScript Syntax Highlighter
Plug 'peitalin/vim-jsx-typescript'                          " TSX Syntax Highlighter
Plug 'alvan/vim-closetag'                                   " Autoclose HTML tags
Plug 'cakebaker/scss-syntax.vim'                            " SCSS Syntax Highlighter
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user', { 'for': 'ruby' } " Required for vim-textobj-rubyblock
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Markdown / Writing Plugins
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
"Plug 'tpope/vim-markdown'
"Plug 'jtratner/vim-flavored-markdown'
Plug 'JamshedVesuna/vim-markdown-preview' "Markdown Previewer

call plug#end()
" Neoformat
" vim-prettier is currently using a global executable
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier
    autocmd BufWritePre *.js,*.jsx Neoformat
augroup END
" Include .jsx syntax highlighting in .js files
let g:jsx_ext_required = 0
" Closetag
 " filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'
" Required for coffeescript
syntax enable               " Syntax highlighting
filetype plugin indent on
let mapleader=" "   " map space to leader
" NERDTree
nmap <leader>pt :NERDTreeTabsToggle<CR>
nmap <leader>pf :NERDTreeFind<CR>
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden=1

" FZF
map <C-b> :Buffers<CR>
map <C-f> :Ag<CR>
map <C-h> :History<CR>
map <C-p> :Files<CR>
map <C-t> :Tags<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" CtrlSF
nmap \ :CtrlSF
inoremap jj <ESC>
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To op <cpen a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>
" Buffers
nmap <leader>bd :BD<CR>                   " bufkill - close buffer without closing window
nmap <leader>bd! :bd!<CR>                 " close without saving changes
nmap <leader>bdo :CloseOtherBuffers<CR>   " close other buffers
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" Close quickfix window
nmap <leader>c :ccl<CR>
" Easier split navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>
" Remove highlighting on ESC
nnoremap <esc> :noh<return><esc>
set splitbelow
set splitright
" Ale
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
highlight ALEWarning  ctermbg=Black
highlight ALEWarningSign ctermbg=Black
highlight ALEErrorSign ctermbg=Black

" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
augroup Deoplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown,jsx setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end


" Theme
set background=dark " for the dark version
let g:one_allow_italics = 1

" Change color for matching parens
hi! MatchParen cterm=NONE,bold gui=NONE,bold  guibg=#eee8d5 guifg=NONE
"colo one

" Set ack to use the_silver_surfer
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/workspace/playground/vim-snippets'

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" 120 Character Color Column
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Markdown Soft Wrap Lines
augroup Markdown
 au!
 "au BufRead,BufNewFile *.md,*.markdown setlocal filetype=ghmarkdown
 au BufRead,BufNewFile *.md,*.markdown setlocal colorcolumn=80
 au BufRead,BufNewFile *.md,*.markdown setlocal softtabstop=4
 au BufRead,BufNewFile *.md,*.markdown setlocal shiftwidth=4
 au BufRead,BufNewFile *.md,*.markdown setlocal tabstop=4
augroup end

" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=0  "Generates preview with hotkey above and does NOT display images
    " Change ^^ to 1: to display images in preview when using hotkey
    " Change ^^ to 2: to display images and preview on buffers write (:w)
    " Change ^^ to 3: to ignore images but display preview on buffer write
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1 " Automatically remove the html preview file after rendering it in the browser

"Close Buffers
 nnoremap <silent> <C-q> :CloseBuffersMenu<CR>

 " Required for Operator Mono
hi htmlArg gui=italic
hi htmlArg cterm=italic
hi Comment gui=italic
hi Comment cterm=italic
" JSON
set conceallevel=0

" vim-pencil settings
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 80
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 1
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'c'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130
let g:pencil#map#suspend_af = 'K'
set nocursorcolumn
set nocursorline
" Ripgrep better search
"
" A:help
" Goyo
nmap <leader>g :Goyo<CR>
" Noah's QOL Mappings
map <CR> :w<CR>
map <leader>v :vert sb<CR>
map <leader>e :execute 'bufdo :e' <bar> syntax on <CR>
nnoremap <silent> Q gqap
xnoremap <silent> Q gq
nnoremap <silent> <leader>Q vapJgqap

