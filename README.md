# MultiSurfaceBricksBreakerDARUMA

JAIST1-2期の知識メディア方法論の授業課題の最終成果物。  
MultiSurfaceBricksBreakerにArduinoを使ってセンサ入力を実装したグレードアップ版。  
Processing × Arduinoで開発したシステム。

# DEMO

成果物の発表資料。


![スライド1](https://user-images.githubusercontent.com/55073758/131720709-da3f06ab-0c0b-44f4-bc32-81e6501b1ca1.JPG)
***
![スライド3](https://user-images.githubusercontent.com/55073758/131720717-202c4235-886c-45d9-921f-6f23aa073aeb.JPG)
***
![スライド4](https://user-images.githubusercontent.com/55073758/131720726-8e121680-b161-423b-b0fe-ec0ce1b57364.JPG)
***
![スライド5](https://user-images.githubusercontent.com/55073758/131720728-3073a930-2d91-4696-9486-8f405de1d394.JPG)  
***
![スライド6](https://user-images.githubusercontent.com/55073758/131720729-ffbcefad-a99e-44c6-9d66-0859be78c393.JPG)
***
![スライド7](https://user-images.githubusercontent.com/55073758/131720731-2cfe5d44-3dd1-4592-89a4-517f2c7d5cca.JPG)


はんだゴテで組んだ回路。

![ハンマー](https://user-images.githubusercontent.com/55073758/131723783-2ef3925e-8d0b-4eba-b3a0-637abd15bc91.jpg)
***
![配線](https://user-images.githubusercontent.com/55073758/131723790-3941e77f-2f06-4c31-8abd-2f36dc084129.jpg)

# Features

ゲームで有名なブロック崩しの入出力を既存のものと変化させ、面白くするアイデアを考えた。  
MultiSurfaceBricksBreakerでは、落ちたボールを活かしたブロック崩しの実装を考え、  
落ちたボールの個数に対応して、ブロックが出現し（プレッシャーブロックと呼ぶ）、  
バーが動ける範囲を制限するというアイデアを考えた。  


中間発表でのフィードバックから、最終発表では  
以下の２つをArduinoと加速度センサの入力から実現して発表した。  

［１］出現したプレッシャーブロックをプレイヤーが消せる  
［２］ユーザが一気にクリアできる裏技的な要素  

# Requirement

* Processing　
* Arduino NANO

# Installation

* Processing　
* Arduino NANO


```bash
pip install huga_package
```

# Usage

>［１］USBポートとArduino NANOを繋ぐ
>［２］Arduinoを立ち上げ、実行ボタンでプログラムを送信する
>［３］Processingを立ち上げる
>［４］実行するー＞MultiSurfaceBricksBreakerのゲーム画面が立ちあがり、ゲームがスタートする
>［５］キーボードの左右キーでバーを移動し、ボールを打ち返す
>［６］ハンマーを振ってプレッシャーブロックを消す

##クリア条件は…  
ブロックをにボールを当ててすべて壊す 
or  
プレッシャーブロックが積みあがり、ゲームオーバー１つ手前でハンマーを振る

##負け条件は…
ブロックをすべて崩す前にボールを落としまくり、  
画面下にプレッシャーブロックがすべて出現すると  
GAME OVER！

# Note

注意点などがあれば書く

# Author

作成情報を列挙する

* SakuraShimane

# License

"MultiSurfaceBricksBreakerDARUMA" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

# Special Thanks

テンプレートをお借りしました。
ありがとうございます。

https://cpp-learning.com/readme/
