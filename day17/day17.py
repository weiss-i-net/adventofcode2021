#!/usr/bin/python3

# Input: x = 14..50, y = -267..-225
# => max v_y = 266
# => Part 1: 35511

# Search space: v_x =   5..  50
#               v_y = 266..-267

count = 0

for vx in range(5, 51):
    for vy in range(266, -268, -1):
        x = y = 0
        dx, dy = vx, vy

        while x <= 50 and y >= -267:
            if x >= 14 and y <= -225:
                count += 1
                break

            x += dx
            y += dy

            dx = dx - 1 if dx > 0 else 0
            dy -= 1

print(count)
