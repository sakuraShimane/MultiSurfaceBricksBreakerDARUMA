/*******************************
  Ballの動き制御と衝突判定の関数
 *******************************/

float ballX = 200.0f;
float ballY = 300.0f;
float ballVX = 15.0f;//ボールのはやさ
float ballVY = 15.0f;//ボールのはやさ
float ballRadius = 15.0f;//ボールの半径

int missCounter = 0;

void moveBall(){
  
  //ボールのx軸を制御する
  ballX = ballX + ballVX;
  ballY = ballY + ballVY;
  
  if( ballX > width || ballX < 0 ){
    ballVX = -ballVX;
  }
  
  if( ballY < 0 ){
    ballVY = - ballVY;
  }

  if( ballY + ballRadius >= height ){ //まだ追加ブロックがないとき

    attackWall.play(); //かべにあたっときに音をならす
    
    if( under_ballHit < 15 ){
      under_ballHit++; //下面に当たったら行の数を1つ増やして
      arrangePreBlocks(); //追加のブロックの配置を追加する関数を呼び出す
    }
    else{
      /*　プレッシャー壁の残り枚数を表示　*/
      textSize( 40 );
      //text( "Pressure Brick Breaker ", 0, height/2 - 50 );
      text( "GAME OVER!!", 0, height/2 - 300 );
      exit();//ゲーム画面を終了する
    }
    
    ballVY = -ballVY;
  }
}

void drawBall(){
  ellipse( ballX, ballY, ballRadius * 2, ballRadius * 2 );
}
