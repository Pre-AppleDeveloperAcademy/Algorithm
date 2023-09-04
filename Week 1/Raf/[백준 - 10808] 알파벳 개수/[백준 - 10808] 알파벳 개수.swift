//
//  main.swift
//  10808_알파벳 개수
//
//  Created by 예강이다 on 2023/09/01.
//

import Foundation

let S = readLine()!
var alphabet = Array(repeating: 0, count: 26)

for char in S {
    alphabet[Int(char.asciiValue!)-97] += 1
}
print(alphabet.map{String($0)}.joined(separator: " "))
