#!/usr/bin/python3
import sys, os
if not os.path.exists("input"):
    os.system("cp ../getinput.sh . && ./getinput.sh")
with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = file.read().splitlines()
    data = [ int(i) for i in lines[0].split(",") ]

in_fish_ages = [ data.count(i) for i in range(9) ]

for time in (80, 256):
    fish_ages = in_fish_ages.copy()
    for _ in range(time):
        rdy_fish = fish_ages.pop(0)
        fish_ages[6] += rdy_fish
        fish_ages.append(rdy_fish)
    print(sum(fish_ages))

