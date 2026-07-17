# zsh-comps

个人 Zsh 自动补全函数集合。

## 补全列表

| 文件 | 用途 |
|------|------|
| `_gs` | Ghostscript (`gs`) 命令补全 |
| `_m4b-tool` | m4b-tool 有声书工具补全 |
| `_pake` | Pake 命令行工具补全 |

## 安装

```zsh
# 将本项目添加到 fpath
fpath=(/path/to/zsh-comps $fpath)
compinit
```

或通过 oh-my-zsh 加载：

```zsh
# 将本项目软链或复制到 oh-my-zsh 的补全目录
ln -sfn /path/to/zsh-comps/* /path/to/.oh-my-zsh/custom/completions/
```

## 维护

- 补全文件按 `_命令名` 格式命名
- 新增补全后更新上方列表
- 直接在 `~/.oh-my-zsh/custom/completions/` 开发测试，完成后同步回本项目
