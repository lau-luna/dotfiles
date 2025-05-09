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
git clone https://github.com/lau-luna/dotfiles ~/.dotfiles
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
- **Tex Live** (LaTeX compiler)
  
### 🌐 LSP Servers and Tools

### 🖥️ Installing vscode-langservers-extracted (HTML LSP)

```bash
sudo npm install -g vscode-langservers-extracted
```

### 🖥️ Installing intelephense (PHP LSP)

```bash
sudo npm install -g intelephense
```

### 🖥️ Installing Tex Live (LaTeX compiler)

You can install **Tex Live** via your system's package manager:
- For **Ubuntu/Debian** (only the necessary packages):
  ```bash
  sudo apt install texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended
  ```

- For **Ubuntu/Debian** (full installation):
  ```bash
  sudo apt install texlive-full
  ```

- For **Arch** (only the necessary packages):
  ```bash
  sudo pacman -S texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended
  ```

- For **Arch** (full installation):
  ```bash
  sudo pacman -S texlive-full
  ```

### 📄 Installing Zathura (PDF viewer)

When you compile LaTex with <leader>v, it opens a zathura window with your project PDF.

You can install **zathura** via your system's package manager:

- For **Ubuntu/Debian**:
  ```bash
  sudo apt install zathura zathura-pdf-poppler
  ```

- For **Arch**:
  ```bash
  sudo pacman -S zathura zathura-pdf-poppler
  ```

### Dependencies for Telescope and Treesitter

#### 📡 Telescope

Telescope requires the following binaries:

- For **Ubuntu/Debian**:
  ```bash
  sudo apt install ripgrep fd-find
  ```

- For **Arch**:
  ```bash
  sudo pacman -S ripgrep fd-find
  ```

#### 🌲 Treesitter

Treesitter automatically installs its parsers, but it needs build tools:

- For **Ubuntu/Debian**:
  ```bash
  sudo apt install build-essential ninja-build
  ```

- For **Arch**:
  ```bash
  sudo pacman -S build-essential ninja-build
  ```
