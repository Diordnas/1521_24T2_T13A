
#include <stdint.h>

#define MIDDLE_SIX 0b00000000000001111110000000000000

uint32_t six_middle_bits(uint32_t u) {
    // Extract and return six middle bits

    // Use and to retain the middle six bits
    u &= MIDDLE_SIX;

    // Shift those six bits to the right position
    u >>= 13;

    return u;
}