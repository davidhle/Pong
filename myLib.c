#include "myLib.h"

u16 *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, u16 color)
{
	videoBuffer[OFFSET(row, col, 240)] = color;
}

// Creates a rectangle to represent a player/paddle
void drawPlayer(int row, int col, u16 color)
{
	for(int height = 0; height < 20; height++) {
		for(int width = 0; width < 4; width++) {
			setPixel(row + height, col + width, color);
		}
	}
}

// Creates the ball
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
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}