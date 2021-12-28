#!/usr/bin/python3
import itertools, heapq, sys, os
from collections import defaultdict, Counter, deque

if not os.path.exists("input"):
    os.system("cp ../getinput.sh . && ./getinput.sh")
with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = file.read().splitlines()

for line in lines[0:-0]:
    if not line:
        continue
