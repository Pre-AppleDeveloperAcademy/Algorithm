
for _ in 0..<Int(readLine()!)!{
    let num:[Int] = readLine()!.split(separator: " ").map({Int($0)!})
    farming(num[0],num[1],num[2])
}

func farming(_ m:Int, _ n:Int, _ k:Int){
    var farm = Array(repeating: Array(repeating: 0, count: n), count: m)
    var checked = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for _ in 0..<k{
        let l = readLine()!.split(separator: " ").map({Int($0)!})
        farm[l[0]][l[1]] = 1
    }
    
    var answer = 0
    var queue: [[Int]]=[]
    
    for x in 0..<m{
        for y in 0..<n{
            if farm[x][y] == 1{
                if checked[x][y] != 1{
                    queue.append([x,y])
                    bfs()
                    answer += 1
                }
            }
        }
    }
    
    func bfs(){
        let now = queue.removeFirst()
        let x = now[0], y = now[1]
        
        if checked[x][y] != 0 || farm[x][y] != 1{
            return
        }
        checked[x][y] = 1
        
        let moveX = [-1,0,1,0]
        let moveY = [0,1,0,-1]
        
        for i in 0..<4{
            let nextX = x + moveX[i]
            let nextY = y + moveY[i]
            if nextX<0 || nextX>m-1 || nextY<0 || nextY>n-1{
                continue
            }else{
                queue.append([nextX,nextY])
                bfs()
            }
        }
    }
    print(answer)
}

