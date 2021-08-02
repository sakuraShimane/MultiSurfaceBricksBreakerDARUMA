/*******************************
  Barの動き制御と衝突判定の関数
 *******************************/
 
float barX = 400.0f;
float barY = 950.0f;
float barVX = 15.0f;
float barWidth = 200.0f;
float barHeight = 30.0f;

void moveBar(){
  
  /* 左右移動 */
  if( keyPressed ){
    if( keyCode == RIGHT ){
      barX = barX + barVX;
    }
    else if( keyCode == LEFT ){
      barX = barX - barVX;
    }
    
    /* 上下移動　*/
    else if( keyCode == UP){
      barY = barY - 5;
    }
    else if( keyCode == DOWN ){
      barY = barY + 5;
    }
  }
}

void drawBar(){

  //右端にぶつかったらとまる
  if( barX + barWidth >= width ){
    barX = width - barWidth;
  }
  
  //左端にぶつかったら止まる
  if( barX <= 0 ){
    barX = 0;
  }
  
  //上端にぶつかったらとまるー＞できなかったところ
  if( barY <= barHeight * 13 + BLOCK_GAP * 13){
      barY = barY - 0;
  }
  
  //下端にぶつかったら止まる
  if( preBlockNum == 0){
    if( barY + barHeight >= preBlockY[ preBlockNum ] ){
      barY = barY + 0;
    }
  }
  
  else if( barY + barHeight >= preBlockY[ preBlockNum-1 ] ){
    barY = preBlockY[ preBlockNum-1 ] - preBlockHeight[ preBlockNum-1 ];
  }
  
  rect( barX, barY, barWidth, barHeight );
}
