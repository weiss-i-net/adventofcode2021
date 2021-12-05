#!/bin/bash
wd=$(pwd)
day=$((10#${wd: -2}))
sess='53616c7465645f5f710d150b5e5e3a36833d628c0367d539c7a2fd3efbc8ee514154865ccf483c7800ceb2662da68aac'
curl https://adventofcode.com/2021/day/$day/input --cookie "session=$sess" > input
