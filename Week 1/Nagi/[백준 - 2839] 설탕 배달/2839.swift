//
//  main.swift
//  algorithm
//
//  Created by 이윤학 on 2023/09/03.
//

var N = Int(readLine()!)!
var result = 0

while N > 0 {
    if N % 5 != 0 {
        result += 1
        N -= 3
    } else {
        result += N / 5
        N = 0
    }
}

result = N != 0 ? -1 : result

print(result)
