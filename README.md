# dotfiles

个人开发环境配置仓库，用来管理常用工具的配置文件。

## 内容

```text
nvim/       Neovim 配置
ghostty/    Ghostty 终端配置
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
mkdir -p ~/.config ~/.config/ghostty

ln -sfn "$PWD/nvim" ~/.config/nvim
ln -sfn "$PWD/ghostty/config" ~/.config/ghostty/config
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
brew install neovim starship zoxide tree-sitter-cli ripgrep
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

# Fedora
sudo dnf install neovim starship zoxide tree-sitter-cli ripgrep

# Debian 13+ / Ubuntu 25.04+
sudo apt install starship ripgrep
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

## Git 编辑器

把 Git 默认编辑器改成 Neovim：

```sh
git config --global core.editor "nvim"
```

如果还想让其他命令默认使用 Neovim，可以把下面这行放到 `~/.zshrc`：

```sh
export EDITOR="nvim"
```

## 版本要求

当前 Neovim 配置建议使用：

```text
Neovim >= 0.12
```

原因是 `nvim-treesitter` 使用的是 main 分支，当前要求 Neovim 0.12.0 或更新版本。当前本机验证版本是 `NVIM v0.12.2`。

## 注意

- `nvim/lazy-lock.json` 会锁定当前 Neovim 插件版本。
- Ghostty 配置依赖 `MesloLGS Nerd Font Mono` 字体。
- Neovide / GUI Neovim 配置依赖 `JetBrainsMono Nerd Font` 字体。
- Snacks picker 的全文搜索依赖 `ripgrep` 提供 `rg` 命令。
- Starship 配置使用 Nerd Font 图标，终端字体需要支持 Nerd Font。
- 安装方式参考 Starship 官方文档和 zoxide 官方 README。
- 这个仓库不保存私钥、token、密码等敏感信息。
