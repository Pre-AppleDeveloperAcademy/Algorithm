func solution()->Int{
    let n = readLine()!.split(separator: " ").map({Int($0)!})
    var maze :[[Int]] = Array(repeating: Array(repeating:0,count: n[1]), count: n[0])
    for i in 0..<(n[0]){
        maze[i] = readLine()!.map({Int(String($0))!})
    }
    var checked :[[Int]] = Array(repeating: Array(repeating:-1,count: n[1]), count: n[0])
    var distance:[[Int]] = Array(repeating: Array(repeating:0,count: n[1]), count: n[0])
    var queue:[[Int]]=[[0,0]]
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    while queue.count != 0{
        let now = queue.remove(at: 0)
        
        if checked[now[0]][now[1]] == -1{
            checked[now[0]][now[1]] = 1
            for i in 0..<dx.count{
                let nowdx = now[0] - dx[i]
                let nowdy = now[1] - dy[i]
                
                if nowdx<0 || nowdx > n[0]-1 || nowdy<0 || nowdy > n[1]-1{
                    continue
                } else{
                    if maze[nowdx][nowdy] == 1 && checked[nowdx][nowdy] == -1{
                        distance[nowdx][nowdy] = distance[now[0]][now[1]] + 1
                        queue.append([nowdx,nowdy])
                    }
                }
            }
            
        }
    }
   
    return(distance[n[0]-1][n[1]-1]+1)
}

print(solution())

