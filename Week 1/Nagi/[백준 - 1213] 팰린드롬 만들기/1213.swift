//
//  main.swift
//  algorithm
//
//  Created by 이윤학 on 2023/09/03.
//
let inputs = Array(readLine()!).map{String($0)}

var isPossible = true
var middle = "", leftSide = ""
var characterCounts: [String: Int] = [:]

for input in inputs {
    characterCounts[input, default: 0] += 1
}

for character in characterCounts.keys.sorted() {
    let count = characterCounts[character]!
    
    if count % 2 == 0 {
        leftSide += String(repeating: character, count: count/2)
    } else {
        if middle == "" {
            middle = character
            leftSide += String(repeating: character, count: count/2)
        } else {
            isPossible = false
            break
        }
    }
}

if isPossible {
    print(leftSide + middle + String(leftSide.reversed()))
} else {
    print("I'm Sorry Hansoo")
}
