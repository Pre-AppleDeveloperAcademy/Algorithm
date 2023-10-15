from collections import deque
import sys

r = 0
c = 0
graph = []
fireSimulation = []
jihunSimulation = []
visited = []
jihun = []
fires = []
dx = [-1, 0, 1, 0]
dy = [0, -1, 0, 1]

result = 9999

def fireBfs():
    global r, c, graph, fireSimulation, visited, fires
    q = deque()
    for i in range(len(fires)):
        q.append([fires[i][0], fires[i][1], 1])
        fireSimulation[fires[i][0]][fires[i][1]] = 1
        visited[fires[i][0]][fires[i][1]] = True

    while q:
        cur = q.popleft()
        curY = cur[0]
        curX = cur[1]
        curCnt = cur[2]
        for i in range(4):
            nextY = curY + dy[i]
            nextX = curX + dx[i]
            if (0 <= nextY and nextY < r) and (0 <= nextX and nextX < c):
                if not visited[nextY][nextX] and graph[nextY][nextX] != '#':
                    fireSimulation[nextY][nextX] = curCnt + 1
                    q.append([nextY, nextX, curCnt + 1])
                    visited[nextY][nextX] = True

def jihunBfs():
    global r, c, graph, fireSimulation, jihunSimulation, visited, fires
    q = deque()
    q.append([jihun[0], jihun[1], 1])
    jihunSimulation[jihun[0]][jihun[1]] = 1
    visited[jihun[0]][jihun[1]] = True

    while q:
        cur = q.popleft()
        curY = cur[0]
        curX = cur[1]
        curCnt = cur[2]
        for i in range(4):
            nextY = curY + dy[i]
            nextX = curX + dx[i]
            if (0 <= nextY and nextY < r) and (0 <= nextX and nextX < c):
                # fireSimulation[nextY][nextX] > curCnt + 1 이 부분이 문제였다...
                # 지훈이가 먼저 움직이지만, 나중에 불이 따라왔을 때도 지훈이가 불에 피해를 입지 않아야하기 때문에
                # curCnt로 비교하는 것이 아니라 지훈이가 움직이고 나서 불이 움직였을 때를 고려한 값(curCnt + 1)으로 비교해야 한다.
                if not visited[nextY][nextX] and graph[nextY][nextX] == '.' and fireSimulation[nextY][nextX] > curCnt + 1:
                    jihunSimulation[nextY][nextX] = curCnt + 1
                    q.append([nextY, nextX, curCnt + 1])
                    visited[nextY][nextX] = True



# main
r, c = map(int, sys.stdin.readline().split(" "))
visited = [[False for _ in range(c)] for _ in range(r)]
fireSimulation = [[9999 for _ in range(c)] for _ in range(r)]
jihunSimulation = [[9999 for _ in range(c)] for _ in range(r)]
for _ in range(r):
    graph.append(sys.stdin.readline())

for i in range(r):
    for j in range(c):
        if graph[i][j] == 'J':
            jihun.append(i)
            jihun.append(j)
        if graph[i][j] == 'F':
            fires.append([i, j])

fireBfs()
visited = [[False for _ in range(c)] for _ in range(r)]
jihunBfs()

for i in range(r):
    if graph[i][0] != '#' and jihunSimulation[i][0] != -1:
        result = min(jihunSimulation[i][0], result)
    if graph[i][c - 1] != '#' and jihunSimulation[i][c - 1] != -1:
        result = min(jihunSimulation[i][c - 1], result)
for i in range(c):
    if graph[0][i] != '#' and jihunSimulation[0][i] != -1:
        result = min(jihunSimulation[0][i], result)
    if graph[r - 1][i] != '#' and jihunSimulation[r - 1][i] != -1:
        result = min(jihunSimulation[r - 1][i], result)

if result == 9999:
    print("IMPOSSIBLE")
else:
    print(result)