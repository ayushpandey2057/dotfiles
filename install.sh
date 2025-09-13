#!/bin/zsh
set -e

# -----------------------------------
# 🛠️ 1. Install Homebrew (if needed)
# -----------------------------------
echo "🔍 Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "📦 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "✅ Homebrew installed."
else
  echo "✅ Homebrew already installed."
fi

# -----------------------------------
# 📦 2. Install Brew Packages
# -----------------------------------
echo "\n🔄 Installing brew packages..."
brew install \
  ansible awscli bat btop diff-so-fancy eza fastfetch fd fzf \
  gh git glib gnupg lazygit minikube neovim nvm oh-my-posh \
  ripgrep stow tmux tree zinit zoxide
echo "✅ Brew packages installed."

# -----------------------------------
# 🖥️ 3. Install Brew Casks
# -----------------------------------
echo "\n🔄 Installing brew cask apps..."
brew install --cask \
  alacritty brave-browser discord docker-desktop folx font-meslo-lg-nerd-font \
  ghostty iina medis slack steam visual-studio-code whatsapp yaak
echo "✅ Cask apps installed."

# -----------------------------------
# 📁 4. Clone Dotfiles Repo
# -----------------------------------
echo "\n🔍 Checking for dotfiles repo..."
if [ ! -d "$HOME/dotfiles" ]; then
  echo "📥 Cloning dotfiles repo..."
  git clone https://github.com/ayushpandey2057/dotfiles.git "$HOME/dotfiles"
  echo "✅ Dotfiles cloned."
else
  echo "✅ Dotfiles already present at ~/dotfiles"
fi

# -----------------------------------
# 🔗 5. Stow Dotfiles
# -----------------------------------
echo "\n🔗 Stowing dotfiles..."
cd "$HOME/dotfiles"
stow .
echo "✅ Dotfiles linked to home directory."

# -----------------------------------
# 🚀 6. Launch Ghostty and Setup Prompt
# -----------------------------------
echo "\n🚀 Launching Ghostty..."
open -a Ghostty

echo "✅ Ghostty launched. If Oh My Posh is installed, your prompt will be styled."


# -----------------------------------
# 🚀 6. Launch Ghostty and Setup Prompt
# -----------------------------------
echo "\n🚀 Launching Neovim..."
open -a Ghostty --args -e nvim

echo "✅ Neovim init with Ghostty"

# -----------------------------------
# 🎉 All Done!
# -----------------------------------
echo "\n🎉 Setup complete! Enjoy your new environment 😎"
