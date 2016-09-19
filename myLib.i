# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 41 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, unsigned short color);
void waitForVblank();
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
# 2 "myLib.c" 2

u16 *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, u16 color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}


void drawPlayer(int row, int col, u16 color)
{
 for(int height = 0; height < 20; height++) {
  for(int width = 0; width < 4; width++) {
   setPixel(row + height, col + width, color);
  }
 }
}


void drawBall(int row, int col, int radius, u16 color)
{
 int rsq = radius * radius;
 for(int y = -radius; y <= radius; y++) {
  for(int x = -radius; x <= radius; x++) {
   if((x*x) + (y*y) <= rsq) {
    setPixel(row+x, col+y, color);
   }
  }
 }
}

void drawRect(int row, int col, int height, int width, u16 color)
{
 for(int r = row; r < row + 5; r++) {
  for(int c = col; c < col +5; c++) {
   setPixel(r, c, color);
  }
 }
}

void waitForVBlank()
{
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}
