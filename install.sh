#!/usr/bin/env bash
set -eu

if ! command -v brew &> /dev/null; then
  echo "Homebrew is required!"
  exit 1
fi

echo "Installing..."
brew bundle

nvim_config_path=${HOME}/.config/nvim

current_link=$(readlink ${nvim_config_path})
if [[ ${current_link} == $(pwd)/nvim ]]; then
  echo "'${nvim_config_path}' is already correctly linked, skip linking."
else
  if test -d ${nvim_config_path}; then
    echo "'${nvim_config_path}' already exists, backing up..."
    timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
    backup_path=${nvim_config_path}_${timestamp}
    mv ${nvim_config_path} ${backup_path}
    echo "Existing configuration backed up to '${backup_path}'"
  fi

  echo "Creating link to configuration..."
  ln -sf $(pwd)/nvim ${nvim_config_path}
fi

echo "Initializing Packer plugins..."
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
