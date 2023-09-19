func solution()-> Any{
    let computers = Int(readLine()!)!
    let l: Int = Int(readLine()!)!
    var lines = [Int:[Int]]()
    var checked = [Int]()
    for i in 1...computers{
        lines[i] = []
        checked.append(0)
    }
    for _ in 0..<l{
        let line = readLine()!.split(separator: " ").map({Int($0)!})
        lines[line[0]]?.append(line[1]) //왜 ?
        lines[line[1]]?.append(line[0])
    }
    
    side(key:1)
    func side(key:Int){
        checked[key-1] = 1
        if lines[key] != nil{
            for i in lines[key]!{ //왜 풀어줘야함?
                if checked[i-1] != 1{
                    side(key:i)
                }else{
                    continue
                }
            }
        }else{
            return
        }
    }
    
    let result = checked.reduce(0,+)
    
    return result-1
    
}


print(solution())

