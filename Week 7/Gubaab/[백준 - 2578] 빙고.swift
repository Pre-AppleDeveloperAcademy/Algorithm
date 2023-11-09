//5번 부를때부터 빙고 연산
//빙고 종류 12개

//[x축 5개],[y축 5개],[대각선 2개]
var board: [[Int]] = []
for _ in 0..<5{
    board.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

var bingo = [[5,5,5,5,5],[5,5,5,5,5],[5,5]] //0이 되면 빙고
var count = 0
var done = 0

for _ in 0..<5{
    let line = readLine()!.split(separator: " ").map({Int($0)!})
    for num in line{
        if done >= 3{
            break
        }
        find(num:num)
    }
}

func find(num: Int){
    count += 1
    for x in 0..<5{ //board에서 해당 숫자 찾기
        for y in 0..<5{
            if board[x][y] == num{ //찾았다면 해당 숫자 위치가 포함되는 배열bingo의 수 -1
                bingo[0][x] -= 1
                bingo[1][y] -= 1
                if x == y{
                    bingo[2][0] -= 1
                    if x == 2 && y == 2{
                        bingo[2][1] -= 1
                    }
                }
                if (x == 0 && y == 4) || (x == 1 && y == 3) || (x == 3 && y == 1) || (x == 4 && y == 0){
                    bingo[2][1] -= 1
                }
            }
        }
    }
    if count>=5{
        done = 0
        for cate in bingo{
            for i in cate{
                if i == 0{
                    done += 1
                }
                if done>=3{
                    return print(count)
                }
            }
        }
    }
}

