let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/love2d-Projects/pong
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +192 main.lua
badd +10 push.lua
badd +25 class.lua
badd +18 Ball.lua
badd +19 Paddle.lua
badd +3 .gitignore
badd +0 term://.//1676492:zsh
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
tabedit main.lua
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 20 + 22) / 45)
exe '2resize ' . ((&lines * 20 + 22) / 45)
argglobal
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
24,55fold
73,75fold
77,78fold
80,80fold
85,85fold
87,87fold
89,89fold
94,94fold
72,98fold
106,106fold
109,109fold
111,113fold
108,132fold
105,133fold
147,147fold
149,149fold
141,168fold
172,174fold
24
normal! zo
72
normal! zo
105
normal! zo
108
normal! zo
141
normal! zo
let s:l = 70 - ((9 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
70
normal! 0
wincmd w
argglobal
if bufexists("term://.//1676492:zsh") | buffer term://.//1676492:zsh | else | edit term://.//1676492:zsh | endif
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
2wincmd w
exe '1resize ' . ((&lines * 20 + 22) / 45)
exe '2resize ' . ((&lines * 20 + 22) / 45)
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
