from collections import deque

computers = []
visited = []
ans = 0

def solve(cur):
    global ans
    global visited
    global computers
    q = deque()
    q.append(cur)
    visited[cur] = True

    while q:
        cur = q.popleft()
        for i in computers[cur]:
            if not visited[i]:
                q.append(i)
                visited[i] = True
                ans += 1

# main
n = int(input())
m = int(input())

for i in range(n + 1):
    computers.append([])
    visited.append(False)

for i in range(m):
    a, b = map(int, input().split())
    computers[a].append(b)
    computers[b].append(a)

solve(1)
print(ans)