n = int(input())
dp = []
dp = [5001, 5001, 5001, 1, 5001, 1]

for i in range(6, n + 1):
    dp.append(min(dp[i - 3], dp[i - 5]) + 1)

if dp[n] < 5000:
    print(dp[n])
else:
    print(-1)