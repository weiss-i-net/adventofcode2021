#!/usr/bin/python3

import sys

filename = "input" if len(sys.argv) == 1 else sys.argv[1]
drawn_numbers = []
boards = []
winner = []

def parse_input():
    global boards, drawn_numbers
    with open(filename) as file:
        lines = file.readlines()

        drawn_numbers = [ int(i) for i in lines[0].split(",") ]

        for line in lines[1:]:
            line = line.strip()
            if line == "":
                boards.append([])
            else:
                boards[-1].append([ int(i) for i in line.split() ])

def strike_out(number):
    global boards
    for board in boards:
        for i in range(5):
            for j in range(5):
                if board[i][j] == number:
                    board[i][j] = None

def check_for_winners():
    global boards, winner
    for board in boards:
        for row in board:
            if all(i == None for i in row):
                winner = board
                return True
        for col in zip(*board):
            if all(i == None for i in col):
                winner = board
                return True

def get_sum(board):
    return sum( i for row in board for i in row if i != None )


parse_input()

for num in drawn_numbers:
    strike_out(num)
    if check_for_winners():
        winner_num = num
        break

print("Part 1:", get_sum(winner)*winner_num)

last_winner = boards[0]

for num in drawn_numbers:
    strike_out(num)
    while check_for_winners():
        try:
            boards.remove(last_winner)
        except ValueError:
            pass
        last_winner = winner
        last_winner_num = num

print("Part 2:", get_sum(last_winner)*last_winner_num)

