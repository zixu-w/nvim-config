#!/usr/bin/env bash
set -eu

if ! command -v brew &> /dev/null; then
  echo "Homebrew is required!"
  exit 1
fi

echo "Installing..."
brew bundle

nvim_config_path=${HOME}/.config/nvim

if test -d ${nvim_config_path}; then
  echo "'${nvim_config_path}' already exists, backing up..."
  timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
  backup_path=${nvim_config_path}_${timestamp}
  mv ${nvim_config_path} ${backup_path}
  echo "Existing configuration backed up to '${backup_path}'"
fi

echo "Copying configuration..."
ditto nvim ${nvim_config_path}

echo "Initializing Packer plugins..."
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
