# 풀이 1
# n = int(input())
# dp = []
# dp = [5001, 5001, 5001, 1, 5001, 1]
#
# for i in range(6, n + 1):
#     dp.append(min(dp[i - 3], dp[i - 5]) + 1)
#
# if dp[n] < 5000:
#     print(dp[n])
# else:
#     print(-1)

# ------------------------------
# 풀이 2
n = int(input())
cnt = 0

while True:
    if n % 5 != 0 and n >= 3:
        n -= 3
        cnt += 1
    elif n % 5 == 0:
        cnt += n // 5
        n /= 5
        break
    else:
        cnt = -1
        break
print(cnt)