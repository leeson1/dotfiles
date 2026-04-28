# dotfiles

个人开发环境配置仓库，用来管理常用工具的配置文件。

## 内容

```text
nvim/       Neovim 配置
ghostty/    Ghostty 终端配置
starship/   Starship prompt 配置
zsh/        Zsh 片段配置
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

Starship 的 Zsh 初始化片段在：

```text
zsh/starship.zsh
```

可以在 `~/.zshrc` 中引用：

```sh
source ~/codes/docker_workspace/dotfiles/zsh/starship.zsh
```

## 注意

- `nvim/lazy-lock.json` 会锁定当前 Neovim 插件版本。
- Ghostty 配置依赖 `MesloLGS Nerd Font Mono` 字体。
- Starship 配置使用 Nerd Font 图标，终端字体需要支持 Nerd Font。
- 这个仓库不保存私钥、token、密码等敏感信息。
