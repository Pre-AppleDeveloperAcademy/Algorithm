from collections import deque
import sys

# global var
n = 0
g = []
dx = [-1, 0, 1, 0]
dy = [0, -1, 0, 1]
ans = []
visited = set()

def bfs(y, x):
    global visited, n, ans
    cnt = 1
    q = deque()
    q.append((y, x))
    visited.add((y, x))

    while q:
        cy, cx = q.popleft()

        for i in range(4):
            ny = cy + dy[i]
            nx = cx + dx[i]

            if (0 <= ny < n) and (0 <= nx < n):
                if (ny, nx) not in visited and g[ny][nx] == '1':
                    q.append((ny, nx))
                    visited.add((ny, nx))
                    cnt += 1
    ans.append(cnt)

# main
n = int(sys.stdin.readline())
g = [list(sys.stdin.readline()) for _ in range(n)]

for i in range(n):
    for j in range(n):
        if g[i][j] == '1':
            if (i, j) not in visited:
                bfs(i, j)

print(len(ans))
ans.sort()
for i in ans:
    print(i)