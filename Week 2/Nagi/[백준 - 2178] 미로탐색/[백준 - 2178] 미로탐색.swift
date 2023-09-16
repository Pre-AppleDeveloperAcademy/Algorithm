// ver 1  pointer, 큐 하나만.
let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])

var map: [[Int]] = []
for i in 0..<N {
    map.append( Array(readLine()!).map{Int(String($0))!} )
}

let wall = 0, road = 1
let dr = [1, -1, 0, 0], dc = [0, 0, 1, -1]

var queue: [(Int, Int)] = [(0, 0)]
var pointer = 0

Outer: while pointer < queue.count {
    let cur = queue[pointer]

    for i in 0..<4 {
        let nr = cur.0+dr[i]
        let nc = cur.1+dc[i]
        
        if nr>=N || nr<0 || nc>=M || nc<0 {
            continue
        } else if nr == N-1 && nc == M-1 {
            map[nr][nc] = map[cur.0][cur.1] + 1
            break Outer
        } else if map[nr][nc] == road {
            map[nr][nc] = map[cur.0][cur.1] + 1
            queue.append((nr, nc))
        }
    }
    pointer += 1
}

print(map[N-1][M-1])



// ver 2, bfs 한번 돌 때마다 큐 교체 (큐 크기가 너무 커지는 문제를 방지할 수 있다.)
let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])

var map: [[Int]] = []
for i in 0..<N {
    map.append( Array(readLine()!).map{Int(String($0))!} )
}

let wall = 0, road = 1
let dr = [1, -1, 0, 0], dc = [0, 0, 1, -1]

var queue: [(Int, Int)] = [(0, 0)]
var bfsEnd = false

while !bfsEnd {
    bfs()
    if queue.isEmpty || map[N-1][M-1] != road{
        bfsEnd = true
    }
}

func bfs() {
    var nextQueue: [(Int, Int)] = []
    for cur in queue {
        for i in 0..<4 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
 
            if nr>=N || nr<0 || nc>=M || nc<0 {
                continue
            } else if map[nr][nc] == road {
                map[nr][nc] = map[cur.0][cur.1] + 1
                nextQueue.append((nr, nc))
            }
        }
    }
    queue = nextQueue
}

print(map[N-1][M-1])
