import sys

# main
a = [[0] * 501 for _ in range(501)]
dp = [[0] * 501 for _ in range(501)]
n = int(sys.stdin.readline())

for i in range(n):
    a[i] = list(map(int, sys.stdin.readline().split()))

dp[0][0] = a[0][0]

for i in range(n):
    for j in range(i + 1):
        dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1]) + a[i][j]

ans = 0
for i in range(n):
    ans = max(ans, dp[n - 1][i])

print(ans)