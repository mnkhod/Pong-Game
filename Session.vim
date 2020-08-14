let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/love2d-Projects/pong
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +98 main.lua
badd +10 push.lua
badd +25 class.lua
badd +46 Ball.lua
badd +19 Paddle.lua
badd +3 .gitignore
badd +0 term://.//1668888:zsh
argglobal
%argdel
$argadd main.lua
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
enew
file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
tabedit Ball.lua
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 73 + 83) / 167)
exe '2resize ' . ((&lines * 20 + 22) / 45)
exe 'vert 2resize ' . ((&columns * 93 + 83) / 167)
exe '3resize ' . ((&lines * 20 + 22) / 45)
exe 'vert 3resize ' . ((&columns * 93 + 83) / 167)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 46 - ((29 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 0
wincmd w
argglobal
if bufexists("main.lua") | buffer main.lua | else | edit main.lua | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
39,41fold
24,53fold
108,110fold
112,113fold
115,115fold
120,120fold
122,122fold
124,124fold
106,130fold
138,138fold
141,141fold
143,145fold
140,146fold
137,147fold
161,161fold
163,163fold
155,182fold
188,190fold
let s:l = 65 - ((4 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
65
normal! 0
wincmd w
argglobal
if bufexists("term://.//1668888:zsh") | buffer term://.//1668888:zsh | else | edit term://.//1668888:zsh | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 73 + 83) / 167)
exe '2resize ' . ((&lines * 20 + 22) / 45)
exe 'vert 2resize ' . ((&columns * 93 + 83) / 167)
exe '3resize ' . ((&lines * 20 + 22) / 45)
exe 'vert 3resize ' . ((&columns * 93 + 83) / 167)
tabnext 2
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
