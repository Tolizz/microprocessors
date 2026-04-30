#include <string.h>
#include "testbench.h"

int c_access_hash(char *pin) {
    int hash = strlen(pin);
    int lut[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29};
    for (int i = 0; pin[i] != '\0'; i++) {
        char c = pin[i];
        if (c >= '0' && c <= '9') hash += lut[c - '0'];
        else if (c >= 'A' && c <= 'Z') hash += (c * 2);
        else if (c >= 'a' && c <= 'z') hash += (c - 32);
    }
    return hash;
}

int c_clearance_level(int hash) {
    int ones = 0;
    unsigned int temp_hash = hash;
    while (temp_hash > 0) {
        if (temp_hash & 1) ones++;
        temp_hash >>= 1;
    }
    return ones % 6;
}

int c_lucas(int n) {
    if (n == 0) return 2;
    if (n == 1) return 1;
    return c_lucas(n - 1) + c_lucas(n - 2);
}

int c_bonus(char *pin) {
    int checksum = 0;
    int salt = 0xAA;
    for (int i = 0; pin[i] != '\0'; i++) {
        checksum ^= (pin[i] ^ salt);
    }
    return checksum;
}