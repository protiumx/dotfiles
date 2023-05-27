```
    ____        __  _____ __
   / __ \____  / /_/ __(_) /__  _____
  / / / / __ \/ __/ /_/ / / _ \/ ___/
 / /_/ / /_/ / /_/ __/ / /  __(__  )
/_____/\____/\__/_/ /_/_/\___/____/
```

[![shellcheck](https://github.com/protiumx/.dotfiles/actions/workflows/shell.yml/badge.svg)](https://github.com/protiumx/.dotfiles/actions/workflows/shell.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

My dotfiles to set up a dev environment in a **MacOS** machine.
The `dotfiles` script installs all the packages and apps I use, [stow](https://www.gnu.org/software/stow/) my dotfiles and sets all my preferred MacOS configurations.

Check my [Medium article](https://medium.com/@protiumx/bash-gnu-stow-take-a-walk-while-your-new-macbook-is-being-set-up-351a6f2f9225).

## Previews

![preview 1](./preview-1.png)

![preview 2](./preview-2.png)

## Apps
Main apps installed:
- Terminal: [Wezterm](https://wezfurlong.org/wezterm/)
- Text Editor: [neovim](https://neovim.io/)
- Browser: Chrome, Firefox
- Music: Spotify
- Video: VLC

For more details check the [apps](./scripts/apps.sh) script.

## Neovim Plugins

Main plugins are:
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)

Theme: [gruvbox](https://github.com/ellisonleao/gruvbox.nvim)

Check the `packer` config [file](./stow/nvim/.config/nvim/lua/config/packer.lua)

### CLI
All CLI apps are listed in the [packages](./scripts/packages.sh) script.

## Installing

Run the `dotfiles` script:
```sh
curl -sO https://raw.githubusercontent.com/protiumx/.dotfiles/main/dotfiles
```

## Reusing

In order to reuse these scripts, here a summary of files you can change/adapt to your needs:

- `scripts/packages.sh`: all the `homebrew` taps and packages to install
- `scripts/fonts.sh`: `homebrew` fonts to install
- `scripts/apps.sh`: `homebrew` casks to install
- `scripts/osx.sh`: **MacOS** settings
- `scripts/config.sh`: general settings and dotfiles

## Testing Stow

Simulate `stow` links

```sh
stow -nSv vim
```

## License
Licensed under MIT, © Brian Mayo 2022: https://protiumx.dev
