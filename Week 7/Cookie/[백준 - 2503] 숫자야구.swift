//
//  숫자야구.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/9/23.
//

import Foundation

func 숫자야구() {

    /// 몇번 질문했는지
    let N = Int(readLine()!)!

    /// 가능한 경우의 수의 개수
    var cases: [Int: Int] = [:]

    /// 값 입력 받기
    for _ in 1...N {
        let input = readLine()!.components(separatedBy: " ")
        let targetNumber = input[0].map{ Int(String($0))! }
        let strike = Int(input[1])!
        let ball = Int(input[2])!
        
        /// 타겟넘버, 스트라이크, 볼 조합으로 나올 수 있는 모든 경우의 수 계산
        playGame(targetNumber, S: strike, B: ball)
    }

    /// 가능한 경우의 수 출력
    var answer: [Int: Int] = [:]
    var count = N
    while answer.isEmpty {
        answer = cases.filter { $0.value == count }
        count -= 1
        
        /// 마지막까지 값이 없다면 그대로 반복문 종료
        if count == -1 {
            break
        }
    }

    // print(answer)
    print(answer.count)

    func playGame(_ targetNumber: [Int], S: Int, B: Int) {
        
        for numberCase in 123...987 {
            
            /// 중복된 숫자 혹은 0이 포함되어 있다면 다음 반복 시퀀스로
            if Set(String(numberCase)).count == 2 || String(numberCase).contains("0") { continue }
            
            /// 조건에 맞는지 검사
            let numbers = String(numberCase).map { Int(String($0))! }
            var strikeCount = 0
            var ballCount = 0
            
            /// 숫자 야구 카운트 테스트
            for (i, number) in numbers.enumerated() {
                
                /// Strike 확인
                if targetNumber[i] == number {
                    strikeCount += 1
                }
                
                /// Ball 확인
                else if targetNumber.contains(number) {
                    ballCount += 1
                }
            }
            
            /// 최종 스코어를 기반으로 답변 받은 스코어와 같으면 +1
            if (S, B) == (strikeCount, ballCount) {
                // print("\(numberCase) 추가")
                
                if let value = cases[numberCase] {
                    cases.updateValue(value+1, forKey: numberCase)
                } else {
                    cases.updateValue(1, forKey: numberCase)
                }
            }
        }
        
        /// 원래 배열에서 두개 이상 있는 값 제외 모두 삭제
        // print(cases)
    }
}
