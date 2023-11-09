//
//  한줄로서기.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/8/23.
//

import Foundation

func 한줄로서기() {
    
    /// 1. 사람의 수 N명(10보다 작거나 같은 자연수)
    let N = Int(readLine()!)!

    /// 2. 키가 1인 사람부터 차례대로 자기보다 키가 큰 사람이 왼쪽에 몇 명이 있었는지
    let heights = readLine()!.components(separatedBy: " ").map { Int($0)! }

    /// 3. 최종 값을 담을 배열 생성
    var answers = Array(repeating: 0, count: N)

    /// 4. 앞에 몇개의 큰 수가 있는지 세기
    var count = 0

    /// 5. 키 정보가 담긴 배열로 반복문 실행
    for (index, height) in heights.enumerated() {
        
        for i in 0..<N {
            
            /// 5-1. count와 height값이 일치하고,
            if count == height {
                
                /// 5-2. 현재 담겨있는 값이 0이라면 최종값 업데이트 후 반복문 종료
                if answers[i] == 0 {
                    answers[i] = index + 1
                    count = 0
                    break
                }
                continue
            }
            
            /// 5-3. 만약 현재 값이 0이라면 count 1 증가 시킨 후 다음 시퀀스로
            if answers[i] == 0 {
                count += 1
                continue
            }
        }
    }

    /// 6. 최종 값 출력
    print(answers.map { String($0)}.joined(separator: " "))
}
