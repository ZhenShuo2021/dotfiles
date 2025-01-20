# Dotfiles

不用手動安裝程式的 dotfile 才是好 dotfile。

修改自 [holman/dotfiles](https://github.com/holman/dotfiles) 並且參考熱門的 dotfiles 設定，可自動化安裝套件和 symlink 檔案，你只需要在安裝過程中輸入密碼，不需要一一手動安裝每個套件，是開箱即用的狀態。設定基於簡單原則完成，外觀設定模仿 vscode 預設主題，一律使用 nerd font (MesloLGS NF) 字體。

> 主分支使用 zinit，omz 分支使用 oh-my-zsh 管理套件

## Feature

- 📂 集中管理：不再需要將安裝腳本和 dotfiles 分開管理，一次完成安裝和設定
- ⚡ 快速啟動：使用 zinit 和 zsh-defer 實現懶加載
- 🎨 已配置完成的 Powerlevel10k 主題
- 🔍 多個預先配置的插件
  - fast-syntax-highlighting 語法上色
  - zsh-autosuggestions 指令歷史建議
  - zsh-completions 指令補全
  - colored-man-pages 上色的 man pages
  - extract 自動解壓縮
  - z 快速導航
- 🌏 LANG、LC_ALL 和 Git 都已經設定好繁體中文
- 🍺 GPG、homebrew 和 Git 等套件的常見問題都已經解決
- ⚙️ 完善設定的 gitconfig，大量借鑒 [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- 🖥️ 終端機
  - 使用現代終端機，分割視窗不再需要 tmux 並且設定好外觀主題和鍵盤映射
  - wezterm: [binwenwu/wezterm-config](https://github.com/binwenwu/wezterm-config/)
  - warp: [warpdotdev/themes](https://github.com/warpdotdev/themes)
- ✏️ 文字編輯
  - neovim: 使用 Lazyvim 設定檔，關閉所有 lsp，鍵盤映射 Ctrl+d 為黑洞刪除
  - helix: onedarker 主題，並且整合 ruff lsp
- 🔧 工具
  - gallery-dl: 精心設計的 config.json，只需修改路徑即可使用
  - yt-dlp: 設定檔為最高畫質和音質，開箱即用

## 哪裡不一樣？

和 holman 的相比：

1. 使用套件管理系統，不再需要自己維護功能
2. 清理老舊腳本並且新增現代腳本
3. 集中管理 symlink 和 installer 更直觀易於維護
4. $ZSH 關鍵字被改為 $ZDOTFILES 避免衝突

曾經為了效能嘗試不使用管理器手動安裝插件，發現手動沒優化的情況下反而更慢，所以現在應該是最好的選擇了。

## 安裝

```sh
git clone --depth=1 --recursive --shallow-submodules https://github.com/ZhenShuo2021/dotfiles-macos.git ~/.dotfiles
cd ~/.dotfiles
find . -type f -name "*.sh" -exec chmod +x {} \; 
./bootstrap
```

## 快捷鍵列表

優化直覺性，盡量同步成系統內建用法。

<details>

<summary>終端機</summary>

- **WezTerm**:

- `⌘`: SUPER
- `⌘`+`^`: SUPER_REV
- `⌥`: ALT

```lua
if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|CTRL'
end
```

- 視窗
  - 垂直分割: `SUPER`+`d`
  - 水平分割: `SUPER`+`D`
  - 切換: `SUPER_REV` + `方向鍵`
- 向上捲動: `CTRL`+`f`
- 向下捲動: `CTRL`+`d`
- 原作者的圖片沒有刪除只是放到子資料夾，移出來就可以有隨機背景圖片。

---

- **Warp**: 同 WezTerm

</details>

<details>

<summary>Neovim</summary>

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

</details>

<details>

<summary>Git</summary>

大量參考 [mathiasbynens](https://github.com/mathiasbynens/dotfiles)，可使用 `git aliases` 查看 git 系統內的 alias，除了 git 自身的別名系統在全域系統也有設定別名。

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
    <td>gcp</td>
    <td>git cherry-pick</td>
    <td>複製提交</td>
  </tr>
  <tr>
    <td>grb</td>
    <td>git rebase</td>
    <td>變基</td>
  </tr>
  <tr>
    <td>grba</td>
    <td>git rebase --abort</td>
    <td>中止變基</td>
  </tr>
  <tr>
    <td>grbc</td>
    <td>git rebase --continue</td>
    <td>繼續變基</td>
  </tr>
  <tr>
    <td>grbi</td>
    <td>git rebase --interactive</td>
    <td>互動式變基</td>
  </tr>
  <tr>
    <td>grbo</td>
    <td>git rebase --onto</td>
    <td>指定基底變基</td>
  </tr>
  <tr>
    <td>grbs</td>
    <td>git rebase --skip</td>
    <td>跳過當前提交</td>
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
    <td>gloga</td>
    <td>git log --graph ...</td>
    <td>顯示提交樹</td>
  </tr>
  <tr>
    <td>gp</td>
    <td>git push</td>
    <td>推送分支</td>
  </tr>
  <tr>
    <td>gp!</td>
    <td>git push --force-with-lease --force-if-includes</td>
    <td>強制推送</td>
  </tr>
  <tr>
    <td>gd</td>
    <td>git diff --color | sed ...</td>
    <td>顯示差異</td>
  </tr>
</table>

</details>

<details>

<summary>系統</summary>

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
    <td>l</td>
    <td>ls -lAGh</td>
    <td>詳細列出檔案</td>
  </tr>
  <tr>
    <td>ll</td>
    <td>ls -FG</td>
    <td>普通列出檔案</td>
  </tr>
  <tr>
    <td>lll</td>
    <td>ls -lA</td>
    <td>機器可讀列出</td>
  </tr>
  <tr>
    <td>reload!</td>
    <td>. ~/.zshrc</td>
    <td>重新載入 Zsh</td>
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
    <td>docker-compose</td>
    <td>例如 dco=docker-compose</td>
    <td><a href="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose" target="_blank">使用插件</a></td>
  </tr>
</table>

</details>

## 資料夾架構說明

發現繁雜的設定只是徒增困擾，於是簡化資料夾設定：

- **bin/**: 所有在 bin 資料夾的指令都會被載入並隨處可用
- **fpath/**: 此資料夾會加入 fpath，這個路徑多用於指令補齊
- **installer/**: 只有 macos 才會執行 installer 資料夾的所有 `*.sh` 檔案
- **symlink/**: 這裡的所有檔案都會被 symlinked 到 `$HOME` 以便集中管理設定檔
- **zsh/\*.zsh**: 所有 `.zsh` 都會被 `.zshrc` 載入到環境中

因為 `.config` 裡面可能會有隱私設定，所以 .gitignore 設定略過所有內容 `.config` 除非手動新增。

## 程式說明

第一次看 shell 發現他的上下文比一般語言難追多了，所以在這裡額外解釋方便像我這樣的小白理解。

1. 入口 ./bootstrap
2. 如果是 MacOS 會執行 bin/dot 進行安裝
   1. bin/dot 會進行各項安裝和更新（註：使用 bootstrap 安裝完成後也可以直接使用 `dot` 執行，用於定期更新系統套件）
   2. bin/dot 回頭呼叫 ./install
   3. ./install 會進行 brew bundle 安裝所有套件，並且執行所有 installer 資料夾中的 .sh 檔
3. 最後回到 bootstrap 繼續執行 `setup_gitconfig` 和 `link_files`

每次開啟終端機時 `.zshrc` 會載入 zsh 資料夾裡面的所有 `.zsh` 檔以及 `functions` `bin`。

所有 submodule 都在 custom 分支進行修改。

## Brewfile 套件說明

簡單介紹都裝了哪些東西，只講大件的，基本上都是開源工具

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

# Todo

- [ ] [只需輸入一次密碼](https://github.com/alrra/dotfiles/blob/main/src/os/utils.sh)
- [ ] [免 Git 安裝](https://github.com/alrra/dotfiles?tab=readme-ov-file#setup)
- [ ] [支援 Ubuntu](https://github.com/alrra/dotfiles)

# Acknowledgments

This software is built upon resources from Holman's dotfiles (MIT License, https://github.com/holman), LazyVim starter template (Apache-2.0 License, https://github.com/LazyVim/starter), KevinSilvester's wezterm-config (MIT License, https://github.com/KevinSilvester/wezterm-config), and Warp themes (Apache License 2.0, https://github.com/warpdotdev/themes).
