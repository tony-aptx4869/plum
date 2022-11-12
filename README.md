# Rime 輸入方案自動安裝腳本 / Rime Input Schemas Automatic Installation Scripts

First, please go to the [Rime official website homepage](https://rime.im), download and install the Rime Input Method according to your os platform.

macOS users can follow the instructions below to use the automatic installation scripts.

Windows & Linux os users, please refer to the official wiki and switch to the `master` branch to manually install and configure.

首先請移步 [Rime 官網主頁](https://rime.im)，根據系統平臺下載並安裝 Rime 輸入法。

macOS 系統用戶可按照下面的說明，使用自動安裝腳本。

Windows & Linux 系統用戶請查閱官方文檔，並切換至 `master` 分支手動安裝配置。

## > tony-install.sh

Under macOS, a series of commonly used Rime Input Schemas including [Combo Pinyin - Haoyue G-Y-A Layout] are automatically installed, and some of them are added to the input schema list custom configuration file `default.custom.yaml`. The script also customizes the appearance of the number of input method candidates, font, font size, color-scheme, etc.

After using this automatic installation script, users who have further personalized customization requirements can refer to the official wiki for more personalized customization operations.

在 macOS 系統下，自動安裝包括【宮保拼音・皓月九指禪】在內的一系列常用的 Rime 輸入方案，並且在輸入方案列表個性化配置文件 `default.custom.yaml` 中添加其中的一些。腳本還會對輸入法候選字數目、字體、字號、顏色預設方案等外觀做一些個性化定製。

使用該自動安裝腳本之後，有進一步個性化定製需求的用戶可以查閱官方文檔，進行更多的個性化定製操作。

### 使用方法 How to use

Run the following command in the [Terminal] of macOS.

在 macOS 的 【終端】 裏運行下面這條命令。

    bash -c "$(curl -fsSL https://b233.icu/tony-install.sh)"

### 輸入方案列表 Input Schemas List

    + luna-pinyin                       # 朙月拼音
        - luna_pinyin                   # 朙月拼音
        - luna_pinyin_simp              # 朙月拼音・简化字
        - luna_pinyin_fluency           # 朙月拼音・語句流
        - luna_pinyin_tw                # 朙月拼音・臺灣正體
    + tony-aptx4869/rime-combo-pinyin   # 宮保拼音
        - combo_pinyin                  # 宮保拼音（七指禪/大衆式）
        - combo_pinyin_hy9              # 宮保拼音・皓月九指禪
        - combo_pinyin_hy9c             # 宮保拼音・皓月九指禪 Colemak 鍵盤佈局
        - combo_pinyin_8                # 宮保拼音・八指禪
        - combo_pinyin_9                # 宮保拼音・九指禪
        - combo_pinyin_10               # 宮保拼音・十指禪
    + double-pinyin                     # 雙拼
        - double_pinyin                 # 雙拼（自然碼方案）
        - double_pinyin_abc             # 雙拼（智能 ABC 方案）
        - double_pinyin_flypy           # 雙拼（小鶴方案）
        - double_pinyin_mspy            # 雙拼（微軟拼音方案）
        - double_pinyin_pyjj            # 雙拼（拼音加加方案）
    + bopomofo                          # 注音
        - bopomofo                      # 注音
        - bopomofo_tw                   # 注音・臺灣正體
        - bopomofo_express              # 注音・快打模式
    + cangjie                           # 倉頡
        - cangjie5                      # 倉頡五代
        - cangjie5_express              # 倉頡五代・快打模式
    + terra-pinyin                      # 地球拼音
        - terra_pinyin                  # 地球拼音
    + pinyin-simp                       # 袖珍简化字拼音
        - pinyin_simp                   # 袖珍简化字拼音
    + wubi                              # 五筆字型
        - wubi86                        # 五笔86
        - wubi_pinyin                   # 五笔·拼音
        - wubi_trad                     # 五筆·簡入繁出
    + ipa                               # 國際音標
        - ipa_xsampa                    # X-SAMPA
        - ipa_yunlong                   # 雲龍國際音標
    + cantonese                         # 粵語拼音
        - jyut6ping3                    # 粵語拼音（聲調顯示版）
        - jyut6ping3_ipa                # 粵語拼音（IPA版）
    + scj                               # 快速倉頡
        - scj6                          # 快速倉頡
    + stroke                            # 五筆畫

