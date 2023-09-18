from collections import deque
import copy
import sys

# global visited
laboratoryMap = []
n = 0
m = 0
ans = 0
# visited = []
dx = [-1, 0, 1, 0]
dy = [0, -1, 0, 1]

# def varClear():
#     global visited, n, m
#     visited = [[False for j in range (m)] for i in range(n)]

def bfs():
    global visited, n, m, ans
    cnt = 0
    queue = deque()
    testMap = copy.deepcopy(laboratoryMap)

    for i in range(n):
        for j in range(m):
            if testMap[i][j] == 2:
                queue.append([i, j])
                # visited[i][j] = True

    while queue:
        cur = queue.popleft()
        # visited[cur[0]][cur[1]] = True

        for i in range(4):
            next = [cur[0] + dy[i],cur[1] + dx[i]]

            if (0 <= next[0] < n) and (0 <= next[1] < m):
                # if not visited[next[0]][next[1]]:
                if testMap[next[0]][next[1]] == 0:
                    testMap[next[0]][next[1]] = 2
                    queue.append([next[0], next[1]])
                    # visited[next[0]][next[1]] = True

    cnt = sum(row.count(0) for row in testMap)
    ans = max(cnt, ans)

def makeWall(cnt):
    global n, m, laboratoryMap

    if cnt == 3:
        bfs()
        # varClear()
        return

    for i in range(n):
        for j in range(m):
            if laboratoryMap[i][j] == 0:
                laboratoryMap[i][j] = 1
                makeWall(cnt + 1)
                laboratoryMap[i][j] = 0


# main
n ,m = map(int, sys.stdin.readline().split())
laboratoryMap = []
virus = []
visited = [[False for j in range(m)] for i in range(n)]

for i in range(n):
    laboratoryMap.append(list(map(int, sys.stdin.readline().split())))

makeWall(0)

print(ans)