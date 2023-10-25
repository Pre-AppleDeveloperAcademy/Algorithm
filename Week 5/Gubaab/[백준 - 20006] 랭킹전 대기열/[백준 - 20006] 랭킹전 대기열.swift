let n = readLine()!.split(separator: " ").map({Int($0)!})
let m = n[1]
var matching: [[String:Int]] = [] //매칭된 사람들의 정보를 담는 배열 (딕셔너리 형태로 저장)
var standard: [String] = [] // matching의 기준 레벨 정보

for _ in 0..<n[0]{
    let player = readLine()!.split(separator: " ")
    let level: Int = Int(player[0])!
    let name: String = String(player[1]) //한줄마다 플레이어 정보를 입력받고 level과 name으로 저장
    
    if matching.count == 0{ //현재 방이 없다면 새로운 방 파기
        matching.append([name:level])
        standard.append(name)
    }else{
        var joined = false // 현재 생성된 방에 들어갔는지 확인
        
    loop: for i in 0..<standard.count{ // 생성된 매칭방 탐색
            let roomLevel = matching[i][standard[i]]!
            if roomLevel-10<=level && roomLevel+10>=level{ // 레벨 범위 확인
            if matching[i].count<m{ // 인원수가 남는다면 넣어준다
                matching[i][name] = level
                joined = true
                break loop
            }
        }
      }
        if joined == false{ // 맞는 방이 없다면 새로 방 파준다
            matching.append([name:level])
            standard.append(name)
        }
    }
    
}

for room in matching{ // matching 배열을 돌면서 출력
    if room.count == m{
        print("Started!")
    }else{
        print("Waiting!")
    }
    let room = room.sorted(by: {$0.key < $1.key})
    for (key, value) in room{
        print(value, key)
    }

}



