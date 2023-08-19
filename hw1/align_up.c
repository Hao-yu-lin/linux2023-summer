#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

static inline uintptr_t align_up(uintptr_t sz, size_t alignment)
{
    uintptr_t mask = alignment - 1;
    if ((alignment & mask) == 0) {  /* power of two? */
        return (sz + mask) & ~mask;       
    }
    return (((sz + mask) / alignment) * alignment);
}

int main()
{
    printf("align(120, 4) = %ld\n", align_up(120, 4));
    printf("align(121, 4) = %ld\n", align_up(121, 4));
    printf("align(122, 4) = %ld\n", align_up(122, 4));
    printf("align(123, 4) = %ld\n", align_up(123, 4));
    printf("align(124, 4) = %ld\n", align_up(124, 4));
    printf("align(125, 4) = %ld\n", align_up(125, 4));

    return 0;
}