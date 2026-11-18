# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/andrejs/.docker/bin"
# End of Docker Desktop section.

# Load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Use bitwarden as ssh agent
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
