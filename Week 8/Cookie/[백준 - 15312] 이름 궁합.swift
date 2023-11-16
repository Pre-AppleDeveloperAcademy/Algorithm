//
//  이름궁합.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/11/23.
//

import Foundation

func 이름궁합() {
    
    /// 종민이의 이름과 그녀의 이름
    let A = readLine()!
    let B = readLine()!

    /// 획수 배열
    let strokes: [Character: Int] = [
        "A" : 3, "B" : 2, "C" : 1, "D" : 2, "E" : 3,
        "F" : 3, "G" : 2, "H" : 3, "I" : 3, "J" : 2,
        "K" : 2, "L" : 1, "M" : 2, "N" : 2, "O" : 1,
        "P" : 2, "Q" : 2, "R" : 2, "S" : 1, "T" : 2,
        "U" : 1, "V" : 1, "W" : 1, "X" : 2, "Y" : 2, "Z" : 1
    ]

    /// 최종값을 담을 배열
    var answer: [Int] = []

    /// 시작 문자 배열 생성
    for i in 0..<A.count {
        
        /// 문자 인덱스 생성
        let aIndex = A[String.Index(utf16Offset: i, in: A)]
        let bIndex = B[String.Index(utf16Offset: i, in: B)]
        
        /// 문자에 대응되는 획수
        guard let aStroke = strokes[aIndex],
              let bStroke = strokes[bIndex] else { break }
        
        /// 최종 계산 배열에 추가
        answer.append(aStroke)
        answer.append(bStroke)
    }

    /// 남은 배열의 개수가 2개 이상 일 때까지 반복문 실행
    while answer.count > 2 {
        
        /// 반복문을 돌리며 만들 새로운 배열
        var array: [Int] = []
        
        /// 숫자 차례대로 더하기
        for i in 0..<(answer.count - 1) {
            
            /// 숫자 더한 후 10으로 나눈 나머지 값 추가
            let number = answer[i] + answer[i + 1]
            array.append(number % 10)
        }
        
        /// 새로운 배열 원래 배열에 대입
        answer = array
    }

    /// 최종 값 출력
    print(answer.map { String($0)}.joined())
}
