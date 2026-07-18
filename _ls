#compdef ls gls

local arguments is_gnu datef

if ! _pick_variant gnu=gnu unix --help; then
  arguments=(
    '(-A)-a[列出以点号开头的条目]'
    '(-a)-A[列出除 . 和 .. 之外的所有条目]'
    '-d[列出目录本身而非其内容]'
    '-L[列出符号链接所指向的文件]'
    '-R[递归列出子目录]'

    '(-k)-h[以人类可读格式显示大小]'
    '(-h)-k[以千字节为单位显示大小]'

    '-i[显示文件 inode 编号]'
    '(-l -g -1 -C -m -x)-l[长格式列表]'
    '(-l -g -C -m -x)-1[单列输出]'
    '(-l -g -1 -m -x)-C[按列纵向排序显示条目]'
    '(-l -g -1 -C -x)-m[逗号分隔输出]'
    '(-l -g -1 -C -m)-x[横向排序]'

    '-s[显示每个文件所占块数]'

    '(-u)-c[状态改变时间]'
    '(-c)-u[访问时间]'

    '-r[反向排序]'

    '(-t)-S[按大小排序]'
    '(-S)-t[按修改时间排序]'

    '(-p)-F[附加文件类型指示符]'
    '(-F)-p[为目录附加文件类型指示符]'

    '-n[以数字形式显示用户 ID 和组 ID]'

    '(-B -b -w -q)-q[隐藏控制字符]'

    '*: :_files'
  )
  if [[ "$OSTYPE" = (netbsd*|dragonfly*|freebsd*|openbsd*|darwin*) ]]; then
    arguments+=(
      '-T[显示完整时间信息]'
      '(-a -A -r -S -t)-f[输出不排序]'
    )
  fi
  if [[ $OSTYPE = (netbsd*|dragonfly*|freebsd*|openbsd*) ]]; then
    arguments+=( '-o[显示文件标志]' )
  fi
  if [[ $OSTYPE = (netbsd*|dragonfly*|freebsd*|darwin*) ]]; then
    arguments+=(
      '(-B -b -w -q)-B[以八进制转义显示控制字符]'
      '(-B -b -w -q)-b[与 -B 类似，但尽可能使用 C 转义码]'
      '(-B -b -w -q)-w[直接输出原始字符]'
      '-W[扫描目录时显示白出条目]'
    )
  fi
  if [[ $OSTYPE = (netbsd*|openbsd*|darwin*|solaris*) ]]; then
    arguments+=(
      '(-l -1 -C -m -x)-g[长格式列表但不显示所有者信息]'
    )
  fi
  if [[ $OSTYPE = netbsd* ]]; then
    arguments+=(
      '-M[以逗号分隔形式输出文件大小]'
      '-O[仅输出叶（非目录）文件]'
      '-P[显示每个文件的完整路径]'
      "-X[递归时不跨越挂载点]"
    )
  fi
  if [[ $OSTYPE = (dragonfly*|freebsd*|openbsd*|darwin*) ]]; then
    arguments+=( '-H[跟随命令行上的符号链接]' )
  fi
  if [[ $OSTYPE = (dragonfly*|freebsd*|darwin*) ]]; then
    arguments+=(
      '-G[启用彩色输出]'
      '-P[不跟随符号链接]'
    )
  fi
  if [[ $OSTYPE = (dragonfly*|freebsd*) ]]; then
    arguments+=(
      '(-A)-I[阻止超级用户自动设置 -A]'
      '(-1 -C -m -x)-D+[指定日期格式]:format: _date_formats'
    )
  fi
  if [[ $OSTYPE = dragonfly* ]]; then
    arguments+=(
      '-_[使用基于 GMT 的日期时间和纳秒时间戳输出]'
      '-y[在长格式列表中显示 FSMID]'
    )
  fi
  if [[ $OSTYPE = (freebsd*|darwin*) ]]; then
    arguments+=( '(-c -u)-U[文件创建时间]' )
  fi
  if [[ $OSTYPE = freebsd* ]]; then
    arguments+=(
      '-,[以千位分隔符分组显示文件大小]'
      '-y[与 -t 配合使用时，按时间顺序对文件名排序]'
      '-Z[显示 MAC 标签]'
      '--color=-[控制彩色输出的使用]:color:(never always auto)'
    )
  fi
  if [[ $OSTYPE = darwin* ]]; then
    arguments+=(
      '-@[在长格式列表中显示扩展属性键和大小]'
      '-e[在长格式列表中显示 ACL]'
      '(-l -1 -C -m -x)-o[长格式列表但不显示组信息]'
      '-O[显示文件标志]'
      '-v[直接输出原始字符]'
    )
  fi
  if [[ $OSTYPE = solaris* ]]; then
    arguments+=(
      '(-q)-b[以八进制转义显示控制字符]'
      '(-l -1 -C -m -x)-o[长格式列表但不显示组信息]'
      '(-l -t -s -r -a)-f[将每个参数解释为目录]'
      '(-E -l)-e[长格式列表，显示完整一致的日期时间]'
      '(-e -l)-E[长格式列表，显示 ISO 格式的日期时间]'
      '-H[跟随命令行上的符号链接]'
      '-v[长格式列表，显示详细 ACL 信息]'
      '-V[长格式列表，显示紧凑 ACL 信息]'
      '-@[长格式列表，显示扩展属性信息标记]'
    )
  fi
else
  [[ $PREFIX = *+* ]] && datef='formats:format: _date_formats'
  arguments=(
    '(--all -a -A --almost-all)'{--all,-a}'[列出以点号开头的条目]'
    '(--almost-all -A -a --all)'{--almost-all,-A}'[列出除 . 和 .. 之外的所有条目]'
    '--author[显示每个文件的作者]'
    '(--ignore-backups -B)'{--ignore-backups,-B}"[不列出以波浪号结尾的条目]"
    '(--directory -d)'{--directory,-d}'[列出目录本身而非其内容]'
    '(--dired -D)'{--dired,-D}"[生成适合 Emacs dired 模式的输出]"
    '*'{--ignore=,-I+}"[不列出匹配模式的条目]:pattern: "
    '(--dereference -L --dereference-command-line -H --dereference-command-line-symlink-to-dir)'{--dereference,-L}'[列出符号链接所指向的文件]'
    '(--dereference -L --dereference-command-line -H --dereference-command-line-symlink-to-dir)'{--dereference-command-line,-H}'[跟随命令行上的符号链接]'
    '(--dereference -L --dereference-command-line -H)'--dereference-command-line-symlink-to-dir
    '(--recursive -R)'{--recursive,-R}'[递归列出子目录]'

    '(--no-group -G)'{--no-group,-G}'[禁止显示组信息]'
    '(--block-size --human-readable -h --si --kilobytes -k)'{--human-readable,-h}'[以人类可读格式显示大小]'
    '(--block-size --human-readable -h --si --kilobytes -k)--si[以人类可读格式显示大小，基于 1000 进制]'
    '(--inode -i)'{--inode,-i}'[显示文件 inode 编号]'

    '(--format -l -g -o -1 -C -m -x)-l[长格式列表]'
    '(--format -l -1 -C -m -x)-g[长格式列表但不显示所有者信息]'
    --group-directories-first
    '(--format -l --no-group -G -1 -C -m -x)-o[长格式列表但不显示组信息]'
    '(--format -l -g -o -C -m -x)-1[单列输出]'
    '(--format -l -g -o -1 -m -x)-C[按列纵向排序显示条目]'
    '(--format -l -g -o -1 -C -x)-m[逗号分隔输出]'
    '(--format -l -g -o -1 -C -m)-x[横向排序]'
    '(-l -g -o -1 -C -m -x)--format=[指定输出格式]:format:(verbose long commas horizontal across vertical single-column)'

    '(--size -s -f)'{--size,-s}'[显示每个文件所占块数]'

    '(--time -u)-c[状态改变时间]'
    '(--time -c)-u[访问时间]'
    '(-c -u)--time=[指定要显示的时间]:time:(ctime status use atime access)'
    '--time-style=[以指定样式显示时间]:style: _alternative "time-styles\:time style\:(full-iso long-iso iso locale)" $datef'

    '(-a --all -U -l --format -s --size -t --sort --full-time)-f[不排序、显示所有、简短列表]'
    '(--reverse -r -U -f)'{--reverse,-r}'[反向排序]'

    '(--sort -t -U -v -X)-S[按大小排序]'
    '(--sort -S -U -v -X)-t[按修改时间排序]'
    '(--sort -S -t -v -X)-U[不排序]'
    '(--sort -S -t -U -X)-v[按版本排序（文件名按数值处理）]'
    '(--sort -S -t -U -v)-X[按扩展名排序]'
    '(-S -t -U -v -X)--sort=[指定排序键]:sort key:(size time none version extension)'

    '--color=-[控制彩色输出的使用]:color:(never always auto)'
    "*--hide=[与 -I 类似，但被 -a 或 -A 覆盖]:pattern: "
    '--hyperlink=[输出终端代码以使用 file:// URI 链接文件]::when:(none auto always)'
    '(--classify -F --indicator-style -p --file-type)'{--classify,-F}'[附加文件类型指示符]'
    '(--file-type -p --indicator-style -F --classify)--file-type[附加文件类型指示符（不包括星号）]'
    '(--file-type -p --indicator-style -F --classify)-p[为目录附加斜杠 /]'
    '(-F --classify -p --file-type)--indicator-style=[指定指示符样式]:indicator style:(none file-type classify slash)'

    '(-f)--full-time[同时显示完整日期和完整时间]'

    '(--block-size --human-readable -h --si --kilobytes -k)'{--kilobytes,-k}'[使用 1K 块大小]'
    '(--human-readable -h --si --kilobytes -k)--block-size=[指定块大小]:block size (bytes):(K M G T P E Z Y KB MB TB PB EB ZB YB)'

    '(--numeric-uid-gid -n)'{--numeric-uid-gid,-n}'[以数字形式显示用户 ID 和组 ID]'
    '(--tabsize -T)'{--tabsize=,-T+}'[指定制表符宽度]:tab size'
    '(--width -w)'{--width=,-w+}'[指定屏幕宽度]:screen width'

    '(--quoting-style -b --escape -N --literal -Q --quote-name)'{--escape,-b}'[以八进制转义显示控制字符]'
    '(--quoting-style -b --escape -N --literal -Q --quote-name)'{--literal,-N}'[直接输出条目名称，不加引号]'
    '(--quoting-style -b --escape -N --literal -Q --quote-name)'{--quote-name,-Q}'[为名称加引号]'
    '(-b --escape -N --literal -Q --quote-name)--quoting-style=[指定引号样式]:quoting style:(literal shell shell-always c escape clocale locale)'

    '(--hide-control-chars -q --show-control-chars)'{--hide-control-chars,-q}'[隐藏控制字符]'
    '(-q --hide-control-chars)--show-control-chars'
    '(- :)--help[显示帮助信息]'
    '(- :)--version[显示版本信息]'
    '*:file:_files'
  )
  if [[ $OSTYPE = linux* ]]; then
    arguments+=(
      '(-Z --context)'{-Z,--context}'[显示每个文件的安全上下文]'
    )
  fi
fi

_arguments -s -S : $arguments
