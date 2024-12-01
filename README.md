# robosys2024
授業で作成
# 入力された数値の分析
[![test](https://github.com/TaikiShimodaira/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/TaikiShimodaira/robosys2024/actions/workflows/test.yml)
## 概要
このプログラムは入力された数値から、合計、平均、最大値、最小値、分散、標準偏差、中央値、歪度、尖度の中から選んだ項目を計算して出力します。
## 使用方法
リポジトリをクローンする
```
git clone https://github.com/TaikiShimodaira/robosys2024.git
```
実行可能にする
```
cd robosys2024  
chmod +x stats
```
下記のように--showの後に求めたい統計値を入力
./stats  
数字を1行ずつ入力してください（Ctrl+Dで終了）:  
1  
2  
3  
4  
5  
```
## 実行結果
```
結果:  
入力された数字: [1, 2, 3, 4, 5]  
合計: 15  
平均: 3.0  
最大値: 5  
最小値: 1
```
## テスト環境
以下の環境で動作を確認済みである    
```
Python (3.7~3.11)  
Ubuntu 20.04
```
## ライセンス・著作物
- このソフトウェアパッケージは、３条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードの一部は、（CC-BY－SA 4.0 by Ryuichi Ueda)のものを、本人の許可を得て自身の著作としたものです https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024  
- © 2024 Taiki Shimodaira


