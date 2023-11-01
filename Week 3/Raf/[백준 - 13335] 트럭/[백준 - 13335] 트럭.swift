//
//  main.swift
//  13335_트럭
//
//  Created by 예강이다 on 2023/09/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, w, L) = (input[0], input[1], input[2]) // n = 트럭 갯수, w = 다리 길이, L = 다리의 최대 하중
//let n = input[0], w = input[1], L = input[2]

var truck = readLine()!.split(separator: " ").map{ Int($0)! }
var brige = Array(repeating: 0, count: w)

var sum = 0
var time = 0

while true {
    let out = brige.removeFirst()
    sum -= out
    
    if !truck.isEmpty {
        if sum + truck[0] <= L {
            brige.append(truck[0])
            sum += truck[0]
            truck.removeFirst()
        } else {
            brige.append(0)
        }
    }
    time += 1
    
    if brige.isEmpty {
        break
    }
}

print(time)
