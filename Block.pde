/*******************************
  Block
 *******************************/

final int MAX_BLOCKS = 208;
final int BLOCK_ROWS  =  16; // ブロックの列の要素数　横に何個並ぶか
final int BLOCK_GAP  =  2; // ブロックとブロックの間隔

float[] blockX = new float[ MAX_BLOCKS ];
float[] blockY = new float[ MAX_BLOCKS ];

float[] blockWidth = new float[ MAX_BLOCKS ];
float[] blockHeight = new float[ MAX_BLOCKS ];
boolean[] blockHitFlag = new boolean[ MAX_BLOCKS ];

void moveBlocks(){
  // Blockは動かない
}

/*　Blockの描画処理　*/
void drawBlocks(){
  for( int i = 0; i < MAX_BLOCKS; i++ ){
    if( blockHitFlag[i] == false ){
      rect( blockX[i], blockY[i], blockWidth[i], blockHeight[i] );
    }
  }
}

/* ブロックの配置処理　*/
void arrangeBlocks(){
  int i = 0;
  while( i < MAX_BLOCKS ){
    blockWidth[i] = 78.0f;
    blockHeight[i] = 15.0f;
    blockHitFlag[i] = false;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * ( blockWidth[i] + BLOCK_GAP );
    blockY[i] = BLOCK_GAP + i / BLOCK_ROWS * ( blockHeight[i] + BLOCK_GAP );
    i++;
  }
}

void deleteBlocks(){
  
  int i = 0;
  while( i < MAX_BLOCKS ){
    blockWidth[i] = 78.0f;
    blockHeight[i] = 15.0f;
    blockHitFlag[i] = true;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * ( blockWidth[i] + BLOCK_GAP );
    blockY[i] = BLOCK_GAP + i / BLOCK_ROWS * ( blockHeight[i] + BLOCK_GAP );
    i++;
  }
  drawBlocks();
}
