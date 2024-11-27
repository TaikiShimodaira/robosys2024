#!/bin/bash
# SPDX-FileCopyrightText: 2024 Satoru Homma
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# 正しい入力（整数のみ）
out=$(echo -e "10\n20\n30\n40\n50" | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:

結果:
入力された数字: [10, 20, 30, 40, 50]
合計: 150
平均: 30.0
最大値: 50
最小値: 10"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

# 正しい入力（浮動小数点数を含む）
out=$(echo -e "1.5\n2.5\n3.5" | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:

結果:
入力された数字: [1.5, 2.5, 3.5]
合計: 7.5
平均: 2.5
最大値: 3.5
最小値: 1.5"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

# 正しくない入力(アルファベット)
out=$(echo -e "10\nabc\n20" | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:
無効な入力: abc をスキップします。

結果:
入力された数字: [10, 20]
合計: 30
平均: 15.0
最大値: 20
最小値: 10"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

# 正しくない入力(日本語)
out=$(echo あ | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:
無効な入力: あ をスキップします。
数字が入力されませんでした。
"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
