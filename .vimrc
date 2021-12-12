"                       OPTIONS
"   UI
set nocompatible
filetype plugin indent on           "   filetype, plugin, indent auto-detect
set bg=dark

"   ERGONOMIC
set ignorecase smartcase            "   ignore case except if uppercase used
set listchars=tab:>\ ,trail:-       "   strings to use for :list command
set nowrap                          "   disable screen line wrapping
set ruler                           "   cursor pos%[y:x] in statusline
set showcmd                         "   cursor pos%[y:x] in statusline
set shortmess-=S                    "   displays [x/y] for search pattern occurences
set wildmenu                        "   displays possible completion matches
set spelllang=en,fr                 "   spell lang suggestions
if empty(glob($DOTVIM . "/.spell"))
    exec 'silent !mkdir $DOTVIM/.spell'
endif
set spellfile=$DOTVIM/.spell/custom.utf-8.add

"   INDENTATION
set autoindent                      "   auto indent
set expandtab                       "   insert spaces instead tab
set shiftround                      "   indent to the nearest tab mark
set shiftwidth=4 tabstop=4          "   shift and tab width in spaces

"   PERFORMANCE
set lazyredraw                      "   increase macro fluidity
set ttimeoutlen=0                   "   mapping and keycode delays (fix esc)
set updatetime=100                  "   gitgutter update faster

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
set undofile                        "   enable undofiles
set viminfo+='100,<50,s10,h,n$DOTVIM/.viminfo " viminfo location

"                       MAPPINGS
nn sf :fin<Space>
nn se :e *
nn ss :b#<CR>
nn sb :ls<CR>:b<Space>
nn sd :bn\|bd#<CR>

nn xxv :e ~/.vimrc<CR>gi<Esc>
nn xxz :e ~/.zshrc<CR>gi<Esc>
nn xxt :e ~/.tmux.conf<CR>gi<Esc>

nn glhl :set hlsearch!<CR>
nn glli :set list!<CR>
nn glso :silent write\|source $MYVIMRC\|e<CR>zR

no ; :
no : ;
no <Space>w <C-W>

no x            <nop>
no s            <nop>
no X            <nop>
nn S            <nop>
nn Q            <nop>

"   keyboard fix
ino <Right>q <c-q>
no <Right>q <c-q>
ino <Right>w <c-w>
no <Right>w <c-w>
ino <Right>e <c-e>
no <Right>e <c-e>
ino <Right>r <c-r>
no <Right>r <c-r>
ino <Right>t <c-t>
no <Right>t <c-t>
ino <Right>a <c-a>
no <Right>a <c-a>
ino <Right>s <c-s>
no <Right>s <c-s>
ino <Right>d <c-d>
no <Right>d <c-d>
ino <Right>f <c-f>
no <Right>f <c-f>
ino <Right>g <c-g>
no <Right>g <c-g>
ino <Right>z <c-z>
no <Right>z <c-z>
ino <Right>x <c-x>
no <Right>x <c-x>
ino <Right>c <c-c>
no <Right>c <c-c>
ino <Right>v <c-v>
no <Right>v <c-v>
ino <Right>b <c-b>
no <Right>b <c-b>

ino <Right>xf <c-x><c-f>
no <Right>xf <c-x><c-f>
