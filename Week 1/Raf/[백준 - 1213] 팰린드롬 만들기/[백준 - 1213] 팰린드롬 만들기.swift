//
//  main.swift
//  1213_팰린드롬 만들기
//
//  Created by 예강이다 on 2023/09/03.
//

import Foundation

let input = readLine()!
var alphabet = Array(repeating: 0, count: 26)
var isPalindrome = true

for char in input {
    alphabet[Int(char.asciiValue!)-65] += 1
}

var front = ""
var back = ""
var mid = ""

for i in 0..<26 {
    if alphabet[i] % 2 != 0 {
        if mid == "" {
            mid += String(Character(UnicodeScalar(i+65)!))
        } else {
            isPalindrome = false
            break
        }
    }
    
    if alphabet[i] != 0 {
        for _ in 0..<alphabet[i]/2 {
            front += String(Character(UnicodeScalar(i+65)!))
            back += String(Character(UnicodeScalar(i+65)!))
        }
    }
}

front += mid
front += back.reversed()

print(isPalindrome ? front : "I'm Sorry Hansoo")
