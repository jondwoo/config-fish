set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

#
### ALIAS
#
# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

# functions
function kanban
    cd ~/dev/ngc/kanban/kanban-webapp

    # Use -d to allow the rest of the function to run
      tmux new-session -d -s kanban -n ide


    # -d to prevent current window from changing
      tmux new-window -d -n terminal
      tmux new-window -d -n git
      tmux new-window -d -n reverse-proxy -c "../../reverse-proxy"

    # -d to detach any other client (which there shouldn't be,
    # since you just created the session).
      tmux attach-session -t kanban
end

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH


# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end


# pnpm
set -gx PNPM_HOME "/Users/jondwoo/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
