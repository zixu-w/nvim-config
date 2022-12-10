## Requirements

- [Homebrew](https://brew.sh)
- A patched font: [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts), [Powerline](https://github.com/powerline/fonts), etc.

## Install

Clone this repository anywhere you like, for example `~/.nvim-config`, and
run the `install.sh` script inside the repo.
```
git clone https://github.com/zixu-w/nvim-config.git ~/.nvim-config
cd ~/.nvim-config
./install.sh
```
It will install necessary packages, and create a symbolic link to the
configuration files at `~/.config/nvim`. Existing directory will be backed up.
