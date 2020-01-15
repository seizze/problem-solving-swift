//
//  main.c
//  ascending_sort
//
//  Created by Chaewan Park on 2020/01/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

#include <stdio.h>

int table[10001] = {0};

int main() {
    int length;
    scanf("%d", &length);
    
    int input;
    for (int i = 0; i < length; i++) {
        scanf("%d", &input);
        table[input] += 1;
    }
    
    for (int i = 0; i< 10001; i++) {
        while (table[i] > 0) {
            printf("%d\n", i);
            table[i] -= 1;
        }
    }
    
    return 0;
}
