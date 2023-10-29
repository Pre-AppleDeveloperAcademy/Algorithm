from collections import deque
import sys

# global variables
n = 0
m = 0
b = 0
arr = []

def solved(height):
    global n, m, b, arr
    time = 0
    myBlock = b + sum(arr)
    needBlock = n * m * height
    if myBlock < needBlock:
        return int(1e9)

    addBlock = 0
    removeBlock = 0

    for i in arr:
        if i < height:
            addBlock += height - i
        elif i > height:
            removeBlock += i - height

    time = addBlock + removeBlock * 2

    return time

# main
n, m, b = map(int, sys.stdin.readline().split(" "))
for i in range(n):
    arr.extend(list(map(int, sys.stdin.readline().split())))

minHeight = min(arr)
maxHeight = max(arr)

resultTime = int(1e9)
resultHeight = 0
for i in range(0, maxHeight + 1):
    time = solved(i)
    if time <= resultTime:
        resultTime = time
        resultHeight = i

print(resultTime, resultHeight)
