//
//  main.swift
//  1138_한 줄로 서기
//
//  Created by 예강이다 on 2023/11/09.
//

import Foundation

let N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{ Int($0)! }
var arr = [(Int, Int)]()
var result = Array(repeating: 0, count: N)

for i in 1...N {
    arr.append((i, input[i-1]))
}

// to와 through 차이
// append, insert 차이
for i in stride(from: N-1, through: 0, by: -1) {
    result.insert(arr[i].0, at: arr[i].1)
}
result.removeAll(where: { $0 == 0 })
print(result.map{ String($0) }.joined(separator: " "))
