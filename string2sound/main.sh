#!/usr/bin/bash
if type "ffmpeg" > /dev/null 2>&1; then
    echo
else
    echo "必要なコマンドがダウンロードされていません。" #コマンドが存在しないときの処理
    echo -n "ダウンロードしますか？ [Y/n]: "
    read Yn
    case $Yn in
      "" | [Yy]* )
        brew install ffmpeg
        ;;
      * )
        exit
        ;;
    esac
      exit
fi

#プロンプトをechoを使って表示
echo '音声化するテキストを入力してください'
echo -n input:
#入力を受付、その入力を「str」に代入
read str

# 入力された音声を保存
say $str
say -v Kyoko $str -o temp.aiff
ffmpeg -i temp.aiff temp.mp3
rm temp.aiff

#結果を表示
echo "【" $str "】をmp3ファイルで作成しました。"