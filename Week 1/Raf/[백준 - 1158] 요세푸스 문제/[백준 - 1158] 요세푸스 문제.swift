//
//  main.swift
//  1158_요세푸스 문제
//
//  Created by 예강이다 on 2023/09/01.
//

import Foundation

let NK = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NK[0], K = NK[1]

var numbers = Array(1...N)
var result = [Int]()
var cnt = 0

while(!numbers.isEmpty) {
    cnt = (cnt + K-1) % numbers.count
    result.append(numbers[cnt])
    numbers.remove(at: cnt)
}

print("<\(result.map{String($0)}.joined(separator: ", "))>")

//index : <0, 1, 2, 3, 4, 5, 6>
//실제 배열 :<1, 2, 3, 4, 5, 6, 7>
// 결과 : <3, 6, 2, 7, 5, 1, 4>

//1차 <1, 2, 4, 5, 6, 7>
//2차 <1, 2, 4, 5, 7>
//3차 <1, 4, 5, 7>
//4차 <1, 4, 5>
//5차 <1, 4>
//6차 <4>
//7차 <>

//while(!numbers.isEmpty) {
//    result.append(numbers[cnt])
//    numbers.remove(at: cnt)
//
//    numbers.count가 0일 때 % 연산을 할 때 0이라 에러 발생
//    cnt = (cnt + K) % numbers.count
//}
