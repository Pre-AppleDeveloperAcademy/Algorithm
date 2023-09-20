var left: [Character] = Array(readLine()!)
var right: [Character] = []

for _ in 0..<Int(readLine()!)!{
    let order = readLine()!.map({$0})
    switch order[0]{
    case "L":
        if !left.isEmpty{
            right.append(left.popLast()!)
        }
    case "D":
        if !right.isEmpty{
            left.append(right.popLast()!)
        }
    case "B":
        if !left.isEmpty{
            left.removeLast()
        }
    case "P":
        left.append(order[2])
    default:
        print(-1)
    }

}


print(String(left+right.reversed()))
