# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"






# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 41 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawPlayer(int row, int col, unsigned short color);
void drawBall(int row, int col, int radius, unsigned short color);
void delay(int n);
void updatePaddle1();
void updatePaddle2();
void updateScore1();
void updateScore2();
void draw();
void erase();
void borders();
void update();
void waitForVBlank();
# 90 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);
# 99 "myLib.h"
typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;

typedef struct
{
 int row;
 int col;
 u16 color;
 int score;
} PLAYER;
# 8 "text.c" 2
# 1 "text.h" 1
# 9 "text.h"
void drawChar(int , int , char , unsigned short );
void drawString(int row, int col, char *str, unsigned short color);

extern const unsigned char fontdata_6x8[12288];
# 9 "text.c" 2

void drawChar(int row, int col, char ch, unsigned short color)
{
    for(int r = 0; r < 8; r++) {
     for(int c = 0; c < 6; c++) {
      if(fontdata_6x8[((r)*(6)+(c)) + ch*48]) {
       setPixel(row + r, col +c, color);
      }
     }
    }
}

void drawString(int row, int col, char *str, unsigned short color)
{
    while(*str) {
     drawChar(row, col, *str, color);
     str++;
     col = col + 6;
    }
}


const unsigned char fontdata_6x8[12288] = {

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
# 86 "text.c"
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,0,0,1,1,
1,1,0,0,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,0,0,0,0,1,
1,0,1,1,0,1,
1,0,1,1,0,1,
1,0,0,0,0,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,1,1,1,
0,0,0,0,1,1,
0,0,1,1,0,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,0,0,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,1,1,0,1,1,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,0,0,
0,0,1,0,1,0,
0,0,0,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,1,1,1,1,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,1,1,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,1,1,
0,1,1,0,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,1,
0,1,1,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,1,1,
0,1,0,0,1,1,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,1,1,
0,1,0,1,0,1,
0,1,1,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,1,1,1,
0,1,0,1,0,1,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,1,1,1,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,0,0,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,1,0,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,1,0,1,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,1,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,0,1,0,
0,1,0,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,1,0,1,0,
0,1,0,1,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,0,1,1,
0,1,0,1,0,1,
0,0,0,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,

1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,
1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,0,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,0,0,0,
1,0,0,1,1,0,
1,0,0,0,0,1,
1,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,1,1,
0,1,1,0,0,1,
1,0,0,0,0,1,
0,0,0,0,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
1,1,0,0,1,0,
1,1,0,0,1,1,
1,1,1,1,1,0,
0,0,1,1,1,1,

0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
};