import sys

# main
arr = [0 for _ in range(1000001)]
cnt = 0
x = int(sys.stdin.readline())

arr[1] = 0
arr[2] = 1
arr[3] = 1

for i in range(4, x + 1):
    arr[i] = arr[i - 1] + 1
    if i % 2 == 0:
        arr[i] = min(arr[i], arr[i // 2] + 1)
    if i % 3 == 0:
        arr[i] = min(arr[i], arr[i // 3] + 1)

print(arr[x])