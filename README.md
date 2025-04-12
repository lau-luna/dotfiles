# ⚙️ Lau's Dotfiles

Personal configuration files for Neovim and development environments. Designed for speed, clarity, and portability — across laptop, Raspberry Pi, and mobile (Termux).

## 📁 Structure

- `nvim/` — Neovim config using `lazy.nvim`, with plugins split into files inside `lua/j/plugins/`.
- `after/ftplugin/` — Filetype-specific overrides (indentation for PHP, HTML, etc).

## ✨ Features

### 🖊️ Neovim

- Plugin manager: [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- Syntax highlighting & indentation with `nvim-treesitter`
- Autocompletion with `nvim-cmp` and LSP
- Snippets via `LuaSnip`
- LSP servers:
  - HTML via `vscode-langservers-extracted`
  - PHP via `intelephense` or `phpactor`
  - **Java via `jdtls`** (configured through `lspconfig` and `mason`)
- Designed for:
  - Web development (HTML, PHP, JS)
  - Systems programming (C, Lua)
  - Java backend or desktop apps
  - Scripting and automation

### 🧠 Additional Plugins

- Treesitter playground
- Live server
- Emmet
- Toggleterm, Telescope, Bufferline, Which-key
- Custom color scheme: Gruvbox

## 🚀 Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

### 🧵 Option 1: Using GNU Stow
Recommended if you want to keep everything modular:

```bash
stow nvim
```

This will symlink the configuration files into `~/.config/`.

### 🪵 Option 2: Manual install

Copy the folders of the programs you want to configure:

```bash
cp -r nvim ~/.config/
cp -r git ~/.config/
```

> ⚠️ If the target folder already exists (e.g. ~/.config/nvim), you should delete it or back it up first to avoid conflicts:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
cp -r nvim ~/.config/
```

This setup assumes your system loads configuration files from ~/.config/, which is the default for most Linux environments.

## 📦 Dependencies

Make sure you have the following installed:

### 🧰 System Packages

- **Neovim (>= 0.9)**
- **Git**
- **Node.js and npm**
- **Java JDK** (for Java LSP)

### 🌐 LSP Servers and Tools

### 🖥️ Installing vscode-langservers-extracted (HTML LSP)

```bash
sudo npm install -g vscode-langservers-extracted
```

### 🖥️ Installing intelephense (PHP LSP)

```bash
sudo npm install -g intelephense
```

### 🖥️ Installing jdtls (Java LSP)

You can install **jdtls** (Java Development Tools Language Server) in two ways:

#### 1. Using Mason.nvim (Recommended)
If you use `mason.nvim`, you can install `jdtls` easily:

1. Add `mason.nvim` to your config if you haven't yet.
2. Run `:MasonInstall jdtls` in Neovim to install it.

#### 2. Using Your Distro's Package Manager

You can also install **jdtls** via your system's package manager:

- For **Ubuntu/Debian**: `sudo apt install jdtls`
- For **Fedora**: `sudo dnf install jdtls`
- For **Arch**: `sudo pacman -S jdtls`

#### 3. Manual Installation (If Needed)
Download the latest release from the [Eclipse JDTLS GitHub](https://github.com/eclipse/eclipse.jdt.ls) and configure Neovim to use it:

```lua
require'lspconfig'.jdtls.setup{
  cmd = { '/path/to/jdtls/bin/jdtls' }
}
