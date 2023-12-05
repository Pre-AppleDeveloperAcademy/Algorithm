//1. {A,B,C,D,E,F} 0~1개
//2. A 1이상
//3. F 1이상
//4. C 1이상
//5. {A,B,C,D,E,F} 0~1개

for _ in 0..<Int(readLine()!)!{
    let line = readLine()!.map({$0})
    var pointer = 0
    var check = true
    while check == true && pointer < line.count { //규칙을 지키면서 line 끝까지 확인
        check = check_first(line, &pointer)
        for Alpha in "AFC" {
            check = check_Alpha(line, &pointer, target: Alpha)
        }
    }
    if check == true {
        print("Infected!")
    } else {
      print("Good")
    }
}

func check_first(_ line: [Character], _ pointer: inout Int) -> Bool {
    if ["A","B","C","D","F"].contains(line[pointer]) {
        if line[pointer] == "A" { // 맨 처음이 A라면 규칙 1,2 둘 다 통과
            return true
        }
        pointer += 1
        return true
    }
    return false
}

func check_Alpha(_ line: [Character], _ pointer: inout Int, target: Character) -> Bool {
    if pointer > line.count-1 || line[pointer] != target {
        return false
    }
    while pointer < line.count && line[pointer] == target {
        pointer += 1
    }
    return true
}

func check_last(_ line: [Character], _ pointer: inout Int) -> Bool {
    if ["A","B","C","D","F"].contains(line[pointer]){
        return true
    }
    return false
}
