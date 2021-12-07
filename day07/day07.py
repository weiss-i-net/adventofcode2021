#!/usr/bin/python3
import sys, os
if not os.path.exists("input"):
    os.system("cp ../getinput.sh . && ./getinput.sh")
with open("input" if len(sys.argv) == 1 else sys.argv[1]) as file:
    lines = file.read().splitlines()

nums = list(map(int, lines[0].split(',')))
nums.sort()

median = nums[len(nums)//2]
mean = sum(nums)//len(nums)

print("part 1:", sum(abs(i - median) for i in nums))
print("part 2:", sum(abs(i - mean)*(abs(i - mean) + 1)//2 for i in nums))
