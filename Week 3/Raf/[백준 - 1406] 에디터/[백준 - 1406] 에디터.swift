//
//  main.swift
//  1406_에디터
//
//  Created by 예강이다 on 2023/07/31.
//

import Foundation

var str = readLine()!
let M = Int(readLine()!)!
var rightLetters = ""

for _ in 0..<M {
    let command = readLine()!
    
    switch command {
    case "L" :
        if !str.isEmpty {
            rightLetters.append(str.popLast()!)
        }
    case "D" :
        if !rightLetters.isEmpty {
            str.append(rightLetters.popLast()!)
        }
    case "B" :
        if !str.isEmpty {
            str.removeLast()
        }
    default:
        str.append(command.last!)
    }
}

print(String(str+rightLetters.reversed()))

/**
 시간 초과
 var str = Array(readLine()!)
 var cursor = str.count

 let M = Int(readLine()!)!
 for _ in 0..<M {
     let command = readLine()!.split(separator: " ")
     
     switch command[0] {
     case "L" :
         cursor = (cursor != 0) ? (cursor - 1) : cursor
     case "D" :
         cursor = (cursor != cursor) ? (cursor + 1) : cursor
     case "B" :
         if cursor != 0 {
             str.remove(at: cursor-1)
             cursor -= 1
         }
     case "P" :
         let char = command[1]
         str.insert(contentsOf: char, at: cursor)
         cursor += 1
     default:
         break
     }
 }

 print(String(str))
 */
