#!/usr/bin/python3
import sys, os
if not os.path.exists("input"):
    os.system("cp ../getinput.sh . && ./getinput.sh")
with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = file.read().splitlines()



for line in lines[0:]:

    if line == "":
        pass
    else:
        pass
