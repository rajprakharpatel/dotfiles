## Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Export variable need for qt-theme
if type qtile >>/dev/null 2>&1
    set -x QT_QPA_PLATFORMTHEME qt5ct
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end


## Starship prompt
# if status --is-interactive
# source ("/usr/bin/starship" init fish --print-full-init | psub)
# end
# starship init fish | source

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \ck end-of-line
    bind -M insert \cn forward-word
    bind -M insert \ek history-token-search-backward
    bind -M insert \ej history-token-search-forward
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end


## Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


## Useful aliases
# Replace ls with exa or lsd or colorls
alias ls='lsd -al --color=always --group-dirs first' # preferred listing
alias la='lsd -a --color=always --group-dirs first' # all files and dirs
alias ll='lsd -l --color=always --group-dirs first' # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="lsd -a | egrep '^\.'"
alias hr 'history --merge'  # read and merge history from disk

# Replace some more things with better alternatives
[ ! -x /usr/bin/bat ] && [ -x /usr/bin/cat ] && alias cat='bat --style header --style rules --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short' # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl" # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias paru="paru --bottomup"

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"


#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

alias fay="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
## Import colorscheme from 'wal' asynchronously
# if type "wal" >> /dev/null 2>&1
# cat ~/.cache/wal/sequences
# end

# direnv hook fish | source
# set -g direnv_fish_mode disable_arrow    # trigger direnv at prompt only, this is similar functionality to the original behavior

## Run fetch if session is interactive and not inside floaterm
if status --is-interactive && ! type -q floaterm
    # paleofetch
    # colorscript random | skip 1
    pokemon-colorscripts -r
end

begin
    set --local AUTOJUMP_PATH /usr/share/fish/completions/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end


######################
#  custom functions  #
######################

function forget
    set -l cmd (commandline | string collect)
    printf "\nDo you want to forget '%s'? [Y/n]\n" $cmd
    switch (read | tr A-Z a-z)
        case n no
            commandline -f repaint
            return
        case y yes ''
            history delete --exact --case-sensitive -- $cmd
            commandline ""
            commandline -f repaint
    end
end

###############
#  Shortcuts  #
###############

bind -M insert \cg forget

# begin
# set --local SDK_PATH "$HOME/.sdkman/bin/sdkman-init.sh"
# if test -e $SDK_PATH
# bass source $SDK_PATH
# end
# end

# begin
# if test -e "/usr/share/nvm/init-nvm.sh"
# bass source "/usr/share/nvm/init-nvm.sh"
# end
# function nvm
# bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
# end
# end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# status --is-login; and status --is-interactive; and exec byobu-launcher

function tmux_chooser
  if test "$TMUX" != ""
    return
  end

  set session_count (tmux list-sessions | wc -l)
  set output_names (tmux list-sessions -F\#S)
  set i 1
  echo "Choose the session to attach: "
  for session in $output_names
    echo "  $i - $session"
    set i (math $i + 1)
  end
  echo "Or create a new session by entering a name for it"
  read -P '> ' input
  if test "$input" = ""
    tmux
  else if test "$input" = "nil"
    return
  else if begin ;
          string match -r '^[0-9]+$' "$input" > /dev/null ;
          and test "$input" -le "$session_count" ; end
    tmux a -t "$output_names[$input]"
  else
    tmux new -s "$input"
  end
end

# kubernetes completions
if command -v kubectl >/dev/null
    kubectl completion fish | source
end

if command -v thefuck > /dev/null
    thefuck --alias | source
end

if command -v pyenv > /dev/null
    pyenv init - | source
end

if command -v zoxide > /dev/null
   zoxide init --cmd j fish | source
end
