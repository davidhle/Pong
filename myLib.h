typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

// Useful addresses
#define REG_DISPCTL (*(u16 *)0x4000000)
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)
#define VIDBUFADR ((unsigned short *)0x6000000)

// Generally useful symbols
#define FOREVER 1
#define TRUE 1
#define FALSE 0

// Video
#define MODE3 3
#define BG0_ENABLE (1<<8)
#define BG1_ENABLE (1<<9)
#define BG2_ENABLE (1<<10)
#define BG3_ENABLE (1<<11)

#define SCREENWIDTH 240
#define SCREENHEIGHT 160

#define SCREENOFFSET(r,c) ((r)*240+(c))
#define OFFSET(r,c,rowlen) ((r)*(rowlen)+(c))

extern unsigned short *videoBuffer;

// Colors
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)

#define WHITE COLOR(31,31,31)
#define BLACK 0
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define YELLOW COLOR(31,31,0)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define LTGRAY COLOR(25, 25, 25)

// Prototypes
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

// *** Input =========================================================

// Buttons
#define BUTTONS (*(volatile unsigned int *)0x04000130)

#define BUTTON_A 1
#define BUTTON_B 2
#define BUTTON_SELECT 4
#define BUTTON_START 8
#define BUTTON_RIGHT 16
#define BUTTON_LEFT 32
#define BUTTON_UP 64
#define BUTTON_DOWN 128
#define BUTTON_R 256
#define BUTTON_L 512

#define BUTTON_INDEX_A 0
#define BUTTON_INDEX_B 1
#define BUTTON_INDEX_SELECT 2
#define BUTTON_INDEX_START 3
#define BUTTON_INDEX_RIGHT 4
#define BUTTON_INDEX_LEFT 5
#define BUTTON_INDEX_UP 6
#define BUTTON_INDEX_DOWN 7
#define BUTTON_INDEX_R 8
#define BUTTON_INDEX_L 9

// TODO: add two macros to handle buttons
#define BUTTON_HELD(key) (~(BUTTONS) & key)
#define BUTTON_PRESSED(key) (!(~oldButtons&(key))&&(~buttons&(key)))


// *** DMA =========================================================

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);

// DMA channel 3 register definitions
#define REG_DMA3SAD         *(volatile u32*)0x40000D4  // source address
#define REG_DMA3DAD         *(volatile u32*)0x40000D8  // destination address
#define REG_DMA3CNT         *(volatile u32*)0x40000DC  // control register

//Structs

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

#define DMA ((volatile DMA_CONTROLLER *) 0x40000B0)

#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)
#define DMA_DESTINATION_RESET (3 << 21)

#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)

#define DMA_REPEAT (1 << 25)

#define DMA_16 (0 << 26)
#define DMA_32 (1 << 26)

#define DMA_NOW (0 << 28)
#define DMA_AT_VBLANK (1 << 28)
#define DMA_AT_HBLANK (2 << 28)
#define DMA_AT_REFRESH (3 << 28)

#define DMA_IRQ (1 << 30)
#define DMA_ON (1 << 31)
