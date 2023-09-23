//
//  main.swift
//  10799_쇠막대기
//
//  Created by 예강이다 on 2023/09/15.
//

import Foundation

let line = readLine()!.map{String($0)}
var stack = 0
var count = 0

for i in 0..<line.count {
    if line[i] == "(" {
        stack += 1
    } else { // line[i] == ")"
        stack -= 1
        
        if line[i-1] == "(" {
            count += stack
        } else { // line[i-1] == ")"
            count += 1
        }
    }
}

print(count)
