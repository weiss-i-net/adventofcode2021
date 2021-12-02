#include <stdio.h>
#include <string.h>

int main() {

    char line[256];

    int pos = 0, depth = 0, aim = 0;

    while (gets(line)) {
        int end = line[strlen(line) - 1] - '0';
        switch (line[0]) {
            case 'f': pos += end;
                      depth += aim*end;
                      break;
            case 'u': aim -= end;
                      break;
            case 'd': aim += end;
        }
    }

    printf("%d", pos*depth);

    return 0;
}
