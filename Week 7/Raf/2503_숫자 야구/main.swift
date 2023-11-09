//
//  main.swift
//  2503_숫자 야구
//
//  Created by 예강이다 on 2023/11/07.
//

import Foundation

let N = Int(readLine()!)!
var scoreBoard = Array(repeating: true, count: 1000)
var result = 0

for i in 123...999 {
    let tmp = String(i)
    let st = tmp.startIndex
    let first = tmp[tmp.index(st, offsetBy: 0)]
    let second = tmp[tmp.index(st, offsetBy: 1)]
    let third = tmp[tmp.index(st, offsetBy: 2)]
    
    if first == second || first == third || second == third {
        scoreBoard[i] = false
    } else if first == "0" || second == "0" || third == "0" {
        scoreBoard[i] = false
    }
}

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (num , S, B) = (input[0], input[1], input[2])
    let callNumTmp = String(num)
    let callNumStart = callNumTmp.startIndex
 
    for i in 123...999 {
        var strike = 0
        var ball = 0
        
        if scoreBoard[i] {
            let tmp = String(i)
            let st = tmp.startIndex
            
            for x in 0..<3 {
                for y in 0..<3 {
                    if x == y && callNumTmp[callNumTmp.index(callNumStart, offsetBy: x)] == tmp[tmp.index(st, offsetBy: y)] {
                        strike += 1
                    }
                    if x != y && callNumTmp[callNumTmp.index(callNumStart, offsetBy: x)] == tmp[tmp.index(st, offsetBy: y)] {
                        ball += 1
                    }
                }
            }
            
            if S != strike || B != ball {
                scoreBoard[i] = false
            }
        }
    }
}

for i in 123...999 {
    if scoreBoard[i] {
        result += 1
    }
}

print(result)
