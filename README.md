# zsh-comps

让命令行更易用 —— 带中文说明的 Zsh 自动补全集合。

## 为什么会有这个项目

命令行的帮助文件几乎都是英文的，而且写得很晦涩。

用命令的时候经常遇到这种情况：知道有某个选项，但想不起来名字；或者看到一个选项名，得先查一遍文档才知道它是干嘛的。

自动补全就是为了解决这个问题 —— 把命令的选项、参数都列出来，选就行了。但光列出来还不够，选项名本身还是英文缩写，光看名字不一定知道什么意思。

所以这个项目在补全的基础上，给每个选项加了**中文说明**。看到补全列表，一眼就知道哪个选项是干什么的，不用再去翻文档。

目标很简单：**让命令行不那么难用**。

## 补全列表

### 文件操作
| 文件 | 用途 |
|------|------|
| `_cat` | cat 连接文件并输出 |
| `_cp` | cp 复制文件 |
| `_file` | file 识别文件类型 |
| `_ln` | ln 创建链接 |
| `_ls` | ls 列出目录内容（macOS BSD 版本） |
| `_mkdir` | mkdir 创建目录 |
| `_mv` | mv 移动/重命名 |
| `_rm` | rm 删除文件 |
| `_rmdir` | rmdir 删除目录 |
| `_touch` | touch 更改文件时间戳 |

### 文本处理
| 文件 | 用途 |
|------|------|
| `_awk` | awk 文本处理与模式扫描 |
| `_column` | column 列格式化 |
| `_cut` | cut 列提取 |
| `_fmt` | fmt 文本格式化 |
| `_fold` | fold 文本折行 |
| `_grep` | grep 文本搜索 |
| `_head` | head 文件头部 |
| `_less` | less 分页查看 |
| `_nl` | nl 行号 |
| `_sed` | sed 流编辑 |
| `_sort` | sort 排序 |
| `_strings` | strings 提取字符串 |
| `_tac` | tac 反向输出文件 |
| `_tail` | tail 文件尾部 |
| `_tee` | tee 分流输出 |
| `_tr` | tr 字符转换 |
| `_uniq` | uniq 去重 |
| `_wc` | wc 计数 |
| `_xxd` | xxd 十六进制转储与还原 |

### 文件搜索
| 文件 | 用途 |
|------|------|
| `_find` | find 搜索文件 |
| `_locate` | locate 快速查找文件 |

### 权限与用户
| 文件 | 用途 |
|------|------|
| `_chmod` | chmod 修改权限 |
| `_chown` | chown 修改所有者 |

### 归档压缩
| 文件 | 用途 |
|------|------|
| `_gzip` | gzip GZip 压缩 |
| `_tar` | tar 归档压缩 |
| `_zip` | zip ZIP 压缩 |

### 系统信息
| 文件 | 用途 |
|------|------|
| `_date` | date 日期格式化 |
| `_df` | df 磁盘空间 |
| `_dmesg` | dmesg 内核消息 |
| `_du` | du 目录大小 |
| `_free` | free 内存信息 |
| `_top` | top 进程查看 |
| `_uname` | uname 系统信息 |
| `_uptime` | uptime 系统运行时间 |

### 进程管理
| 文件 | 用途 |
|------|------|
| `_kill` | kill 发送信号 |
| `_nice` | nice 设置优先级 |
| `_ps` | ps 进程列表 |
| `_watch` | watch 周期性执行 |

### 网络工具
| 文件 | 用途 |
|------|------|
| `_curl` | curl HTTP 请求 |
| `_dig` | dig DNS 查询 |
| `_host` | host DNS 查找 |
| `_ifconfig` | ifconfig 网络接口配置 |
| `_nslookup` | nslookup DNS 查询 |
| `_ping` | ping 网络连通性测试 |
| `_scp` | scp 远程复制 |
| `_ssh` | ssh 远程登录 |
| `_wget` | wget 下载 |

### 开发工具
| 文件 | 用途 |
|------|------|
| `_jq` | jq JSON 处理器 |
| `_make` | make 构建工具 |
| `_rsync` | rsync 文件同步 |
| `_screen` | screen 终端复用器 |

### shell 相关
| 文件 | 用途 |
|------|------|
| `_cd` | cd 切换工作目录 |
| `_command` | command 命令定位 |
| `_env` | env 环境变量 |
| `_which` | which 命令定位 |
| `_xargs` | xargs 构建命令行 |

### 二进制工具
| 文件 | 用途 |
|------|------|
| `_hexdump` | hexdump 十六进制显示 |
| `_od` | od 八进制转储 |
| `_truncate` | truncate 文件截断 |

### 自定义/本地
| 文件 | 用途 |
|------|------|
| `_gs` | Ghostscript (`gs`) 命令补全 |
| `_m4b-tool` | m4b-tool 有声书工具补全 |
| `_npm` | npm 包管理器命令补全 |
| `_pake` | Pake 命令行工具补全 |
| `_pdfcomp` | PDF 压缩命令补全（本地定制） |
| `_pnpm` | pnpm 包管理器命令补全 |

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
- 所有说明文字使用中文，让使用者一眼能看懂
