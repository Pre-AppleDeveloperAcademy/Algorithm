let input = readLine()!.split(separator: " ").map({Int($0)!})
var n = input[0], m = input[1], blocks = input[2]

var max = 0
var min = 256

var land:[[Int]] = []
var answer:[Int:Int] = [:]

for _ in 0..<n{ //land에 높이 정보 저장
    let line = readLine()!.split(separator: " ").map({Int($0)!})
    max = max>line.max()! ? max : line.max()!
    min = min<line.min()! ? min : line.min()!
    land.append(line)
}

for h in min...max{
    var b = blocks //현재 블록 수
    var time = 0
    for x in 0..<n{ //land 배열 돌면서 h 높이까지 쌓거나 깎기
        for y in 0..<m{
            let gap = land[x][y]-h
            if gap > 0{
                time += 2*gap
                b += gap
            }else if gap < 0{
                time += -gap
                b -= -gap
            }
        }
    }
    if b>=0{ //블록이 모자라지 않다면 answer에 추가
        answer[h] = time
    }
}

if answer.count != 0{
    let result = answer.max{if $0.1 == $1.1{
        return $0.0 < $1.0
    }
        return $0.1 > $1.1}!
    print(result.value, result.key)
}else{
    print(0, land[0][0])
}




