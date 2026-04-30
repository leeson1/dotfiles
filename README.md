# dotfiles

个人开发环境配置仓库，用来管理常用工具的配置文件。

## 内容

```text
nvim/       自定义 Neovim 配置
ghostty/    Ghostty 终端配置
neovide/    Neovide 配置
starship/   Starship prompt 配置
zsh/        Zsh 初始化片段
```

## 使用

克隆仓库：

```sh
git clone git@github.com:leeson1/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
```

建立符号链接：

```sh
mkdir -p ~/.config ~/.config/ghostty ~/.config/neovide

ln -sfn "$PWD/nvim" ~/.config/nvim
ln -sfn "$PWD/ghostty/config" ~/.config/ghostty/config
ln -sfn "$PWD/neovide/config.toml" ~/.config/neovide/config.toml
ln -sfn "$PWD/starship/starship.toml" ~/.config/starship.toml
```

Zsh 初始化片段在：

```text
zsh/starship.zsh
```

它会初始化 zoxide 和 Starship。可以在 `~/.zshrc` 中引用：

```sh
source ~/workspace/dotfiles/zsh/starship.zsh
```

## 安装依赖

### macOS

使用 Homebrew：

```sh
brew install neovim starship zoxide tree-sitter-cli ripgrep fd
```

安装字体：

```sh
brew install --cask font-meslo-lg-nerd-font font-jetbrains-mono-nerd-font
```

### Linux

Neovim 官方预编译包：

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

把 Neovim 加到 shell PATH：

```sh
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

Starship 官方安装脚本：

```sh
curl -sS https://starship.rs/install.sh | sh
```

zoxide 官方安装脚本：

```sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

也可以使用发行版包管理器：

```sh
# Arch / Manjaro
sudo pacman -S neovim starship zoxide tree-sitter-cli ripgrep
sudo pacman -S fd

# Fedora
sudo dnf install neovim starship zoxide tree-sitter-cli ripgrep
sudo dnf install fd-find

# Debian 13+ / Ubuntu 25.04+
sudo apt install starship ripgrep
sudo apt install fd-find
```

说明：Debian / Ubuntu 仓库里的 Neovim 和 zoxide 版本可能偏旧；这类系统优先使用 Neovim 官方预编译包、zoxide 官方安装脚本或 Linuxbrew。

安装字体：

```sh
# Debian / Ubuntu
sudo apt install unzip fontconfig

# Fedora
sudo dnf install unzip fontconfig

# Arch / Manjaro
sudo pacman -S unzip fontconfig

mkdir -p ~/.local/share/fonts/Meslo ~/.local/share/fonts/JetBrainsMono
curl -fLo /tmp/Meslo.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
curl -fLo /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o /tmp/Meslo.zip -d ~/.local/share/fonts/Meslo
unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
```

## Neovim 配置选择

Neovim 配置二选一即可。

使用仓库里的 `nvim/` 配置：

```sh
ln -sfn ~/workspace/dotfiles/nvim ~/.config/nvim
```

或者直接使用 LazyVim starter：

```sh
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null || true
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null || true

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

LazyVim 还建议安装 Nerd Font、C 编译器、`ripgrep`、`fd`，并可选安装 `lazygit`。本 README 的依赖安装命令里已经包含 `ripgrep` 和 `fd`。

如果之后想从 LazyVim 切回仓库配置：

```sh
mv ~/.config/nvim ~/.config/nvim.lazyvim.bak 2>/dev/null || true
ln -sfn ~/workspace/dotfiles/nvim ~/.config/nvim
```

参考：<https://www.lazyvim.org/>

## Git 编辑器

把 Git 默认编辑器改成 Neovim：

```sh
git config --global core.editor "nvim"
```

如果还想让其他命令默认使用 Neovim，可以把下面这行放到 `~/.zshrc`：

```sh
export EDITOR="nvim"
```
