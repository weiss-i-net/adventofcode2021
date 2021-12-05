#include <stdio.h>
#include <string.h>

int main() {

    char line[256];

    int pos = 0, depth = 0;

    while (fgets(line, 256, stdin)) {
        int end = line[strlen(line) - 1] - '0';
        switch (line[0]) {
            case 'f': pos += end;
                      break;
            case 'u': depth -= end;
                      break;
            case 'd': depth += end;
        }
    }

    printf("%d", pos*depth);

    return 0;
}
