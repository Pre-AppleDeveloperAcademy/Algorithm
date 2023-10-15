let n = Int(readLine()!)!
var minimum = 100
var maximum = 1
var heights:Set<Int> = [0]

var greed: [[Int]] = []

for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map({Int($0)!})
    greed.append(line)
    for i in line{
        heights.insert(i)
    }
}

var visited = Array(repeating: Array(repeating: 0, count: n), count: n)

var result = Array(repeating: 0, count: heights.max()!)

var queue = [[Int]]()

for rain in heights.sorted(){
    visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    for x in 0..<n{
        for y in 0..<n{
            if visited[x][y] == 0 && greed[x][y]-rain>0{
                queue.append([x,y])
                bfs(rain:rain)
                result[rain] += 1
            }
        }
    }
}

func bfs(rain:Int){
    if queue.isEmpty == true{
        return
    }
    
    let now = queue.removeFirst()

    let x = now[0], y = now[1]
    
    if visited[x][y] != 0{
        return
    }
    visited[x][y] = 1
    
    if greed[x][y]-rain <= 0{
        return
    }
    let moveX = [1,0,-1,0]
    let moveY = [0,1,0,-1]

    for i in 0..<4{
        let nextX = x + moveX[i]
        let nextY = y + moveY[i]

        if nextX<0 || nextX>n-1 || nextY<0 || nextY>n-1{
            continue
        }else{
            queue.append([nextX,nextY])
            bfs(rain:rain)
        }
    }
}

print(result.max()!)
