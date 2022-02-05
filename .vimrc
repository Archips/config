"                       GENERAL OPTIONS
" :h <option_name> pour voir le man (ou Shift+K sur le mot)
" :map <letter> ou just :map pour voir tout les mappings available
"   UI
set nocompatible
filetype plugin indent on           "   filetype, plugin, indent auto-detect
syntax on
set bg=dark

set nu

set mouse=a

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
set shiftwidth=4 tabstop=4          "   shift and tab width in spaces

"   PERFORMANCE
set lazyredraw                      "   increase macro fluidity
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

"                       C OPTIONS
au FileType c,cpp setl noexpandtab cindent tw=80
au FileType c,cpp setl syntax=off
"                       PYTHON OPTIONS
au FileType python nn <buffer> <Space>5 :w\|lc %:h<CR>
            \:!clear; /usr/bin/python3 main.py<CR>


"                       MAPPINGS"
nn se :e *
nn ss :b#<CR>
nn sb :ls<CR>:b<Space>
nn sd :bn\|bd#<CR>

no <space>= mmgo=G`mzz
no <space>w <C-w>
no s <nop>

nn glhl :set hlsearch!<CR>
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
