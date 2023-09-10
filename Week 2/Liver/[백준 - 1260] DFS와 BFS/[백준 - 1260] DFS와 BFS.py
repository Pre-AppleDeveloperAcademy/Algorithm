from collections import deque

global graph
global visited

def initVar():
    for i in range(n + 1):
        visited[i] = False

def dfs(cur):
    if visited[cur]:
        return
    visited[cur] = True
    print(cur, end=" ")
    for i in range(len(graph[cur])):
        dfs(graph[cur][i])

def bfs(cur):
    queue = deque()
    queue.append(cur)
    visited[cur] = True

    while queue:
        cur = queue.popleft()
        print(cur, end=" ")
        for i in range(len(graph[cur])):
            if not visited[graph[cur][i]]:
                queue.append(graph[cur][i])
                visited[graph[cur][i]] = True

# main
n, m, v = map(int, input().split())

graph = [[] for i in range(n + 1)]
visited = [False for i in range(n + 1)]

for i in range(m):
    v1, v2 = map(int, input().split())
    graph[v1].append(v2)
    graph[v2].append(v1)

for i in range(len(graph)):
    graph[i].sort()

dfs(v)
initVar()
print()
bfs(v)
