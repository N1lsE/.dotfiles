# ----- alias ----- #
#####################
alias ll='ls -la'
alias c='clear'
alias v='nvim'
alias v.='nvim .'
alias n='nvim'
alias n.='nvim . '
alias nvim.='nvim . '
alias help='selected_command=$(tldr -l | fzf --preview "tldr -C {1}" --preview-window=right,70%); tldr -C "$selected_command"'
alias helpman='selected_command=$(man -k . | awk "{split(\$0, a, \"(\"); print a[1]}" | fzf --preview "man {1}" --preview-window=right,70%); man "$selected_command"'
alias github='eval `ssh-agent`; ssh-add ~/.ssh/github'
alias pdf='tdf'
alias y='yazi'
alias yh='yazi ~/'

# ----- $PATH ----- #
#####################
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ----- What OS are we running? ----- #
# MacOS
if [[ $(uname) == "Darwin" ]]; then
  # add sdl2 to $Path
  export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib"
fi

# ----- oh-my-zsh ----- #
#########################
source $ZSH/oh-my-zsh.sh
plugins=(git)
ZSH_THEME="nilse-theme"
PROMPT="%F{1}%m%f%B|%b%F{6}%n%f %B%F{45}%~%f%b%F{1} > %f"

# ----- zoxide ----- #
######################
eval "$(zoxide init --cmd cd zsh)"

# ----- MacOS GamePortingToolKit ----- #
########################################
GAME_PORTING_TOOL_KIT_ENABLED=true
GAME_PORTING_TOOL_KIT_ENABLED=false
if [[ $(uname) == "Darwin" ]]; then
  # MACOS CONFIG
  if  [[ $GAME_PORTING_TOOL_KIT_ENABLED == true ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  # LINUX CONFIG
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi



export PATH="$PATH:/home/nils/.local/share/bob/nvim-bin"
export PATH="$PATH:/usr/share/dotnet"

# ----- tmux ----- #
######################
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

# Welcoming info
echo ""
echo "brew version running: `which brew`, `brew --version`"
nerdfetch
echo ""


# eval SSH_AUTH_SOCK=/tmp/ssh-XXXXXXd7Iv7N/agent.139110; export SSH_AUTH_SOCK;
# SSH_AGENT_PID=139111; export SSH_AGENT_PID;
alias switch_brew_x86="arch -x86_64 /usr/local/bin/brew; echo 'brew version running: `which brew`, `brew --version`\nsystem archetecture: `arch`'"
alias switch_brew_arm="arch -arm64  /opt/homebrew/bin/brew; echo 'brew version running: `which brew`, `brew --version`\nsystem archetecture: `arch`'"
# alias act="source .venv/bin/activate"
