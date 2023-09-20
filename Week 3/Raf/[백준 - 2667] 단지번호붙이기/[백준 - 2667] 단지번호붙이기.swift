//
//  main.swift
//  2667_단지번호붙이기
//
//  Created by 예강이다 on 2023/09/10.
//

import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.map{Int(String($0))!})
}

func dfs(start: (x: Int, y: Int)) -> Int {
    var stack = [start]
    map[start.x][start.y] = 0
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var out = 1
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        
        for i in 0..<4 {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            
            if nextX < 0 || nextX >= N || nextY < 0 || nextY >= N {
                continue
            } else {
                if map[nextX][nextY] == 1 {
                    map[nextX][nextY] = 0
                    stack.append((nextX, nextY))
                    out += 1
                }
            }
        }
    }
    return out
}

var result = [Int]()
var complexNumber = 0

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            complexNumber += 1
            result.append(dfs(start: (i, j)))
        }
    }
}

print(complexNumber)
print(result.sorted().map{ String($0) }.joined(separator: "\n"))
