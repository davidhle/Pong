// Welcome to my ~game~
#include "myLib.h"
#include <stdio.h>
#include <stdlib.h>

void delay(int n);

	int row = 80;
	int col = 120;
	int rd = 1;
	int cd = 1;
	int p1Row = 80;
	int p2Row = 80;
	int p1Score = 0;
	int p2Score = 0;
	int gameOver = 0;

int main()
{
	REG_DISPCTL = BG2_ENABLE | MODE3;
	while(gameOver == 0) {
		borders();
		updatePaddle1();
		updatePaddle2();
		row += rd;
		col += cd;
		waitForVBlank();
		draw();
		delay(1);
		erase();
		//Checks if ball hits top border
		if(row < 28){
			row = 28;
			rd = -rd;
		}
		//Checks if ball hits bottom border
		if(row > 132){
			row = 132;
			rd = -rd;
		}
		//Checks for collision with left paddle
		if(col == 5) {
			if(row > (p1Row - 20)){
				if (row < (p1Row + 20)) {
					col = 6;
					cd = -cd;
				}
			}
		}
		//Checks if ball hits left wall
		if(col == 0) {
			p2Score++;
			updateScore2();
			col = 1;
			cd = -cd;

		}
		//Checks for collision with right paddle
		if(col == 236) {
			if(row > (p2Row - 20)){
				if(row < (p2Row + 20)) {
					col = 235;
					cd = -cd;
				}
			}
		}
		//Checks if ball hits right wall
		if(col == 239) {
			p1Score++;
			updateScore1();
			col = 238;
			cd = -cd;
		}
	}
}

void draw() 
{
	drawBall(row, col, 3, RED);
	drawPlayer(p1Row, 0, CYAN);
	drawPlayer(p2Row, 236, GREEN);
}

void erase() 
{
	drawBall(row, col, 3, BLACK);
	drawPlayer(p1Row, 0, BLACK);
	drawPlayer(p2Row, 236, BLACK);
}

void delay(int n)
{
	volatile int x = 0;
	for(int i = 0; i < n * 10000; i++)
	{
		x = x + 1;
	}
}

//handles movement of player 1's paddle
void updatePaddle1()
{
	if(BUTTON_HELD(BUTTON_UP)){
		p1Row = p1Row - 3;
		if(p1Row < 25) {
			p1Row = 25;
		}
			
	}
	if(BUTTON_HELD(BUTTON_DOWN)){
		p1Row = p1Row + 3;
		if(p1Row > 115) {
			p1Row = 115;
		}
	}
}

//handles movement of player 2's paddle
void updatePaddle2()
{
	if(BUTTON_HELD(BUTTON_LEFT)){
		p2Row = p2Row - 3;
		if(p2Row < 25) {
			p2Row = 25;
		}
			
	}
	if(BUTTON_HELD(BUTTON_RIGHT)){
		p2Row = p2Row + 3;
		if(p2Row > 115) {
			p2Row = 115;
		}
	}
}

void borders()
{
	for(int r = 24; r < 25; r++) {
		for(int c = 0; c < 240; c++) {
			setPixel(r, c, BLUE);
		}
	}

	for(int r = 0; r < 24; r++) {
		for(int c = 120; c < 121; c++) {
			setPixel(r, c, BLUE);
		}
	}

	for(int r = 135; r < 136; r++) {
		for(int c = 0; c < 240; c++) {
			setPixel(r, c, BLUE);
		}
	}
}

void updateScore1()
{
	if(p1Score == 1) {
		drawRect(10, 100, 2, 2, CYAN);
	} else if(p1Score == 2) {
		drawRect(10, 60, 2, 2, CYAN);
	} else if(p1Score == 3) {
		drawRect(10, 20, 2, 2, RED);
		gameOver = 1;
	}
}

void updateScore2()
{
	if(p2Score == 1) {
		drawRect(10, 135, 2, 2, GREEN);
	} else if(p2Score == 2) {
		drawRect(10, 175, 2, 2, GREEN);
	} else if(p2Score == 3) {
		drawRect(10, 215, 2, 2, RED);
		gameOver = 1;
	}
}