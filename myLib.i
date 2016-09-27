# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 28 "myLib.h"
extern unsigned short *videoBuffer;
# 44 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, unsigned short color);
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
# 91 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);
# 100 "myLib.h"
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
 int height;
 int width;
 int score;
} PLAYER;

typedef struct
{
 int row;
 int col;
 int radius;
 u16 color;
 int rd;
 int cd;
} BALL;
# 2 "myLib.c" 2

u16 *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, u16 color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}


void drawRect(int row, int col, int height, int width, u16 color)
{
 volatile unsigned short c = color;
 for(int r = 0; r < height; r++) {
     DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}

void waitForVBlank()
{
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = (1 << 31) | control;
}
