# ⚙️ Dotfiles (Dev Environment)

A curated and automated developer setup using GNU Stow for clean, modular configuration management. Currently only works on macOS with future plans for Linux support.

---

## 🚀 Overview

This repository contains personal configuration files (“dotfiles”) and a one-command setup script to bootstrap a full development environment.

### ✨ Features

- 🔗 Modular dotfiles management using GNU Stow
- ⚡ One-command setup for a fresh machine
- 🧰 Preconfigured tools for development, terminal, and productivity
- 🧼 Clean separation of configs by package


## 📦 Included Configurations


| Tool | Description |
|------|------------|
| `alacritty` | Terminal emulator configuration |
| `bat` | Enhanced `cat` with syntax highlighting |
| `btop` | Resource monitor |
| `ghostty` | GPU-accelerated terminal config |
| `git` | Git aliases and settings |
| `nvim` | Neovim IDE setup using Lazyim|
| `ohmyposh` | Custom shell prompt themes |
| `tmux` | Terminal multiplexer config |
| `zshrc` | Zsh shell configuration |

---

## ⚡ Quick Start (One-Line Install)

```
curl -fsSL https://raw.githubusercontent.com/ayushpandey2057/dotfiles/main/setup.sh | zsh
```
⚠️ Note: Always review scripts before running:

## 🛠️ Manual Installation

```
# Clone the repository
git clone https://github.com/ayushpandey2057/dotfiles.git ~/dotfiles

# Navigate into it
cd ~/dotfiles

# Make setup script executable
chmod +x setup.sh

# Run setup
./setup.sh
```

## 🔧 What the Setup Script Does

The setup.sh script will:

- 🖥️ Detect macOS environment
- 🍺 Install Homebrew (if not already installed)
- 📦 Install required packages and casks
- 📁 Clone the repository into `~/dotfiles`(if missing)
- 🔗 Symlink configurations using GNU Stow


## 🧠 How It Works
Each folder represents a Stow package. Running the setup script:
```
stow <package>
```
This creates symlinks like:
```
~/dotfiles/git/.config/git → ~/.config/git
```

This keeps your home directory clean and dotfiles directory version-controlled.


## 🔒 Safety & Customization

- Review setup.sh before running on a new system
- Modify or remove packages you don’t need
- Backup existing dotfiles if you have custom configs


## 🤝 Contributing / Forking

Feel free to fork this repo and adapt it to your workflow. Dotfiles are highly personal—make them yours.


## 📜 License

MIT License


## 💡 Future Improvements
- Linux support (different package managers)
- Selective package installation
- Dotfiles managers like chezmoi