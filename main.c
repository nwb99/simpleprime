/*
 * Simple Prime Generator
 * v 1.0
 * MIT LICENSE
 * (c) 2022 Nathan 'nwb99' Barnett
 */


#define PROGVER 1.0

#include <stdio.h>
#include <stdlib.h>

/*
 * outputs numbers separated by new line \n
 * should allow for text manipulation if piped to shell utilities.
 */

int main(int argc, char **argv)
{
    int qty;

    if (argc < 2) {
        printf("usage: %s [integer]\nwhere integer is the quantity of primes to generate, less than 1 million.\n", argv[0]);
    }
    else if (atoi(argv[1]) > 1000000) {
        printf("error: must be less than 1,000,000\n");
        return 1;
    }
    else if (atoi(argv[1]) > 0) {
        qty = atoi(argv[1]);
    }
    else {
        printf("%s: %s: invalid input\n", argv[0], argv[1]);
        return 1;
    }
    
    /*
     * f is count of factors
     * j is current divisor
     * k is index of last valid prime until reach requested quantity
     */

    for (int f, j, k = 0, i = 2; k < qty; ++i) {
        f = 0;
        j = 1;

        // optimizations
        if (i != 2 && i % 2 == 0) {
            continue;
        }
        else if (i != 3 && i % 3 == 0) {
            continue;
        }
        else if (i != 5 && i % 5 == 0) {
            continue;
        }

        while (j <= i) {
            if (i % j == 0 && ++f > 2) {
               break;
            }
            ++j;
        }

        // if we only have 2 factors, then it's likely prime.
        if (f < 3) {
            printf("%d\n", i);
            ++k;
        }
    }
    return 0;
}