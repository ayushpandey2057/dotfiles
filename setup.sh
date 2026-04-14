#!/bin/zsh
set -e
set -u
set -o pipefail

# ----------------------------
# 💻 OS detection
# ----------------------------

OS="$(uname)"

echo "💻 Detected OS: $OS"

# -----------------------------------
# 🛠️ Install Homebrew (if needed)
# -----------------------------------

if [ "$OS" = "Darwin" ]; then
      echo "🍎 macOS detected"
   if ! command -v brew >/dev/null 2>&1; then
      echo "🍺 Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo "✅ Homebrew installed."
   else
      echo "✅ Homebrew already installed."
   fi
   eval "$(/opt/homebrew/bin/brew shellenv)"
   echo "✅ Homebrew  configured."
else
   echo "🍎 Not MacOS. Do it yourself."
fi

# -----------------------------------
# 📦 Install Brew Packages
# -----------------------------------

echo "🔄 Installing brew packages..."
brew install \
  ansible awscli bat btop diff-so-fancy eza fastfetch fd fzf \
  gh git glib gnupg lazygit minikube neovim nvm oh-my-posh \
  ripgrep stow tmux tree zinit zoxide
echo "✅ Brew packages installed."

# -----------------------------------
# 🖥️ Install Brew Casks
# -----------------------------------
echo "🔄 Installing brew cask apps..."
brew install --cask \
  alacritty brave-browser discord docker-desktop folx font-meslo-lg-nerd-font \
  ghostty iina medis slack steam visual-studio-code whatsapp yaak
echo "✅ Brew cask apps installed."

# -----------------------------------
# 📁 Clone Dotfiles Repo
# -----------------------------------
echo "🔍 Checking for dotfiles repo..."
if [ ! -d "$HOME/dotfiles" ]; then
  echo "📥 Cloning dotfiles repo..."
  git clone https://github.com/ayushpandey2057/dotfiles.git "$HOME/dotfiles"
  echo "✅ Dotfiles cloned."
else
  echo "✅ Dotfiles already present at ~/dotfiles"
fi

# -----------------------------------
# 🔗 Stow Dotfiles
# -----------------------------------

echo "🔗 Stowing config packages → ~/.config"

cd "$HOME/dotfiles"

echo "🔗 Stowing dotfiles..."

for pkg in */; do
  pkg="${pkg%/}"
  echo "🔗 Stowing $pkg"
  stow -t ~ "$pkg"
done

echo "✅ All dotfiles stowed"

echo "✅ Done stowing dotfiles. Please restart your terminal to apply changes."
echo "👉 Tip: run 'nvim' to setup nvim using Lazyvim plugin"

# -----------------------------------
# 🎉 All Done!
# -----------------------------------
echo "🎉 Setup complete! Enjoy your new environment 😎"
