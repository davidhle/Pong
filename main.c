// Welcome to my ~game~ -David Le NOW WITH STRUCTS AND TEXT
#include "myLib.h"
#include <stdio.h>
#include <stdlib.h>
#include "text.h"

int gameOver;
char buffer[41];

// Players 1 and 2 and the ball
PLAYER player1;
PLAYER player2;
BALL ball;

void drawPlayer(PLAYER*);
void drawBall(BALL*);

int main()
{
	REG_DISPCTL = BG2_ENABLE | MODE3;
	initialize();
	while(gameOver == 0) {
		update();
		draw();
		waitForVBlank(); 
		erase();
	}
}

void initialize()
{
	borders();
	gameOver = 0;

	//inital player and ball characteristics
	player1.row = 70;
	player1.col = 0;
	player1.height = 20;
	player1.width = 4;
	player1.color = CYAN;
	player1.score = 0;

	player2.row = 70;
	player2.col = 236;
	player2.height = 20;
	player2.width = 4;
	player2.color = GREEN;
	player2.score = 0;

	ball.row = 80;
	ball.col = 120;
	ball.radius = 3;
	ball.rd = 1;
	ball.cd = 1;
	ball.color = RED;
}

//Draws the ball and players
void draw() 
{
	PLAYER* p1 = &player1;
	PLAYER* p2 = &player2;
	BALL* b = &ball;
	drawBall(b);
	drawPlayer(p1);
	drawPlayer(p2);
	sprintf(buffer, "Player 1 Score: %d", (p1->score));
	drawString(10, 7 + (1/2), buffer, CYAN);
	sprintf(buffer, "Player 2 Score: %d", (p2->score));
	drawString(10, 130 + (1/2), buffer, GREEN);
}
//Erases the "trail" that the "objects make when they move"
void erase() 
{
	PLAYER* p1 = &player1;
	PLAYER* p2 = &player2;
	BALL* b = &ball;
	eraseBall(b);
	erasePlayer(p1);
	erasePlayer(p2);
}

//draws the ball with the struct
void drawBall(BALL* ball)
{
	int rsq = ball -> radius * ball -> radius;
	for(int y = ball -> radius * -1; y <= ball -> radius; y++) {
		for(int x = ball -> radius * -1; x <= ball -> radius; x++) {
			if((x*x) + (y*y) <= rsq) {
				setPixel(ball->row+x, ball->col+y, ball->color);
			}
		}
	}
}

//erases the ball
void eraseBall(BALL* ball)
{
	int rsq = ball -> radius * ball -> radius;
	for(int y = ball -> radius * -1; y <= ball -> radius; y++) {
		for(int x = ball -> radius * -1; x <= ball -> radius; x++) {
			if((x*x) + (y*y) <= rsq) {
				setPixel(ball->row+x, ball->col+y, BLACK);
			}
		}
	}
}

//draws player with struct
void drawPlayer(PLAYER* p)
{
	drawRect(p->row, p->col, p->height, p->width, p->color);
}

//erases player
void erasePlayer(PLAYER* p)
{
	drawRect(p->row, p->col, p->height, p->width, BLACK);
}

//handles movement of player 1's paddle
void updatePaddle1()
{
	PLAYER* p1 = &player1;
	if(BUTTON_HELD(BUTTON_UP)){
		(p1->row) = (p1->row) - 3;
		if((p1->row) < 25) {
			(p1->row) = 25;
		}
			
	}
	if(BUTTON_HELD(BUTTON_DOWN)){
		(p1->row) = (p1->row) + 3;
		if((p1->row) > 115) {
			(p1->row) = 115;
		}
	}
}

//handles movement of player 2's paddle
void updatePaddle2()
{
	PLAYER* p2 = &player2;
	if(BUTTON_HELD(BUTTON_LEFT)){
		(p2->row) = (p2->row) - 3;
		if((p2->row) < 25) {
			(p2->row) = 25;
		}
			
	}
	if(BUTTON_HELD(BUTTON_RIGHT)){
		(p2->row) = (p2->row) + 3;
		if((p2->row) > 115) {
			(p2->row) = 115;
		}
	}
}

//For the aesthetic!!
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
// Updates the score of player 1
void updateScore1()
{
	PLAYER* p1 = &player1;

	sprintf(buffer, "Player 1 Score: %d", (p1->score) - 1);
	drawString(10, 7 + (1/2), buffer, BLACK);
	sprintf(buffer, "Player 1 Score: %d", (p1->score));
	drawString(10, 7 + (1/2), buffer, CYAN);
	if ((p1->score) == 3) {
	sprintf(buffer, "Player 1 Wins!");
	drawString(145, 80, buffer, CYAN);
		gameOver = 1;
	}
}
// Updates the score of player two
void updateScore2()
{
	PLAYER* p2 = &player2;	

	sprintf(buffer, "Player 2 Score: %d", (p2->score) - 1);
	drawString(10, 130 + (1/2), buffer, BLACK);
	sprintf(buffer, "Player 2 Score: %d", (p2->score));
	drawString(10, 130 + (1/2), buffer, GREEN);
	if ((p2->score) == 3) {
		sprintf(buffer, "Player 2 Wins!");
		drawString(145, 80, buffer, GREEN);
		gameOver = 1;
	}
}

//Deals with all collisions i.e., against the wall, hits a paddle etc.
void update()
{
	PLAYER* p1 = &player1;
	PLAYER* p2 = &player2;
	BALL* b = &ball;

	b->row += b->rd;
	b->col += b->cd;

	//Checks if ball hits top border
	if((b->row)  <= 28){
		(b->row) = 29;
		(b->rd) = (b->rd * -1);
	}
	//Checks if ball hits bottom border
	if((b->row) >= 131){
		(b->row) = 130;
		(b->rd) = (b->rd * -1);
	}
	//Checks for collision with left paddle
	if((b->col) == 5) {
		if((b->row) > ((p1->row) - 20)){
			if ((b->row) < ((p1->row) + 20)) {
				(b->col) = 6;
				(b->cd) = (b->cd * -1);
			}
		}
	}
	//Checks if ball hits left wall
	if((b->col) <= 1) {
		p2 -> score = p2 -> score++;
		updateScore2();
		(b->col) = 2;
		(b->cd) = (b->cd * -1);
	}
	//Checks for collision with right paddle
	if((b->col) == 236) {
		if((b->row) > ((p2->row) - 20)){
			if((b->row) < ((p1->row) + 20)) {
				(b->col) = 235;
				(b->cd) = (b->cd * -1);
			}
		}
	}
	//Checks if ball hits right wall
	if((b->col) >= 239) {
		p1 -> score = p1 -> score++;
		updateScore1();
		(b->col) = 238;
		(b->cd) = (b->cd * -1);
	}
	updatePaddle1();
	updatePaddle2();
}