from collections import deque
import sys

# global var
n = 0
w = 0
l = 0
before = deque()
onBridge = deque()
ans = 0

def solve():
    global n, w, l, ans, before, onBridge
    finished = 0
    weightSum = 0
    while finished != n:
        # 다리 위에 트럭이 있으면
        if onBridge:
            # 아직 트럭이 다리를 건너는 시간이 지나지 않았다면
            if onBridge[0][1] < 1:
                weightSum -= onBridge[0][0]
                finished += 1
                onBridge.popleft()

        # 아직 다리에 진입하지 못한 트럭이 있으면
        if before:
            # 다음 들어갈 트럭의 무게 + 다리 위의 트럭들의 무게가 다리의 최대 하중보다 작다면
            if weightSum + before[0] <= l:
                weightSum += before[0]
                onBridge.append([before.popleft(), w])

        for car in onBridge:
            car[1] -= 1

        ans += 1

# main
n, w, l = map(int, sys.stdin.readline().split())

before = deque(list(map(int, sys.stdin.readline().split())))

solve()

print(ans)