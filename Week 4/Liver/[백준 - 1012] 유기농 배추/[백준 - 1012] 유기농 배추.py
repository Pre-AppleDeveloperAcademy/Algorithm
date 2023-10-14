import sys
from collections import deque

t = 0
n = 0
m = 0
k = 0
cnt = 0
graph = []
visited = []
nodes = []
dx = [-1, 0, 1, 0]
dy = [0, -1, 0, 1]

def bfs(y, x):
    global t, n, m, k, cnt, graph, visited, nodes, dx, dy
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
            if (0 <= nextY and nextY < n) and (0 <= nextX and nextX < m):
                if not visited[nextY][nextX] and graph[nextY][nextX] == 1:
                    q.append([nextY, nextX])
                    visited[nextY][nextX] = True

#main
t = int(sys.stdin.readline())

while(t != 0):
    t -= 1
    m, n, k = map(int, sys.stdin.readline().split(" "))

    graph = [[0 for _ in range(m)] for _ in range(n)]
    visited = [[False for _ in range(m)] for _ in range(n)]
    nodes = []
    cnt = 0

    for i in range(k):
        x, y = map(int, sys.stdin.readline().split(" "))
        graph[y][x] = 1
        nodes.append((y, x))

    for i in range(len(nodes)):
        if not visited[nodes[i][0]][nodes[i][1]]:
            bfs(nodes[i][0], nodes[i][1])
    print(cnt)