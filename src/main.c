#include "../include/neslib.h"
#include "../include/nesdoug.h"

#define BLACK 0x0F
#define WHITE 0x30
#define DARK_GRAY 0x00
#define LIGHT_GRAY 0x10

#pragma bss-name(push, "ZEROPAGE")

unsigned char i;
const unsigned char text[] = "Hello, world!";

const unsigned char palette[] = {
    BLACK, DARK_GRAY, LIGHT_GRAY, WHITE,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0
};

void main(void){
    ppu_off();
    pal_bg(palette);
    vram_adr(NTADR_A(10, 14));

    i = 0;
    while(text[i]){
        vram_put(text[i]);
        i++;
    }

    ppu_on_all();

    while(1){

    }
}