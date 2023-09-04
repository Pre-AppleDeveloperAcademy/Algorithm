n, k = map(int, input().split())

numberList = [i for i in range(1, n + 1)]
josephusPermutation = []

index = 0
for i in range(len(numberList)):
    index = (index + k - 1) % len(numberList)
    josephusPermutation.append(str(numberList[index]))
    numberList.pop(index)

print('<', end="")
for i in range(len(josephusPermutation)):
    if i == len(josephusPermutation) - 1:
        print(josephusPermutation[i], end="")
    else:
        print(josephusPermutation[i], end=", ")
print('>')

# print("<",", ".join(josephusPermutation)[:],">", sep='')