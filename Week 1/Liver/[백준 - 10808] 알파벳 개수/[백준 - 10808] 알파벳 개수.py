inputString = input()

for alphabet in range(ord('a'), ord('z') + 1):
    print(inputString.count(chr(alphabet)), end=" ")
