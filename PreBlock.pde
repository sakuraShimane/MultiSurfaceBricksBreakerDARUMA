/*******************************
  Pressure Block! 迫りくるブロックの壁たち
 *******************************/
 
final int MAX_PREBLOCKS = 624;//追加ブロックの全部の個数
final int PREBLOCK_ROWS  =  16;  // ブロックの列の要素数　横に何個並ぶか

//　下の壁に出現するブロックの配置等を格納する配列
float[] preBlockX = new float[ MAX_PREBLOCKS ];
float[] preBlockY = new float[ MAX_PREBLOCKS ];
float[] preBlockWidth = new float[ MAX_PREBLOCKS ];
float[] preBlockHeight = new float[ MAX_PREBLOCKS ];
boolean[] preBlockHitFlag = new boolean[ MAX_PREBLOCKS ];//ボールが当たったかどうか

  int preBlockNum = 0; //追加ブロックの数を格納する変数
  
//追加のブロックを描く関数　まずは下面だけ
void drawPreBlocks(){
  for( int r = 0; r < MAX_PREBLOCKS ; r++ ){
    if( preBlockHitFlag[ r ] == true ){
      rect( preBlockX[ r ], preBlockY[ r ], preBlockWidth[ r ], preBlockHeight[ r ] );
    }
  }
}

/*　追加ブロックの配置処理　*/
void arrangePreBlocks(){
  int i = 0;
  
  /*　追加ブロックの配置を配列に格納する　下面にあたると1行増える　*/
  while( i < 16 ){
    preBlockWidth[ preBlockNum ] = 158.0f;
    preBlockHeight[ preBlockNum ] = 40.0f;
    preBlockHitFlag[ preBlockNum ] = true;//　ボールが当たったらフラグをたてる
    preBlockX[ preBlockNum ] = BLOCK_GAP + i % PREBLOCK_ROWS * ( preBlockWidth[ preBlockNum ] + BLOCK_GAP );
    preBlockY[ preBlockNum ] = height - preBlockHeight[ preBlockNum ] * under_ballHit;

    preBlockNum++;//　追加ブロックの要素数を1つ増やす
    i++;//　x軸を1つ右にずらす
  }
}
