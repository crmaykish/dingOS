#define FB_GREEN     2
#define FB_DARK_GREY 8

char *fb = (char *) 0x000B8000;

void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg) {
    fb[i] = c;
    fb[i+1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
}

void fb_clear() {
    int i;
    for (i = 0; i < 80 * 25; i++) {
        fb_write_cell(i * 2, ' ', FB_GREEN, FB_DARK_GREY);
    }
}

void kmain() {
    fb_clear();
}