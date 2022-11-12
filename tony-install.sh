#!/usr/bin/env bash
#encoding: UTF-8

PLUM_HOME=${HOME}"/tony-plum"
PLUM_MOVED=0
IS_TONY_REPO=0
D_COPY_FAILED=0
L_COPY_FAILED=0
S_COPY_FAILED=0

plumMoved() {
    if [ ${PLUM_MOVED} == 1 ]; then
        echo "由於您的用戶 HOME 目錄 "${HOME}
        echo "曾經存在一個名爲 `tony-plum` 的目錄，而它並不是由"
        echo "https://github.com/tony-aptx4869/plum.git 這個遠程項目克隆而來，"
        echo "因此，爲了腳本正常運行，更爲了保護您數據安全，它已經被重命名爲"
        echo "`tony-plum-bak`。如有給您造成不便，請您諒解！"
    fi
}

isTonyRepo() {
    if [ ${IS_TONY_REPO} == 1 ]; then
        return 1
    else
        return 0
    fi
}

copyFailed() {
    if [ ${D_COPY_FAILED} == 1 ]; then
        echo "文件 `default.custom.yaml` 拷貝失敗！"
        echo "該文件位於 "${PLUM_HOME}"/customs 目錄下，"
        echo "請您手動將其拷貝至 "${HOME}"/Library/Rime 目錄中。"
        echo ""
    fi
    if [ ${L_COPY_FAILED} == 1 ]; then
        echo "文件 `luna_pinyin.custom.yaml` 拷貝失敗！"
        echo "該文件位於 "${PLUM_HOME}"/customs 目錄下，"
        echo "請您手動將其拷貝至 "${HOME}"/Library/Rime 目錄中。"
        echo ""
    fi
    if [ ${S_COPY_FAILED} == 1 ]; then
        echo "文件 `squirrel.custom.yaml` 拷貝失敗！"
        echo "該文件位於 "${PLUM_HOME}"/customs 目錄下，"
        echo "請您手動將其拷貝至 "${HOME}"/Library/Rime 目錄中。"
        echo ""
    fi
}

# Function to git clone tony-aptx4869/plum.git
gitClone() {
    git clone https://github.com/tony-aptx4869/plum.git ${PLUM_HOME}
}

# Check something for the dir `plum`
checkPlumDir() {
    if [ -d ${PLUM_HOME} ]; then
        cd ${PLUM_HOME}
        git checkout 'install-scripts'
        if git rev-parse --verify 'install-scripts'; then
            IS_TONY_REPO=1
            git remote set-url origin https://github.com/tony-aptx4869/plum.git
            git add *
            git commit -a -m "whatever"
            git checkout 'install-scripts'
            git fetch --all
            git reset --hard origin/install-scripts
            git pull
            git checkout 'master'
            git fetch --all
            git reset --hard origin/master
            git pull
        else
            cd ${HOME}
            mv ${PLUM_HOME} ${PLUM_HOME}"-bak"
            PLUM_MOVED=1
            gitClone
        fi
    else
        cd ${HOME}
        gitClone
    fi
}

# Function to install recipes for Rime (Squirrel on macOS)
recipesInstall() {
    cd ${PLUM_HOME}
    git checkout 'master'
    recipes=(
        :tony
        emoji:customize:schema=luna_pinyin
        emoji:customize:schema=combo_pinyin
        emoji:customize:schema=double_pinyin_mspy
        emoji:customize:schema=bopomofo
        emoji:customize:schema=wubi86
        emoji:customize:schema=wubi_pinyin
        emoji:customize:schema=cangjie5
        emoji:customize:schema=terra_pinyin
        emoji:customize:schema=jyut6ping3
        emoji:customize:schema=scj6
        emoji:customize:schema=stroke
    )
    bash rime-install "${recipes[@]}" || exit 1
}

# Funtion to copy custom files
copyCustomFiles() {
    echo "正在拷貝個性化文件。"
    cd ${PLUM_HOME}
    cp customs/default.custom.yaml ${HOME}"/Library/Rime/"
    if [ $? != 0 ]; then
        D_COPY_FAILED=0
    fi
    cp customs/luna_pinyin.custom.yaml ${HOME}"/Library/Rime/"
    if [ $? != 0 ]; then
        L_COPY_FAILED=0
    fi
    cp customs/squirrel.custom.yaml ${HOME}"/Library/Rime/"
    if [ $? != 0 ]; then
        S_COPY_FAILED=0
    fi
    echo ""
}

# Function to reload Rime (Squirrel on macOS)
reloadSquirrel() {
    "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel" --reload
    echo ""
    echo "正在重新部署鼠鬚管……"
    echo "如果你沒有開啓「專注模式」，請觀察屏幕右上角的通知，"
    echo "通知提示部署完成之後，請盡情體驗【鼠鬚管】吧！"
    echo ""
}

# Function to entry
entry() {
    checkPlumDir
    recipesInstall
    copyCustomFiles
    reloadSquirrel
    copyFailed
    plumMoved
}

entry
