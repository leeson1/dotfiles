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
git clone git@github.com:leeson1/dotfiles.git ~/codes/docker_workspace/dotfiles
cd ~/codes/docker_workspace/dotfiles
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
source ~/codes/docker_workspace/dotfiles/zsh/starship.zsh
```

## 安装依赖

### macOS

使用 Homebrew：

```sh
brew install starship zoxide
```

### Linux

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
sudo pacman -S starship zoxide

# Fedora
sudo dnf install starship zoxide

# Debian 13+ / Ubuntu 25.04+
sudo apt install starship
```

说明：zoxide 官方文档不推荐在 Debian / Ubuntu 上直接使用旧仓库包；这类系统优先使用官方安装脚本或 Linuxbrew。

## 注意

- `nvim/lazy-lock.json` 会锁定当前 Neovim 插件版本。
- Ghostty 配置依赖 `MesloLGS Nerd Font Mono` 字体。
- Starship 配置使用 Nerd Font 图标，终端字体需要支持 Nerd Font。
- 安装方式参考 Starship 官方文档和 zoxide 官方 README。
- 这个仓库不保存私钥、token、密码等敏感信息。
