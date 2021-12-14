#!/usr/bin/python3
import sys, os
if not os.path.exists("input"):
    os.system("cp ../getinput.sh . && ./getinput.sh")
with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = file.read().splitlines()

p = set()

folding = False
for line in lines:
    if line == "":
        folding = True
        continue

    if not folding:
        x, y = (int(i) for i in line.split(','))
        p.add((x,y))

    if folding:
        dir, num = line.split(' ')[2].split('=')
        num = int(num)

        p = set((min(x, 2*num-x) if dir == 'x' else x,
                 min(y, 2*num-y) if dir == 'y' else y) for x, y in p)

        if num == 655:
            print("Part 1:", len(p))


print("Part 2:")
for y in range(6):
    line = ''
    for x in range(40):
        line += ' █'[(x, y) in p]
    print(line)
