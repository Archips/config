"                       GENERAL OPTIONS
" :h <option_name> pour voir le man (ou Shift+K sur le mot)
" :map <letter> ou just :map pour voir tout les mappings available
"   UI
set nocompatible
filetype plugin indent on           "   filetype, plugin, indent auto-detect
syntax on
set bg=dark

set nu

"   ERGONOMIC
set ignorecase smartcase            "   ignore case except if uppercase used
set listchars=tab:>\ ,trail:-       "   strings to use for :list command
set nowrap                          "   disable screen line wrapping
set ruler                           "   cursor pos%[y:x] in statusline
set showcmd                         "   cursor pos%[y:x] in statusline
set shortmess-=S                    "   displays [x/y] for search pattern occurrences
set wildmenu                        "   displays possible completion matches 
set spelllang=en,fr                 "   spell lang suggestions
if empty(glob($DOTVIM . "/spell"))
    exec 'silent !mkdir $DOTVIM/spell'
endif
set spellfile=$DOTVIM/spell/custom.utf-8.add

"   INDENTATION
set autoindent                      "   auto indent
set shiftround                      "   indent to the nearest tab mark
set expandtab						"	replace tabs with spaces
set shiftwidth=4 tabstop=4          "   shift and tab width in spaces "   PERFORMANCE set lazyredraw                      "   increase macro fluidity
set ttimeoutlen=0                   "   mapping and keycode delays (fix esc)

"   SECURITY
set belloff=all                     "   no more ring the bell
set history=9999                    "   extends cmdline history
set nomodeline secure               "   disables shell access / modelines
if empty(glob($DOTVIM . "/.backup"))
    exec 'silent !mkdir $DOTVIM/.backup'
endif
set backupdir=$DOTVIM/.backup/,/tmp//       "   backup files directory
if empty(glob($DOTVIM . "/.swp"))
    exec 'silent !mkdir $DOTVIM/.swp'
endif
set directory=$DOTVIM/.directory/,/tmp//    "   undo files directory
if empty(glob($DOTVIM . "/.undo"))
    exec 'silent !mkdir $DOTVIM/.undo'
endif
set undodir=$DOTVIM/.undo/,/tmp//           "   undo files directory
set undofile                                "   enable undofiles
set viminfo+='100,<50,s10,h,n$DOTVIM/.viminfo " viminfo location

"                       FILETYPE OPTIONS
"       MD
au BufRead,BufNewFile *.md
            \   set filetype=notes
            \ | setl textwidth=70
            \ | setl suffixesadd+=.md
            \ | setl expandtab
"   NOTES_NAV
au BufRead,BufNewFile *.md nn <silent><buffer> <Space><Tab> :silent lc %:h\|write<CR>gogf
au BufRead,BufNewFile *.md nn <silent><buffer> <Space><CR> mm:silent lc %:h\|write<CR>`m0gf5G
"   INDEX_GEN
au BufRead,BufNewFile *.md nn <silent><buffer> <Space># :silent
            \
            \ let @a=""\|g/^##/y A<CR>3G/#<CR>2kpo#INDEX<CR>------<Esc>0k
"   INDEX_NAV
au BufRead,BufNewFile *.md nn <silent><buffer> <Space>3 /<C-R>=getline('.')<CR>$<CR>zt

"   GREP
au BufRead,BufNewFile *.md com! -nargs=+ Grep exec 'grep! -i <args> $NOTES/*.md' | cw
"       C
au FileType c,cpp setl noexpandtab cindent tw=80
au FileType c,cpp setl syntax=off
au FileType c,cpp syn match Comment "\/\/.*$\|\/\*\_.\{-}\*\/"
"       PYTHON
au FileType python nn <buffer> <Space>5 :w\|lc %:h<CR>
            \:!clear; /usr/bin/python3 main.py<CR>


"                       MAPPINGS"
" saute dans l'index de mes notes
nn <Space>I :e $NOTES/Index.md<CR>gi<Esc>
" edit un fichier du current dir (ecris trois lettres et press tab)
nn se :e *
" retourne dans le buffer precedent
nn ss :b#<CR>
" liste les buffer ouverts pour sauter dedans
nn sb :ls<CR>:b<Space>
" delete current buffer
nn sd :bn\|bd#<CR>

nn <Space>= Mmmgo=G`mzz3<C-O>
no <space>w <C-w>
no s <nop>

"   toggle hilight search
nn glhl :set hlsearch!<CR>
"   toggle cursor line
nn glcl :set cursorline!<CR>
"   toggle invisible chars
nn glli :set list!<CR>
"   source vimrc
nn glso :silent write\|source $MYVIMRC\|e<CR>zR
no ; :
" syntax on

"                       PLUGINS

call plug#begin('~/.vim/.plugged')
Plug 'tpope/vim-commentary'
call plug#end()
