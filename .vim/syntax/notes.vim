" Simplified Markdown based on 'Tim Pope <vimNOSPAM@tpope.org>' markdown syntax file.
"
" au BufRead,BufNewFile $NOTES/* set filetype=notes
" dark:  0:black  1:red  2:green  3:yellow  4:blue  5:magenta  6:cyan  7:white
" light: 8:black  9:red 10:green 11:yellow 12:blue 13:magenta 14:cyan 15:white
"
" FG: for i in {0..255}; do printf '\e[38;5;%dm%3d ' $i $i; (((i+3) % 18)) || printf '\e[0m\n'; done
" BG: for i in {0..255}; do printf '\e[48;5;%dm%3d ' $i $i; (((i+3) % 18)) || printf '\e[0m\n'; done

"   SYNTAX:
"   -------

    " headers
    syn region notesH1 start="^##\@!"      end="#*\s*$"
    syn region notesH2 start="^###\@!"     end="#*\s*$"
    syn region notesH3 start="^####\@!"    end="#*\s*$"
    syn region notesH4 start="^#####\@!"   end="#*\s*$"
    syn region notesH5 start="^######\@!"  end="#*\s*$"
    syn region notesH6 start="^#######\@!" end="#*\s*$"
    " list
    syn match notesListMarker "^\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@="
    syn match notesOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@="
    syn match notesBlockquote "^>\%(\s\|$\)"
    " code
    syn region notesCodeBlock start="^    \|\t" end="$" skip="^    \|\t" contains=notesUrl
    " url
    syn match notesUrl "\v<(((https?|ftp|gopher|telnet)://|(mailto|file|news|about|ed2k|irc|sip|magnet):)[^' \t<>"]+|(www|web|w3)[a-z0-9_-]*\.[a-z0-9._-]+\.[^' \t<>"]+)[a-z0-9/]"

if has("conceal")
set conceallevel=2
set concealcursor=n
    " code
    syn region notesCode concealends matchgroup=notesDelimiter start="\S\@<=`\|`\S\@=" end="\S\@<=`\|`\S\@=" skip="\\`"
    " italic
    syn region notesItalic concealends matchgroup=notesDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" skip="\\\*"
    " bold
    syn region notesBold concealends matchgroup=notesDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" skip="\\\*"
    " bolditalic
    syn region notesBoldItalic concealends matchgroup=notesDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" skip="\\\*"
else
    " code
    syn region notesCode matchgroup=notesDelimiter start="\S\@<=`\|`\S\@=" end="\S\@<=`\|`\S\@=" skip="\\`"
    " italic
    syn region notesItalic matchgroup=notesDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" skip="\\\*"
    " bold
    syn region notesBold matchgroup=notesDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" skip="\\\*"
    " bolditalic
    syn region notesBoldItalic matchgroup=notesDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" skip="\\\*"
endif

    " task tag
    syn region notesTaskTag matchgroup=Normal start="\[" end="\]" oneline
    " task stamp
    syn region notesTaskStamp matchgroup=Normal start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" oneline
    " comment
    syn region notesComment matchgroup=Normal start="\[>>\]"      end="$"
    " escape
    syn match markdownEscape "\\[][\\`*_{}()<>#+.!-]"

"   COLORS:
"   -------

if &background == "dark"
    " HEADERS: vivid light green
    hi notesH1 ctermfg=85
    hi link notesH2 notesH1
    hi link notesH3 notesH1
    hi link notesH4 notesH1
    hi link notesH5 notesH1
    hi link notesH6 notesH1

    " LIST: vivid light green
    hi notesListMarker ctermfg=121
    hi link notesListMarker notesListMarker
    hi link notesOrderedListMarker notesListMarker

    " BLOCKQUOTE: light violet
    hi notesBlockquote ctermfg=147

    " CODE: pale light green
    hi notesCode ctermfg=151
    hi link notesCodeBlock notesCode

    " URLS: hot pink
    hi notesUrl cterm=underline ctermfg=205

    " ITALIC: pale light yellow
    hi notesItalic ctermfg=230
    " BOLD: vivid yellow
    hi notesBold ctermfg=221
    " bolditalic orange
    hi notesBoldItalic  ctermfg=209

    " TASK STAMP: dark grey
    hi notesTaskStamp ctermfg=240
    " TASK TAG: pale blue
    hi notesTaskTag ctermfg=110
    " NOTESCOMMENT: dark grey
    hi notesComment ctermfg=240

    " DELIMITER: dark grey
    hi notesDelimiter ctermfg=238
    " ESCAPE: dark grey
    hi markdownEscape ctermfg=105

elseif &background == "light"
    " HEADERS: vivid blue
    hi notesH1 ctermfg=33
    hi link notesH2 notesH1
    hi link notesH3 notesH1
    hi link notesH4 notesH1
    hi link notesH5 notesH1
    hi link notesH6 notesH1

    " LIST: light pale purple
    hi notesListMarker ctermfg=147
    hi link notesListMarker notesListMarker
    hi link notesOrderedListMarker notesListMarker

    " BLOCKQUOTE: light blue
    hi notesBlockquote ctermfg=93

    " CODE: pale dark green
    hi notesCode ctermfg=101
    hi link notesCodeBlock notesCode

    " URLS: hot pink
    hi notesUrl cterm=underline ctermfg=198

    " ITALIC: pale light yellow
    hi notesItalic ctermbg=230
    " BOLD: light yellow
    hi notesBold ctermbg=229
    " bolditalic pale red
    hi notesBoldItalic ctermfg=204

    " TASK STAMP: light grey
    hi notesTaskStamp ctermfg=253
    " TASK TAG: pale blue
    hi notesTaskTag ctermfg=74
    " NOTESCOMMENT: dark grey
    hi notesComment ctermfg=253

    " DELIMITER: light grey
    hi notesDelimiter ctermfg=255
    " ESCAPE: dark grey
    hi markdownEscape ctermfg=213

endif
