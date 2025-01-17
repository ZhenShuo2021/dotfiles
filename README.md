# Dotfiles

MacOS dotfiles inspired by [holman/dotfiles](https://github.com/holman/dotfiles) and [DanielThomas/oh-your-dotfiles](https://github.com/DanielThomas/oh-your-dotfiles).

這份 dotfiles 包含自動安裝和 symlink 檔案，從 gitconfig、oh-my-zsh、macos 以及 .config 資料夾全部都設定好了，基本上是一個開箱及用的狀態。所有設定都基於 keep it simple 觀念，外觀盡量遵照 vscode 預設主題，一律使用 MesloLGS NF 字體：

- 終端機
  1. 全部使用 oh-my-zsh + powerlevel10k，使用最少樣式，使用官方推薦的 MesloLGS NF 字體
  2. wezterm: [binwenwu/wezterm-config](https://github.com/binwenwu/wezterm-config/)
  3. warp: [warpdotdev/themes](https://github.com/warpdotdev/themes)
  4. alacritty: 只有基礎設定

- 文字編輯 - 外觀遵循 vscode 預設風格
  1. helix: onedarker theme + ruff lsp
  2. neovim: 使用 Lazyvim 設定檔，關閉所有 lsp，鍵盤映射 ctrl+d 成黑洞刪除

- 工具
  1. gallery-dl: 精心設計的 config.json，只需修改路徑即可使用
  2. yt-dlp: 最高畫質和音質的設定

## 哪裡不一樣？

和 holman 的相比：

1. 我使用 oh-my-zsh，所有能用 oh-my-zsh 取代的功能都用他取代，$ZSH 關鍵字被改為 $ZDOTFILES 避免衝突
2. 改成先安裝才 symlink，因為安裝 oh-my-zsh 時會覆蓋 `.zshrc`

和 DanielThomas 的相比：

1. 沒有任何作業系統區分，簡化設定
2. 執行檔和設定檔不區分為兩個 repo（但是要用 git submodule）
3. 一樣有 defaults，安裝時 defaults 資料夾的內容會優先執行，用於解決有些程式會覆蓋設定檔的問題

> [!WARNING]  
> gitconfig 設定編碼為 utf-8，如果有衝突記得修改。

## 資料夾架構

holman 把每個類別都設計成一個 topic，例如我想新增 java 設定只需要增加 java 資料夾，內容符合下面的規範，這邊我把 topic 和整個架構一起說明：

- **bin/**: 所有在 bin 資料夾的指令都會被載入並隨處可用
- **bin/dot**: 會安裝 Homebrew (如果還沒安裝)、更新 brew 和 brew 套件、根據 macos 資料夾的設定刷新系統
- **topic/\*.zsh**: 所有 `.zsh` 都會被 `zsh/zshrc.symlink` 載入到環境，`path.zsh` 則是保留字會提前載入
- **topic/completion.zsh**: `completion.zsh` 最後載入，用來設定自動補全
- **topic/install.sh**: 所有 `install.sh` 都會在 `script/install` 被執行
- **topic/\*.symlink**: 所有 `*.symlink` 結尾的檔案都會被 symlinked 到 `$HOME` 完成設定檔的集中管理，注意開頭不用加上點，並且結尾 `.symlink` 會自動移除
- **defaults/**: 也是一個 topic，但是在所有 topic 前優先執行

repo 的必要資料夾是 bin/git/functions/script/zsh，其餘都是個人偏好，需要提醒的是因為 .config 裡面可能會有隱私設定，所以 .gitignore 設定 `config.symlink` 一律略過除非手動新增。

## 安裝

```sh
git clone --depth=1 --recursive --shallow-submodules https://github.com/ZhenShuo2021/dotfiles-macos.git ~/.dotfiles
cd ~/.dotfiles
find . -type f -name "*.sh" -exec sudo chmod +x {} \; 
script/bootstrap
```

你應該首先修改 `zsh/zshrc.symlink` 以調整路徑和個人偏好設定。成功安裝後系統會增加 `dot` 指令可以更新所有

## 程式說明

第一次看 shell 發現他的上下文比一般語言難追多了，所以在這裡額外解釋方便像我這樣的小白理解。

1. 入口 scripts/bootstrap
2. 如果是 MacOS 會執行 bin/dot 進行安裝
   1. bin/dot 會進行各項安裝和更新，使用 bootstrap 安裝完成後也可以直接使用 `dot` 執行
   2. bin/dot 會回頭呼叫 script/install
   3. script/install 會進行 brew bundle 安裝所有套件，並且找到所有 install.sh 執行
3. 接著回到 bootstrap 繼續執行 setup_gitconfig/link_files

到此為止完成整個 shell 腳本。每次開啟終端機時所有的 `.zsh` 檔案都會在 `.zshrc` 中被載入，`system.zsh` 又會載入 `functions` `bin`。

所有 submodule 都在 custom 分支進行修改。

## 奈米提醒

- 此腳本在設定 `p10k configure` 時最後一個問題會問要不要加入 `.zshrc`，選擇否也可以成功載入，因為已經在 `defaults/oh-my-zsh.zsh` 載入。
- wezterm 主題預設的圖片沒有刪掉只是放到子資料夾，移出來就可以有隨機背景圖片。

## 縮寫列表

### Neovim

這其實是一個速查表，我基本上沒改什麼東西大部分都是預設

<table>
  <tr>
    <th>按鍵</th>
    <th>說明</th>
  </tr>
  <tr>
    <td><code>a</code>/<code>s</code></td>
    <td>在光標前/後插入</td>
  </tr>
  <tr>
    <td><code>Ctrl+d</code></td>
    <td>黑洞刪除</td>
  </tr>
  <tr>
    <td><code>Ctrl+o</code></td>
    <td>回到上一個位置 (等同 vscode Ctrl+-)</td>
  </tr>
  <tr>
    <td><code>Home</code></td>
    <td>仿照 vscode 的智慧 Home 鍵</td>
  </tr>
  <tr>
    <td><code>*</code></td>
    <td>下一個文字出現位置</td>
  </tr>
  <tr>
    <td><code>g-d</code></td>
    <td>跳到變數定義位置</td>
  </tr>
  <tr>
    <td><code>Ctrl-o</code></td>
    <td>回到前一個位置</td>
  </tr>
  <tr>
    <td><code>Space-e</code></td>
    <td>開啟檔案瀏覽器</td>
  </tr>
  <tr>
    <td><code>Ctrl+H/L</code></td>
    <td>切換檔案瀏覽器聚焦位置</td>
  </tr>
  <tr>
    <td><code>Shift+H/L</code></td>
    <td>切換檔案瀏覽器中開啟的檔案</td>
  </tr>
  <tr>
    <td><code>Space-b-d</code></td>
    <td>光標切換檔案/檔案瀏覽器</td>
  </tr>
  <tr>
    <td><code>h</code></td>
    <td>在檔案瀏覽器中回到上一層</td>
  </tr>
</table>

### Git

<table>
  <tr>
    <th>指令</th>
    <th>全名</th>
    <th>用途簡介</th>
  </tr>
  <tr>
    <td>gc</td>
    <td>git commit</td>
    <td>提交變更</td>
  </tr>
  <tr>
    <td>gc!</td>
    <td>git commit --amend --no-verify</td>
    <td>合併上一提交</td>
  </tr>
  <tr>
    <td>gca</td>
    <td>git commit -a</td>
    <td>提交追蹤檔案</td>
  </tr>
  <tr>
    <td>gco</td>
    <td>git checkout</td>
    <td>切換分支</td>
  </tr>
  <tr>
    <td>gcb</td>
    <td>git copy-branch-name</td>
    <td>複製分支名稱</td>
  </tr>
  <tr>
    <td>gb</td>
    <td>git branch</td>
    <td>顯示分支</td>
  </tr>
  <tr>
    <td>gs</td>
    <td>git status -sb</td>
    <td>簡要狀態</td>
  </tr>
  <tr>
    <td>ge</td>
    <td>git-edit-new</td>
    <td>編輯新檔</td>
  </tr>
  <tr>
    <td>gl</td>
    <td>git pull --prune</td>
    <td>拉取更新</td>
  </tr>
  <tr>
    <td>glog</td>
    <td>git log --graph ...</td>
    <td>顯示提交圖</td>
  </tr>
  <tr>
    <td>gp</td>
    <td>git push origin HEAD</td>
    <td>推送分支</td>
  </tr>
  <tr>
    <td>gp!</td>
    <td>git push origin HEAD --force-with-lease</td>
    <td>強制推送</td>
  </tr>
  <tr>
    <td>gd</td>
    <td>git diff --color | sed ...</td>
    <td>顯示差異</td>
  </tr>
</table>

### 系統

<table>
  <tr>
    <th>指令</th>
    <th>全名</th>
    <th>用途簡介</th>
  </tr>
  <tr>
    <td>vv</td>
    <td>nvim</td>
    <td>啟動 Neovim Editor</td>
  </tr>
  <tr>
    <td>hnc</td>
    <td>hugo new content</td>
    <td>新增 Hugo 內容文章</td>
  </tr>
  <tr>
    <td>ls</td>
    <td>ls -F</td>
    <td>列出檔案</td>
  </tr>
  <tr>
    <td>l</td>
    <td>ls -lAh</td>
    <td>詳細檢視檔案</td>
  </tr>
  <tr>
    <td>ll</td>
    <td>ls -l</td>
    <td>列出詳細資訊</td>
  </tr>
  <tr>
    <td>la</td>
    <td>ls -A</td>
    <td>顯示隱藏檔</td>
  </tr>
  <tr>
    <td>reload!</td>
    <td>. ~/.zshrc</td>
    <td>重新載入 Zsh</td>
  </tr>
  <tr>
    <td>cls</td>
    <td>clear</td>
    <td>清理終端</td>
  </tr>
  <tr>
    <td><code>..</code> <code>cd..</code></td>
    <td>cd ..</td>
    <td>回上一層</td>
  </tr>
  <tr>
    <td><code>...</code> <code>cd...</code></td>
    <td>cd ../..</td>
    <td>回兩層</td>
  </tr>
  <tr>
    <td><code>....</code> <code>cd....</code></td>
    <td>cd ../../..</td>
    <td>回三層</td>
  </tr>
  <tr>
    <td>pubkey</td>
    <td>more ~/.ssh/id_rsa.pub | pbcopy</td>
    <td>複製公鑰</td>
  </tr>
  <tr>
    <td>d</td>
    <td>docker $*</td>
    <td>執行 Docker</td>
  </tr>
  <tr>
    <td>d-c</td>
    <td>docker-compose $*</td>
    <td>執行 Docker Compose</td>
  </tr>
</table>

### 函式

太多了自己看（其實是跨檔案懶得慢慢貼給 GPT 生成），在 `bin` 還有 `functions` 都有很多 holman 設定的函式，例如 extract 根本神器，自動分辨副檔名解壓縮。

## Brewfile

簡單介紹都裝了哪些東西，只講大件的，基本上全部都是開源工具

### 開發者

1. docker/docker-compose: 容器
2. iterm2/wezterm/warp/tmux: 終端機工具
3. helix/neovim/Lazyvim: 文字編輯器和擴展
4. fd/fzf/ripgrep: Lazyvim 推薦的搜尋工具
5. git/gh/act: git/本地 github cli/actions平台

### 終端工具

1. exiftool: 相片元資料編輯器
2. imagemagick: 相片編輯工具
3. gallery-dl/yt-dlp/motrix: 圖片/影片/萬用下載工具
4. yazi: 檔案檢視器
5. hiddenbar: 狀態欄隱藏工具
6. ffmpeg: 影片轉檔

### 其他工具

1. Localsend: 跨裝置類 airdrop
2. upscayl: AI 超解析度工具
3. Spotify
4. chrome
5. joplin
6. google-drive
7. teamviewer
8. raycast
9. stats

# Acknowledgments

This software is forked from Holman (MIT License, https://github.com/holman) and includes code from Oh My Zsh (MIT License, © 2009-2017 Robby Russell and contributors) and Warp themes (Apache License 2.0, https://github.com/warpdotdev/themes).
