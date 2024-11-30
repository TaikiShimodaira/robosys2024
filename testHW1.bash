#!/bin/bash
# SPDX-FileCopyrightText: 2024 Taiki Shimodaira
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
合計: 150
平均: 30.0
最大値: 50
最小値: 10
分散: 250
標準誤差: 7.071067811865475
中央値: 30
歪度: 0.0
尖度: -1.9119999999999997"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

out=$(echo -e "1.5\n2.5\n3.5" | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:

結果:
合計: 7.5
平均: 2.5
最大値: 3.5
最小値: 1.5
分散: 1.0
標準誤差: 0.5773502691896258
中央値: 2.5
歪度: 0.0
尖度: -2.3333333333333335"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

out=$(echo -e "3\n2\n4\n2" | ./stats -s total median)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:

結果:
合計: 11
中央値: 2.5"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

# 正しくない入力(アルファベット)
out=$(echo -e "10\nabc\n20" | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:
無効な入力: abc をスキップします。

結果:
合計: 30
平均: 15.0
最大値: 20
最小値: 10
分散: 50
標準誤差: 5.0
中央値: 15.0
歪度: 0.0
尖度: -2.75"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

out=$(echo あ | ./stats)
in="数字を1行ずつ入力してください（Ctrl+Dで終了）:
無効な入力: あ をスキップします。
数字が入力されませんでした。
"
[ "$(printf "${out}")" = "$(printf "${in}")" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
