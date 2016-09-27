#include "myLib.h"

u16 *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, u16 color)
{
	videoBuffer[OFFSET(row, col, 240)] = color;
}


void drawRect(int row, int col, int height, int width, u16 color)
{
	volatile unsigned short c = color;
	for(int r = 0; r < height; r++) {
    	DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
    }
}

void waitForVBlank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}


void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	DMA[channel].src = source;
	DMA[channel].dst = destination;
	DMA[channel].cnt = DMA_ON | control;
}