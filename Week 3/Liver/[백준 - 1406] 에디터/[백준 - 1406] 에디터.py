from collections import deque
import sys

# global var
n = 0
leftStack = deque()
rightStack = deque()

# main
leftStack = deque(list(sys.stdin.readline().rstrip()))
n = int(sys.stdin.readline())

for i in range(n):
    command = list(sys.stdin.readline().rstrip().split())
    if command[0] == 'L':
        if leftStack:
            rightStack.appendleft(leftStack.pop())
    elif command[0] == 'D':
        if rightStack:
            leftStack.append(rightStack.popleft())
    elif command[0] == 'B':
        if leftStack:
            leftStack.pop()
    elif command[0] == 'P':
        leftStack.append(command[1])

for chr in leftStack:
    print(chr, end='')

for chr in rightStack:
    print(chr, end='')