//
//  main.swift
//  2606_바이러스
//
//  Created by 예강이다 on 2023/09/08.
//

import Foundation

// 풀이 3
let computer = Int(readLine()!)!
let networkNum = Int(readLine()!)!

var graph: [Int: [Int]] = [:]
var visited = [Int]()

for num in 1...computer {
    graph.updateValue([], forKey: num)
}

for _ in 1...networkNum {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[input[0]]?.append(input[1])
    graph[input[1]]?.append(input[0])
}

func dfs(_ node: Int) {
    if visited.contains(node) {
        return
    }
    visited.append(node)
    
    for i in graph[node]! {
        dfs(i)
    }
}

dfs(1)

print(visited.count-1)

// 풀이1
//let computer = Int(readLine()!)!
//let networkNum = Int(readLine()!)!
//
//var network = [Int:[Int]]()
//
//for num in 1...computer {
//    network[num] = []
//}
//
//for _ in 0..<networkNum {
//    let temp = readLine()!.split(separator: " ").map{ Int($0)! }
//    let com1 = temp[0]
//    let com2 = temp[1]
//    network[com1]!.append(com2)
//    network[com2]!.append(com1)
//}
//
//var visited = [Int]()
//var stack = [1]
//
//while stack.count != 0 {
//    guard let temp = stack.popLast() else {
//        fatalError()
//    }
//    if !visited.contains(temp) {
//        visited.append(temp)
//        guard let temp2 = network[temp] else {
//            fatalError()
//        }
//        stack += temp2
//    }
//}
//
//print(visited.count - 1)


// 풀이2
//func solution() -> Int{
//
//    let comNum = Int(readLine()!)!
//    let networkNum = Int(readLine()!)!
//
//    var network = [Int:[Int]]()
//
//    for num in 1...comNum{
//        network[num] = []
//    }
//
//    for _ in 0..<networkNum{
//        let temp = readLine()!.split(separator: " ").map({Int($0)!})
//        network[temp[0]]?.append(temp[1])
//        network[temp[1]]?.append(temp[0])
//    }
//
//    var visited: [Int] = []
//    // 1번 컴퓨터와 연결된 컴퓨터를 찾아야 하기 때문에 시작점을 1로 정의한다.
//    var stack: [Int] = [1]
//
//    while stack.count != 0 {
//        guard let temp = stack.popLast() else { fatalError() }
//        if !visited.contains(temp){
//            visited.append(temp)
//            guard let temp2 = network[temp] else { fatalError() }
//            stack += temp2
//        }
//
//    }
//    // 1번 컴퓨터도 감염이 된 것으로 세기 때문에 1번 컴퓨터의 카운팅은 빼준다
//    return visited.count - 1
//}
//
//print(solution())
