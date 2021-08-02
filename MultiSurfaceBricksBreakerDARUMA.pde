/***************************************************

 K214　知識メディア方法論
 
 ゲーム名｜PressureBricksBreakerDARUMA
 ゲーム概要｜ 落としちゃったボールの個数に応じて迫りくる壁！ 壁に押しつぶされるが先か、すべてのブロックを崩すが先か！ 上下左右の４方向に動くバーをたくみにあやつれ…
 
 開発者｜Nishikori Sakura
 開発日｜2021/07/08
 
 コード構成｜
 ー　MultiSurfaceBricksBreakerDARUMA.pde
 ー　Ball.pde
 ー　Bar.pde
 ー　Block.pde
 ー　PreBlock.pde
 
 テトリスの画像
https://www.flaticon.com/authors/prettycons

 ***************************************************/

/* サウンドの再生にはminimではなく、Processingの外部ライブラリ「sound」を使いました */


import  processing.serial.*;
Serial  serial;

import processing.sound.*;
SoundFile soundfile;
SoundFile bgm; //ゲーム中のBGM
SoundFile attackWall; //ボールと壁の衝突音
SoundFile attackBar; //ボールとバーの衝突音
SoundFile attackBlock; //ボールとバーの衝突音

PImage img01; //背景画像を読み込み
PImage clear; //クリア画像を読み込み

int under_ballHit; //下の壁にぶつかった回数を保持する関数

//この２つの時間の差を●（２）秒とかのうちに変動していたら、アタックにする
//int attackTime01;//アタックをうけとった１回目の時間
//int attackTime02;//アタックをうけとった２回目の時間

float attackTime01;//アタックをうけとった１回目の時間
float attackTime02;//アタックをうけとった２回目の時間

void setup(){ //実行時1回だけ処理される

  attackTime01 = 0.0;//アタックをうけとった１回目の時間
  attackTime02 = 0.0;//アタックをうけとった２回目の時間

  size( 800, 1200 ); //テトリスの2:3画面をイメージした画面サイズを設定
  arrangeBlocks(); //画面上部に表示される消す対象のブロック配置を初期化する関数を呼び出す
  
  serial = new Serial( this, "COM3", 9600 );//シリアル通信をするポート番号：デバイスマネージャ
  
  /* ゲーム内で使う音声ファイルを読み込む　*/
  bgm = new SoundFile( this, "bgm.mp3");
  soundfile = new SoundFile(this, "collideWall.mp3");
  attackWall = new SoundFile( this, "attackWall.mp3");
  attackBar = new SoundFile( this, "attackBar.mp3");
  attackBlock = new SoundFile( this, "attackBlock.mp3");
  soundfile.amp(0.5); // 音量 0～1
  img01 = loadImage( "background_m.jpg" );
  clear = loadImage("clear.jpg");
  
  under_ballHit = 0;
  
  bgm.play(); //ゲーム中のBGMを再生

}

void draw(){

  image( img01, 0, 0 ); //背景に画像を設定
  // image(clear, width/4, height/4, width/2, height/2);
   int j = 0;
   
   fill(#ffffff,256);
   
   //int ss = 0;
   
/*振った！をうけとったら*/
  while ( serial.available() > 0 ){//受信したデータをByteで返すー＞文字が入っているとき　0,1
    char c = serial.readChar();//受信したデータを「文字」をして取り出している(1文字-1byte)
    if ( c == 'a' ){
      
      ballVX = ballVX + 2 ;
      
      attackBlock.play(); //BallとBarの衝突時に効果音を出力する
      
      if( under_ballHit >= 14 ){//一気にクリア！！！！
       println("clear");
      textSize( 40 );
      fill(255,255,255);
      //text( "Pressure Brick Breaker ", 0, height/2 - 50 );
      text( "CLEAR!!", 0, height/2 - 300 );
      stroke(100);
      image(clear, 0, 0, width, height);
      deleteBlocks();
      deletePreBlocks();
      exit();//ゲーム画面を終了する
       //exit();
      //clear(); //<>//
      }   
   
      else if( under_ballHit < 14 && under_ballHit > 0 ){//マイナスにならないように
      
       textSize( 40 );
        //text( "Pressure Brick Breaker ", 0, height/2 - 400 );
        //text( "ATTACK!!", 0, height/2 - 300 );
        
        under_ballHit = under_ballHit - 1; //下面に当たったら行の数を1つ増やして
        
          while( j != 17 ){//ブロックを一行消して
            preBlockHitFlag[ preBlockNum - j ] = false;
            j++;
          }
          if( preBlockNum % 16 == 1 ){//あまり1なるなら
            preBlockNum = preBlockNum - 1;
          }
          
        //preBlockNum = preBlockNum - 16; //下面に当たったら行の数を1つ消して
        
        println( "under_ballHitの数　減ってないといけない" + under_ballHit);
        println( "preBlockNumの数まだへらない　下から" + preBlockNum);
      }
      
      //preBlockNum = 0; //下面に当たったら行の数を1つ消して
      
      //arrangeAttackBlocks();//falseにする処理
      //drawPreBlocks();
    }
  }
  
  /*　プレッシャー壁の残り枚数を表示　*/
  textSize( 40 );
  text( "Pressure Brick Breaker DARUMA", 0, height/2 - 200);
  text( "Remaining"+ ( 15 - under_ballHit ) +"!!", 0, height/2 - 150 );
  //text( "Remaining"+ ( 15 - under_ballHit ) +"!!", 0, height/2 + 50 );

  
  /* BallとBarの衝突判定 */
  if ( ballX >= barX && ballX <= barX + barWidth ) { //Ballがx軸上でBarの幅にかぶっていて
    if( ballY + ballRadius > barY && ballY - ballRadius < barY + barHeight ){ //y軸上Ballの端とBarがかぶっていたら
      soundfile.amp(0.5); //0～1の音量範囲のうち0.5の音量で
      attackBar.play(); //BallとBarの衝突時に効果音を出力する
      ballVY = - ballVY; //衝突したのでy軸の等速度を変える
    }
  }

  /* Ballと複数Blockの衝突判定 */
  for( int i = 0; i < MAX_BLOCKS; i++ ){
    if( blockHitFlag[i] == false ){
      if( ballX > blockX[i] && ballX < blockX[i] + blockWidth[i] ){
        if( ballY > blockY[i] && ballY < blockY[i] + blockHeight[i] ){
          soundfile.play(); //かべにあたっときに音をならす
          ballVY = - ballVY;     
          blockHitFlag[i] = true;
        }
      }
    }
  }

  /* Ball */
  moveBall();
  drawBall();

  /* Bar */
  moveBar();
  drawBar();

  /* Block */
  moveBlocks();
  drawBlocks();
  
  /* PreBlockの配置を指定する関数の呼び出し */
  drawPreBlocks();
}

void clear(){
  println("clear関数はいった");
  textSize( 40 );
  //text( "Pressure Brick Breaker ", 0, height/2 - 400 );
  //text( "CLEAR!!", 0, height/2 - 300 );
  //image(clear, width/4, height/4, width/2, height/2);
  delay(2000);
  //image( clear, , 0 ); //背景に画像を設定
  //exit();//ゲーム画面を終了する
}
