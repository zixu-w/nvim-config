#!/usr/bin/env bash
set -eu

# Check for Homebrew.
if ! command -v brew &> /dev/null; then
  echo "Homebrew is required!"
  exit 1
fi

# Ensure we're in the correct working directory that contains this script.
working_dir="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
if [[ "${working_dir}" != "$(pwd)" ]]; then
  pushd -- "${working_dir}"
  trap popd EXIT
fi

# Install from Brewfile.
echo "Installing..."
brew bundle

nvim_config_path="${HOME}/.config/nvim"
current_link="$(readlink -- "${nvim_config_path}" || true)"

# If ~/.config/nvim is already a symlink targeting us, we can skip it.
if [[ "${current_link}" == "$(pwd)/nvim" ]]; then
  echo "'${nvim_config_path}' is already correctly linked, skip linking."
else
  # Backup existing files.
  if test -d "${nvim_config_path}"; then
    echo "'${nvim_config_path}' already exists, backing up..."
    timestamp="$(date +"%Y-%m-%d-%H-%M-%S")"
    backup_path="${nvim_config_path}_${timestamp}"
    mv -- "${nvim_config_path}" "${backup_path}"
    echo "Existing configuration backed up to '${backup_path}'"
  fi

  # Create a symlink at ~/.config/nvim that points to config files here.
  echo "Creating link to configuration..."
  ln -sf -- "$(pwd)/nvim" "${nvim_config_path}"
fi

# Headlessly run the PackerSync command to initialize/update all plugins.
# Quit at the PackerComplete event.
echo "Initializing Packer plugins..."
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
