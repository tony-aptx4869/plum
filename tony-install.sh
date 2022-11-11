#!/usr/bin/env bash
#encoding: UTF-8

PLUM_HOME=${HOME}"/plum"

if [ -d ${PLUM_HOME} ]; then
    echo "已存在 "${PLUM_HOME}" 這個目錄，爲了保護您的數據，"
    echo "它將被重命名爲 "${PLUM_HOME}"-bak。"
    mv ${PLUM_HOME} ${PLUM_HOME}"-bak"
fi

git clone https://github.com/tony-aptx4869/plum.git ${PLUM_HOME}

cd ${PLUM_HOME}
git checkout "master"

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
    emoji:customize:schema=jyutping
    emoji:customize:schema=hkcantonese
    emoji:customize:schema=scj6
    emoji:customize:schema=stroke
)

bash rime-install "${recipes[@]}" || exit 1
cp customs/default.custom.yaml ${HOME}"/Library/Rime/"
cp customs/luna_pinyin.custom.yaml ${HOME}"/Library/Rime/"
cp customs/squirrel.custom.yaml ${HOME}"/Library/Rime/"

echo ""
echo "正在重新部署鼠鬚管……"
"/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel" --reload
echo "如果你沒有開啓「專注模式」，請觀察屏幕右上角的通知，"
echo "通知提示部署完成之後，請盡情體驗【鼠鬚管】吧！"
echo ""
