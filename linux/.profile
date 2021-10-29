#!/bin/sh

alias :q=exit
alias cls=clear
alias :e=vim
alias nn=nvim
alias tk=task
alias lc=lfcd
alias sk=taskwarrior-tui
alias lv=lvim
alias winzip="zip -9 -y -r -q"
alias mongo-azure="mongosh file-version-database.mongo.cosmos.azure.com:10255 -u file-version-database -p 5U57FfhLWY7vJ2CVBLBrSmjcGj1hyO6LtbWb69G1CC02RSVwJYjbdM67LgueqSGaoYFbyCrAt6bzIPfm2zsjPg== --ssl --sslAllowInvalidCertificates"

export TERM=alacritty
export FONTCONFIG_PATH=/etc/fonts/
export LC_CTYPE="en_IN.utf8"
export SDKMAN_DIR="$HOME/.sdkman"
export AMD_VULKAN_ICD=RADV
export BROWSER=brave
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export MAIL=kmail
export TERM=xterm
export LC_CTYPE="en_IN.utf8"
export EDITOR=vim
export VISUAL="nvim"
export OPENER=dolphin
export HISTIGNORE='ls:cls:\:q:\:e:lf:lc:pwd'
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/usr/x86_64-w64-mingw32/bin:$PATH"
export PATH="$HOME/.config/nvim/scripts:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export COPILOT="574C-8175"

# ln=:\  ex=:\ fi=:\ add below for links icon not necessary as a different color
# identifies links
export LF_ICONS="\
di=:\
or=:\
ex=:\
fi=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
