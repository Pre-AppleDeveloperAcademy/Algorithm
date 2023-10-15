import sys
from collections import deque

n = 0
graph = []
visited = []
dy = [0, -1, 0, 1]
dx = [-1, 0, 1, 0]
cnt = 0
maxCnt = 0


def bfs(y, x, waterHeight):
    global n, graph, visited, dy, dx, cnt
    cnt += 1
    q = deque()
    q.append([y, x])
    visited[y][x] = True

    while q:
        cur = q.popleft()
        curY = cur[0]
        curX = cur[1]

        for i in range(4):
            nextY = curY + dy[i]
            nextX = curX + dx[i]

            if (0 <= nextY and nextY < n) and (0 <= nextX and nextX < n):
                if not visited[nextY][nextX] and graph[nextY][nextX] > waterHeight:
                    q.append([nextY, nextX])
                    visited[nextY][nextX] = True

# main
n = int(input())
visited = [[False for _ in range(n)] for _ in range(n)]
for _ in range(n):
    graph.append(list(map(int, sys.stdin.readline().split(" "))))

maxHeight = 0
for i in range(n):
    for j in range(n):
        maxHeight = max(graph[i][j], maxHeight)

# 아무 지역도 물에 잠기지 않을 수도 있기 때문에 물의 높이의 0 ~ maxHeight까지이다.
for waterHeight in range(0, maxHeight + 1):
    visited = [[False for _ in range(n)] for _ in range(n)]
    cnt = 0
    for y in range(n):
        for x in range(n):
            if not visited[y][x] and graph[y][x] > waterHeight:
                bfs(y, x, waterHeight)
    maxCnt = max(cnt, maxCnt)

print(maxCnt)