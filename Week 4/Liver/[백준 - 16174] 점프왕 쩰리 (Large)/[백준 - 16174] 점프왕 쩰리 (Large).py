from collections import deque
import sys

n = 0
visited = []

def bfs():
    global n, visited
    q = deque()
    q.append([0, 0])
    visited[0][0] = True

    while q:
        if visited[n-1][n-1]:
            print("HaruHaru")
            return
        cur = q.popleft()
        curY = cur[0]
        curX = cur[1]
        # print("curY:", curY, "\ncurX:", curX)
        jump = g[curY][curX]
        for i in range(2):
            if i == 0:
                nextY = curY + jump
                nextX = curX
            else:
                nextY = curY
                nextX = curX + jump

            # print("nextY:", nextY, "\nnextX:", nextX)
            if (0 <= nextY and nextY < n) and (0 <= nextX and nextX < n):
                if not visited[nextY][nextX]:
                    q.append([nextY, nextX])
                    visited[nextY][nextX] = True
    print("Hing")
    return

n = int(input())
g = []
visited = [[False for _ in range(n)] for _ in range(n)]

for i in range(n):
    g.append(list(map(int, sys.stdin.readline().split(" "))))

bfs()