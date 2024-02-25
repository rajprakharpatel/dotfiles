#!/bin/sh

eval "$(/opt/homebrew/bin/brew shellenv)"

# alias edfstab="sudo sh -c "echo `blkid <Path of the LV> | awk '{print $2}' | sed 's/\"//g'` <Mount point of the LV> <File system type of the LV> defaults 0 0 >> /etc/fstab""
alias :q=exit
alias cls=clear
alias :e=vim
alias nn=nvim
alias tk=task
alias lc=lfcd
alias sk=taskwarrior-tui
alias lv=lvim
alias winzip="zip -9 -y -r -q"
alias gitsuperclean='git reset --hard; git clean --force -d -x'
alias myip='curl ipinfo.io'
alias glt='git log --oneline --decorate --graph --all'
alias glta='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias pa='source $HOME/ppec-venv/bin/activate'
alias paf='source $HOME/ppec-venv/bin/activate.fish'
alias potp='otp-cli show -1 gotp |grep -oE "[0-9]+\$"|tr -d "\n"'
alias prd='otp-cli show -1 gotp |grep -oE "[0-9]+\$"|tr -d "\n" | pbcopy'
alias stg='otp-cli show -1 stg |grep -oE "[0-9]+\$"|tr -d "\n" | pbcopy'
alias vpn='otp-cli show -1 vpn |grep -oE "[0-9]+\$"'


export TERM=xterm-256color
export FONTCONFIG_PATH=/etc/fonts/
export SDKMAN_DIR="$HOME/.sdkman"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export AMD_VULKAN_ICD=RADV
export BROWSER=brave
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export MAIL=thunderbird
export EDITOR="nvim"
export VISUAL="nvim"
export OPENER=dolphin
export HISTIGNORE='ls:cls:\:q:\:e:lf:lc:pwd'
export COPILOT="574C-8175"
export PYENV_ROOT="$HOME/.pyenv"
export SSH_ENV="$HOME/.ssh/agent-environment"
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/go"
export NODE_ENV="dev"
export CLICOLOR_FORCE=1

# Path eviornment variable
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/perl@5.18/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/usr/x86_64-w64-mingw32/bin:$PATH"
export PATH="$HOME/.config/nvim/scripts:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/scripts/:$PATH"
export PATH="$HOME/.config/composer/vendor/bin/:$PATH"
export PATH="$HOME/.sdkman/candidates/gradle/current/bin/:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/.config/emacs/bin"

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
