//
//  main.swift
//  2178_미로 탐색
//
//  Created by 예강이다 on 2023/09/07.
//

import Foundation

// 상 하 좌 우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0], M = NM[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for _ in 0..<N {
    let input = readLine()!.map{ Int("\($0)")! }
//    let input = readLine()!.split(separator: "").map{ Int(String($0))! }
    map.append(input)
}

var queue = [[0,0]]
var nx = 0, ny = 0
visited[0][0] = true

while !queue.isEmpty {
    let x = queue[0][0]
    let y = queue[0][1]
    
    queue.removeFirst()

    for i in 0..<4 {
        nx = x + dx[i]
        ny = y + dy[i]
        
        if nx >= 0 && ny >= 0 && nx < N && ny < M && visited[nx][ny] == false {
            if map[nx][ny] == 1 {
                queue.append([nx, ny])
                map[nx][ny] = map[x][y] + 1
                visited[nx][ny] = true
            }
        }
    }
}
print(map[N-1][M-1])
