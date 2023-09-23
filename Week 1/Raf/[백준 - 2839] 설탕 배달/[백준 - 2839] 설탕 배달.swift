//
//  main.swift
//  2839_설탕 배달
//
//  Created by 예강이다 on 2023/05/20.
//

import Foundation

var sugar = Int(readLine()!)!
var bag = 0

while (sugar%5 != 0 && sugar >= 0) {
    sugar -= 3
    bag += 1
}
print(sugar<0 ? -1 : bag+sugar/5)

// 내 풀이
//while(sugar >= 3) {
//    if sugar % 5 == 0 {
//        sugar -= 5
//        bag += 1
//    } else {
//        sugar -= 3
//        bag += 1
//    }
//}
//
//print(sugar == 0 ? bag : -1)


