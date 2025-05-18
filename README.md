# Neovim Configuration


This repository contains my personal Neovim configuration files, designed to enhance productivity and streamline development workflows.

## Installation

Clone the repository to your local machine:

```bash
git clone git@github.com:isturiz/nvim.git ~/.config/nvim
```

## Requirements

Some plugins require additional system packages:

- **Node.js**: Required for various plugins. It's recommended to use [fnm](https://github.com/Schniz/fnm) for managing Node.js versions.

### Mason

The [Mason plugin](https://github.com/williamboman/mason.nvim) requires Node.js to be installed on your system.

## Project Structure

- **lua/config/**: Contains configuration files for Neovim settings and plugin initialization.
  - `lazy_init.lua`: Initializes the lazy.nvim plugin manager.
  - `options.lua`: Sets Neovim options.
  - `keymaps.lua`: Defines custom key mappings.

- **lua/plugins/**: Contains individual plugin configurations.
  - `avante.lua`, `cmp.lua`, `copilot-cmp.lua`, `codeium.lua`: Configuration files for specific plugins.

## Usage

1. **Install Plugins**: Open Neovim and run `:Lazy` to install all configured plugins.
2. **Update Plugins**: Use `:Lazy update` to update plugins to their latest versions.
3. **Configuration**: Modify the files in `lua/config/` and `lua/plugins/` to customize your setup.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or find any bugs.
