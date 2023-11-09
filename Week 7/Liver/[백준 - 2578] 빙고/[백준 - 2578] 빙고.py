import sys

# global variable
bingoBoard = []
checkBoard = []
result = 0

def markBingo(num):
    global bingoBoard, checkBoard
    coordinate = [(i, j) for i in range(5) for j in range(5) if bingoBoard[i][j] == num]

    checkBoard[coordinate[0][0]][coordinate[0][1]] = True

def checkBingo():
    global bingoBoard, checkBoard
    count = 0

    diagonalCheck1 = True
    diagonalCheck2 = True
    for i in range(5):
        if not checkBoard[i][i]:
            diagonalCheck1 = False
        if not checkBoard[i][4 - i]:
            diagonalCheck2 = False

    if diagonalCheck1:
        count += 1
    if diagonalCheck2:
        count += 1

    for i in range(5):
        colCount = 0
        rowCount = 0
        for j in range(5):
            if checkBoard[i][j]:
                colCount += 1
            else:
                colCount = 0

            if checkBoard[j][i]:
                rowCount += 1
            else:
                rowCount = 0

        if colCount == 5:
            count += 1
        if rowCount == 5:
            count += 1


    if count >= 3:
        return True
    else:
        return False

# main
bingoBoard = [list(map(int, sys.stdin.readline().split())) for _ in range(5)]
checkBoard = [[False for _ in range(5)] for _ in range(5)]

for _ in range(5):

    row = list(map(int, sys.stdin.readline().split()))
    for num in row:
        markBingo(num)

        result += 1

        if checkBingo():
            print(result)
            exit()
