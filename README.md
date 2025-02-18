# An EXTREME FAST Zsh Dotfile

Featured by speed, no compromises.

![demo](.github/dotfiles-demo.webp "demo")

## 速度

使用 shell 的專門測試腳本 [zsh-bench](https://github.com/romkatv/zsh-bench/) 和直觀易懂的 hyperfine 進行測試[^test-method]，測試項目涵蓋五個常見框架：

[^test-method]: 測試執行於 M1 MacBook Pro 8G RAM，zsh-bench 使用預設值，hyperfine 使用 `hyperfine --runs 100 --warmup 3 'zsh -i -c exit 0'` 測試。所有框架的插件都相同只有 `Manual Install` 沒載入 git/docker 插件，因為加上後就會慢到受不了（因為這兩個插件需要是基於 oh-my-zsh，想要使用就需要額外初始化 oh-my-zsh 會嚴重影響速度）。

- Oh-My-ZSH: 使用 Oh-My-ZSH 加上 zsh-defer 優化
- Manual Install: 手動安裝無優化
- Manual Install Optimized: 手動安裝加上 zsh-defer 優化
- Zinit: 本份 dotfile
- Baseline: 基準線，移除 .zshrc，本機能達到的最快速度

從最廣泛使用的框架到手動優化以及作為基準線的空白 zshrc，測試項目這樣選擇的原因是為了能和絕大多數人的設定比較，並且藉由不同優化程度的設定檔藉此準確的定位效能。

<p align="center">
  <img src=".github/benchmark.webp" width="95%" height="95%" alt="benchmark">
</p>

> - 為何不用 Zinit?  
> Zinit 內建延遲加載整合，但是插件管理器本體太慢，請見 [zsh-plugin-manager-benchmark](https://github.com/rossmacarthur/zsh-plugin-manager-benchmark)
> - 為何不用 antidote?  
> 有太多 anti* 的插件管理器了，而且他正好在換代中
> - 為何不用 zsh4humans?  
z4h [如圖所示](https://github.com/zimfw/zimfw/wiki/Speed) 是最快的插件管理器，但是我不需要一個強迫我用 p10k、設定混亂而且會覆蓋我 zshrc 的插件管理器，如果沒有這些問題他會是完美的
> - 繪製自己的測試結果：將數據更新在 .github/benchmark.py 後使用 `uv run .github/benchmark.py` 可以直接執行不需建立虛擬環境。
> - 找出效能瓶頸：使用我的[腳本](https://gist.github.com/ZhenShuo2021/be33f28acc0e818ecc532a432af08ee5)來可視化效能瓶頸。

## 特色

所有程式的設定都基於簡單原則完成，外觀設定模仿 vscode 預設主題，一律使用 nerd font (MesloLGS NF) 字體。

- 🌿 輕鬆方便：你的 shell 不會要你買帽T，不會一天到晚要求更新
- 🔲 極簡風格：沒有花花綠綠的分散注意力
- 🚀 快速啟動：使用 zsh-defer 實現懶加載，不用學複雜的語法
- 📂 集中管理：不需要把安裝腳本和設定檔分開管理，一次完成安裝和設定
- 📚 完整註解：保證你看得懂 zshrc 在寫什麼以及為何這樣寫
- 🛠️ 易於調整：.zshrc 乾淨簡潔，讓你不會每次修改頭都很痛
- 🔄 簡單更新：執行 `dotfile-update` 就可輕鬆更新所有插件和系統套件
- 🎨 已配置完成的 Powerlevel10k 主題
- 📦 多個預先配置的插件
  - zsh-syntax-highlighting 語法上色
  - zsh-autosuggestions 指令歷史建議
  - zsh-completions 指令補全
  - colored-man-pages 上色的 man pages
  - extract 自動解壓縮
  - z 快速切換目錄
- 🌐 LANG、LC_ALL 和 Git 都已經設定好繁體中文
- ✅ GPG、homebrew 和 Git 等套件的常見問題都已經解決
- 🎯 正確的設定指令補全
- ⚙️ 完善設定的 gitconfig，大量借鑒 [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- 🖥️ 現代化終端機
  - 使用現代終端機，分割視窗不再需要 tmux 並且設定好外觀主題和鍵盤映射
  - wezterm: [binwenwu/wezterm-config](https://github.com/binwenwu/wezterm-config/)
  - warp: [warpdotdev/themes](https://github.com/warpdotdev/themes)
- ✏️ 文字編輯
  - neovim: 使用 Lazyvim 設定檔，鍵盤映射 Ctrl+d 為黑洞刪除
  - helix: onedarker 主題，並且整合 ruff lsp
- 🔧 工具
  - gallery-dl: 精心設計的 config.json，只需修改路徑即可使用
  - yt-dlp: 設定檔為最高畫質和音質，開箱即用

## 安裝

```shell
ASK=1 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ZhenShuo2021/dotfiles/chezmoi/remote_install.sh) -k -v"
```

首次執行不會完整安裝，因為 GPG 等需要進一步設定，移除 `ASK=1` 會使用預設名稱作為電腦和用戶名，再次執行 `chezmoi -k apply` 可以進行後續部分的安裝。

其他指令為：

- 清除 chezmoi run_once 狀態  
chezmoi state delete-bucket --bucket=scriptState
- 進入設定檔目錄  
chezmoi cd
- 應用設定檔，環境變數可選  
ASK=1 SETPASS=1 chezmoi init --apply

## 最簡模式

最簡模式只會複製 .zshrc/.zshenv 不會修改其餘任何設定，第一個問題輸入 T/F 選擇是否啟用。

## 修改

1. 01-preference.zsh: 各種路徑和常數設定
2. 02-cm-config.zsh: 由 chezmoi 載入的設定
3. 03-plugins.zsh: 載入插件
4. 04-p10k.zsh: 載入 p10k 設定檔
5. 05-system.zsh: 設定 `setopt` 和 `bindkey`
6. 06-completion.zsh: 設定自動補全
7. 99-alias.zsh: 設定別名，可以任意修改

想編輯 zshrc 時建議直接修改這些文件，輸入 `vim $ZZ [tab]` 可以自動補全不用記路徑，通常只會改 01 和 99，變更 p10k 外觀時記得修改 zshrc 選擇否，對應設定已經在 03 裡面完成了。

## 快捷鍵列表

優化直覺性，盡量同步成系統內建用法。

<details>

<summary>終端機</summary>

**Warp**: 同 WezTerm
**WezTerm**:

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
- 原本的背景圖片放在 backdrops/archive 裡面，移出來就可以有隨機背景圖片。

</details>

<details>

<summary>Neovim</summary>

這其實是一個速查表，大部分都是預設值。

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
    <td><code>Ctrl-f</code></td>
    <td>往下捲動10行</td>
  </tr>
  <tr>
    <td><code>Ctrl-b</code></td>
    <td>往上捲動10行</td>
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

大量參考 [mathiasbynens](https://github.com/mathiasbynens/dotfiles)，可使用 `git aliases` 查看 git 系統內的 alias，別名來源有三個：

1. [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
2. src/bin/ 裡面的會被綁定到 .gitconfig 裡面作為 alias 使用
3. src/zsh/alias.zsh 是最高層級，會覆蓋所有 alias

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
    <td>gtlll</td>
    <td>gtlll(){ git tag --sort=-v:refname -n999 --format="[%(objectname:short) %(refname:short)] %(contents:lines=999)%0a" --list "${1}*" }; noglob gtlll</td>
    <td>尋找指定標籤，無輸入就列出所有，類似指令有 gtll/gtl</td>
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
    <td>ee</td>
    <td>exit 0</td>
    <td>退出終端</td>
  </tr>
  <tr>
    <td>switch_en</td>
    <td>export LC_ALL='en_US.UTF-8'; export LANG='en_US.UTF-8'</td>
    <td>暫時切換到英語系統，也有 tw 版本</td>
  </tr>
  <tr>
    <td>gpg_test</td>
    <td>echo test | gpg --clear-sign</td>
    <td>測試 GPG 是否能正確簽署</td>
  </tr>
  <tr>
    <td>gpg_reload</td>
    <td>gpgconf --kill gpg-agent</td>
    <td>重新載入 GPG</td>
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

# Acknowledgments

- Code is based on [narze's dotfiles (MIT License)](https://github.com/narze/dotfiles)
- Snippets from [Holman's dotfiles (MIT License)](https://github.com/holman/dotfiles), [mathiasbynens (MIT License)](https://github.com/mathiasbynens/dotfiles)
