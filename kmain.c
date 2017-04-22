#include "framebuffer.h"

void kmain() {
    fb_clear();
    fb_write("Welcome To dingOS v0.0.1", 24);
    fb_move_cursor(80);
}