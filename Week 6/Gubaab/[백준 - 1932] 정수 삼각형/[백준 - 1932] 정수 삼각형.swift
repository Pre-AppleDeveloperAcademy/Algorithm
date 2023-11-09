var triangle:[[Int]] = []
var fixed:[[Bool]] = []
for _ in 0..<Int(readLine()!)!{
    let line = readLine()!.split(separator: " ").map({Int($0)!})
    triangle.append(line)
    fixed.append(Array(repeating: false, count: line.count))
}



func sum(i: Int, floor: Int)-> Int {
    if fixed[floor][i] == true{
        return triangle[floor][i]
    }
    if floor == 0{
        fixed[0][0] = true
        return triangle[0][0]
    }
    if i == 0 {
        triangle[floor][i] += sum(i: i, floor: floor-1)
        fixed[floor][i] = true
        return triangle[floor][i]
    }
    if i == triangle[floor].count-1 {
        triangle[floor][i] += sum(i: i-1, floor: floor-1)
        fixed[floor][i] = true
        return triangle[floor][i]
    }
    triangle[floor][i] += max(sum(i: i, floor: floor-1), sum(i: i-1, floor: floor-1))
    fixed[floor][i] = true
    return triangle[floor][i]
}


for i in 0..<triangle.reversed()[0].count{
    sum(i: i, floor: triangle.count-1)
}

print(triangle.reversed()[0].max()!)

