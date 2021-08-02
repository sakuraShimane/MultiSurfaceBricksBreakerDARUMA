#include <TimeLib.h>

/***************************
 * 
 * K214　知識メディア方法論
 * 
 * 最終試験課題　
 *  
 *  ゲーム名｜PressureBricksBreaker
 *  ゲーム概要｜ だるま落とし×落としちゃったボールの個数に応じて迫りくる壁！ 壁に押しつぶされるが先か、すべてのブロックを崩すが先か！ 上下左右の４方向に動くバーをたくみにあやつれ…
 *  開発者｜Nishikori Sakura
 *  開発日｜2021/07/31
 *  
 *  参考サイト｜https://deviceplus.jp/hobby/entry017/
 *  Arduinoボードがプログラムの実行を開始した時から現在までの時間をミリ秒単位で返す
 *  ｜http://www.musashinodenpa.com/arduino/ref/index.php?f=0&pos=2524
 *  TIme Library zipにしてインクルードした
 *  https://github.com/PaulStoffregen/Time
 */

//#include <Adafruit_NeoPixel.h>
//Adafruit_NeoPixel pixels = Adafruit_NeoPixel(2, 2, NEO_RGB + NEO_KHZ800);

#include <Wire.h>
#include <ADXL345.h>
//#include <TimeLib.h>
 
ADXL345 adxl;
int x, y, z;
int x_pre = 0;//x座標の前の値を保存する変数
//int time_pre = 0;//ひとつ前のタイムを取る
int attack_count = 0;//2秒以内に2回連続で振る「打」動作があったとき、振ったと判定する
//double g[3];

void setup(){
  Serial.begin(9600);
  //pinMode(3, INPUT_PULLUP);//D3ポートをタクトスイッチ1（SW1）のArduinoからのINPUTに設定する
  adxl.powerOn();
  x = 0;
  y = 0;
  z = 0;
  x_pre=0;
}
 
void loop() {

  //time = millis();

  //int sensorValue = analogRead(A0);
  //Serial.println(sensorValue);
  
  adxl.readXYZ(&x, &y, &z);
    
  /*Serial.print(x);
  Serial.print(" ");
  Serial.print(y);
  Serial.print(" ");
  Serial.print(z);
  Serial.println();*/

 if( abs( x_pre - x ) > 50 ){//10以上の加速度を検知したらaをわたす（attack｜アタック）absは絶対値を返す
     //Serial.write( a  Serial.println(x);//xの値を出力に設定ttack );//xの値を出力に設定
     //attack = 1;
     //attack_count++;
     //Serial.print("打");
     Serial.println('a');
          
     //Serial.println(time);
  }

  x_pre = x;//前の値としていれておく
  //time_pre = time;//前の時間を入れる

  //Serial.println( attack );//シリアル通信で送信される　一文字
  
  //adxl.getAcceleration(g);
  //Serial.print(g[0]);
  //Serial.print(g[1]);
  //Serial.print(g[2]);
  delay(10);
}
