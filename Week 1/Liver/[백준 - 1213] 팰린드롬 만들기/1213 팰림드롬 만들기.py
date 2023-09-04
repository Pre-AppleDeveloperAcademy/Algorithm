from collections import deque
inputList = list(input())
resultList = list()
d = deque()
cnt = 0
tempAlphabet = ''

inputList.sort()

for i in range(ord('A'), ord('Z') + 1):
    if inputList.count(chr(i)) % 2 == 1:
        cnt += 1
        index = inputList.index(chr(i))
        tempAlphabet = inputList.pop(index)
        if cnt >= 2:
            print("I'm Sorry Hansoo", end="")
            quit()

for i in range(0, len(inputList), 2):
    resultList.append(inputList[i])
reverseList = resultList.copy()
reverseList.reverse()
resultList.append(tempAlphabet)
resultList += reverseList
print("".join(resultList), end="")
