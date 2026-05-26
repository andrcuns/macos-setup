function log-info() {
  echo -e "\033[1;33m$1\033[0m"
}

function success() {
  echo -e "\033[1;32m$1\033[0m"
}

function dotfiles() {
  cd $(chezmoi source-path)
}

function dockerbash() {
  docker exec -it $1 bash -l
}
