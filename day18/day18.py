#!/usr/bin/python3
import os, sys, heapq, itertools, functools
from collections import defaultdict, Counter, deque

with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = file.read().splitlines()

def explode(num):
    depth = 0
    max_depth = 0

    for i, char in enumerate(num):
        if char == '[':
            depth += 1
        if char == ']':
            depth -= 1
        if depth > max_depth:
            max_depth = depth
            deepest_i = i

    if max_depth <= 4:
        return None

    i = deepest_i

    j = i - 1
    while j >= 0:
        if isinstance(num[j], int):
            num[j] += num[i+1]
            break
        j -= 1

    j = i + 4
    while j < len(num):
        if isinstance(num[j], int):
            num[j] += num[i+2]
            break
        j += 1

    return num[:i] + [ 0 ] + num[i+4:]

def split(num):
    for i, char in enumerate(num):
        if isinstance(char, int) and char > 9:
            return num[:i] + [ '[', num[i]//2, num[i]//2 + num[i]%2, ']' ] + num[i+1:]
    return None

def add(a, b):
    res = [ '[' ] + a + b + [ ']' ]

    while True:
        ex = explode(res)
        sp = split(res)
        if ex:
            res = ex
        elif sp:
            res = sp
        else:
            break

    return res

def closing_par(string):
    count = 0
    for i, char in enumerate(string):
        if char == '[':
            count += 1
        if char == ']':
            count -= 1
        if count == 0:
            return i

def mag(num):
    if num[0] == '[':
        num = num[1:-1]
        i = closing_par(num) + 1
        return 3*mag(num[:i]) + 2*mag(num[i:])
    return num[0]

nums = [ [ int(i) if i.isdigit() else i for i in line if i != ',' ] for line in lines ]

print("Part 1:", mag(functools.reduce(add, nums)))
print("Part 2:", max(mag(add(a,b)) for a, b in itertools.permutations(nums, 2)))
