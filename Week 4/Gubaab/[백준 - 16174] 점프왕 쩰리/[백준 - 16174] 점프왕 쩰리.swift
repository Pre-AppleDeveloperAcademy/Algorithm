let n = Int(readLine()!)!
var game: [[Int]] = []
var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n{
    game.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

var stack: [[Int]] = [[0,0]]
var result = "Hing"

func dfs(){
    let current = stack.removeLast() 
    let x = current[0], y = current[1]
    if game[x][y] == -1{
        result = "HaruHaru"
        return
    }
    if visited[x][y] != 0{
        return
    }
    visited[x][y] = 1 
    
    let r = game[x][y]
    
    let moveX = [0,r]
    let moveY = [r,0]
    
    for i in 0..<2{
        let nowX = current[0] + moveX[i]
        let nowY = current[1] + moveY[i]
        
        if nowX>n-1 || nowY>n-1{
            continue
        }else{
            stack.append([nowX,nowY])
            dfs()
        }
    
    }
    return
}

dfs()
print(result)
