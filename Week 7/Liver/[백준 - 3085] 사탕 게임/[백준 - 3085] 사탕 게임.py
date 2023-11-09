import sys

# global variable
n = 0
arr = []
result = 0


def check():
    global n, arr
    ret = 0
    for i in range(n):
        colTemp = 1
        rowTemp = 1
        for j in range(n - 1):
            # 옆으로 같은지(열)
            if arr[i][j] == arr[i][j + 1]:
                colTemp += 1
            else:
                colTemp = 1

            # 위 아래로 같은지 (행)
            if arr[j][i] == arr[j + 1][i]:
                rowTemp += 1
            else:
                rowTemp = 1
            ret = max(colTemp, rowTemp, ret)
    return ret

#main

n = int(sys.stdin.readline())
arr = [list(sys.stdin.readline().strip()) for _ in range(n)]

for i in range(n):
    for j in range(n):
        # 열의 마지막일 때는 오른쪽 비교 X
        if j < n - 1:
            arr[i][j], arr[i][j + 1] = arr[i][j + 1], arr[i][j]
            result = max(result, check())
            arr[i][j], arr[i][j + 1] = arr[i][j + 1], arr[i][j]

        # 행의 마지막일 때는 아래쪽 비교 X
        if i < n - 1:
            arr[i][j], arr[i + 1][j] = arr[i + 1][j], arr[i][j]
            result = max(result, check())
            arr[i][j], arr[i + 1][j] = arr[i + 1][j], arr[i][j]

print(result)
