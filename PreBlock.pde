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
boolean[] preBlockHitFlag = new boolean[ MAX_PREBLOCKS ];//ボールが当たった列かどうかを格納する

  int preBlockNum = 0; //追加ブロックの数を格納する変数
  
//配列に格納された追加のブロックを描く関数
//void drawPreBlocks(){
//  for( int r = 0; r < MAX_PREBLOCKS ; r++ ){
//    if( preBlockHitFlag[ r ] == true ){
//      rect( preBlockX[ r ], preBlockY[ r ], preBlockWidth[ r ], preBlockHeight[ r ] );
//    }
//  }
//}

int m = 16;
    
void drawPreBlocks(){
  for( int r = 0; r < MAX_PREBLOCKS ; r++ ){
        
    if( preBlockHitFlag[ r ] == true ){
     
     if( 0 <= r && r < 16 ){//一番下 だるま 茶色
       fill(#8b4513,256);
     }
     else if( 16 <= r && r < 32 ){//２行目　グレー
       fill(#708090,256);
     }
     else if( 32 <= r && r < 48 ){//３行目　むらさき
       fill(#8a2be2,256);
     }
     else if( 48 <= r && r < 54 ){//２行目　ピンク
       fill(#da70d6,256);
     }
      else if( 54 <= r && r < 70 ){//３行目　青
       fill(#0000ff,256);
     }
     else if( 70 <= r && r < 86 ){//２行目　水色
       fill(#4169e1,256);
     }
     else if( 86 <= r && r < 102 ){//３行目　ライムグリーン
       fill(#32cd32,256);
     }
     else if( 102 <= r && r < 118 ){//緑
       fill(#008000,256);
     }
     else if( 118 <= r && r <134 ){//少し薄い緑
       fill(#66cdaa,256);
     }
     else if( 134 <= r && r < 150 ){//黄緑
       fill(#90ee90,256);
     }
     else if( 150 <= r && r < 166 ){//黄色
       fill(#ffff00,256);
     }
     else if( 166 <= r && r < 182 ){//薄いオレンジ
       fill(#ffa500,256);
     }
     else if( 182 <= r && r < 198 ){//オレンジ
       fill(#ff8c00,256);
     }
     else if( 198 <= r && r < 214 ){//薄い赤
       fill(#fa8072,256);
     }
     else if( 214 <= r && r < 230 ){//赤
       fill(#ff0000,256);
     } //<>//
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
    preBlockHitFlag[ preBlockNum ] = true;
    preBlockX[ preBlockNum ] = BLOCK_GAP + i % PREBLOCK_ROWS * ( preBlockWidth[ preBlockNum ] + BLOCK_GAP );
    preBlockY[ preBlockNum ] = height - preBlockHeight[ preBlockNum ] * under_ballHit;

    preBlockNum++;//　追加ブロックの要素数を1つ増やす
    i++;//　x軸を1つ右にずらす
  }
}

/*　アタックされた消えるブロックの配置処理　*/
void arrangeAttackBlocks(){
  int l = 0;
  
  /*　追加ブロックの配置を配列に格納する　下面にあたると1行増える　*/
  while( l < 16 ){
    //preBlockWidth[ preBlockNum ] = 158.0f;
    //preBlockHeight[ preBlockNum ] = 40.0f;
    preBlockHitFlag[ preBlockNum ] = false;
    println( "preBlockNumの数　減る" + preBlockNum);
    //preBlockX[ preBlockNum ] = BLOCK_GAP + l % PREBLOCK_ROWS * ( preBlockWidth[ preBlockNum ] + BLOCK_GAP );
    //preBlockY[ preBlockNum ] = height - preBlockHeight[ preBlockNum ] * under_ballHit;

    preBlockNum--;//　追加ブロックの要素数を1つ増やす
    l++;//　x軸を1つ右にずらす
  }
  //preBlockNum = preBlockNum - 16;

}

void deletePreBlocks(){
int i = 0;
  
  /*　追加ブロックの配置を配列に格納する　下面にあたると1行増える　*/
  while( i < MAX_PREBLOCKS ){
    preBlockWidth[ i ] = 158.0f;
    preBlockHeight[ i ] = 40.0f;
    preBlockHitFlag[ i ] = false;
    preBlockX[ i ] = BLOCK_GAP + i % PREBLOCK_ROWS * ( preBlockWidth[ preBlockNum ] + BLOCK_GAP );
    preBlockY[ i ] = height - preBlockHeight[ preBlockNum ] * under_ballHit;

    //preBlockNum--;//　追加ブロックの要素数を1つ増やす
    i++;//　x軸を1つ右にずらす
  }
  drawPreBlocks();
}
