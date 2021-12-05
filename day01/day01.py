#!/usr/bin/python3
import sys, os
if not os.path.exists("input"):
    os.system("cp ../getinput.sh . && ./getinput.sh")
with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = [ int(i) for i in file.read().splitlines() ]


for i in (1, 3):
    print(sum([ x < y for (x, y) in zip(lines[:-i], lines[i:])]))

