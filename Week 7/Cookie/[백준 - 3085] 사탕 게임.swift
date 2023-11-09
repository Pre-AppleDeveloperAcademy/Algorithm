//
//  사탕게임.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/9/23.
//

import Foundation

func 사탕게임() {
    
    /// 1. 보드의 크기 ( 3 <= N <= 50)
    let N = Int(readLine()!)!

    /// 2. 보드 내 캔디 2차원 배열
    var rowBoard: [[String]] = []
    var columnBoard: [[String]] = []

    /// 3. 먹을 수 있는 사탕의 최대 개수
    var answer = 1

    /// 4. 보드 내 캔디 채워넣기
    for _ in 1...N {
        let input = readLine()!.map { String($0) }
        rowBoard.append(input)
    }

    for i in 0..<rowBoard.count {
        var inputBoard: [String] = []
        for j in 0..<rowBoard.count {
            inputBoard.append(rowBoard[j][i])
        }
        columnBoard.append(inputBoard)
    }

    /// 5. 보드 하나씩 훑으면서 행 검사하기
    for (order, row) in rowBoard.enumerated() {
        for i in row.indices {
            
            /// 마지막 인덱스일 경우 반복문 종료
            if i == N-1 { break }
            
            /// 배열 행간 순서 변경
            rowBoard[order].swapAt(i, i+1)
            
            /// 최대 사탕 개수 체크
            let maxCandy = check(from: rowBoard)
            if maxCandy > answer {
                answer = maxCandy
            }
            
            /// 배열 원상 복구
            rowBoard[order].swapAt(i+1, i)
        }
    }

    /// 6. 보드 하나씩 훑으면서 열 검사하기
    for order in 0..<columnBoard.count {
        for i in 0..<columnBoard.count {
            
            /// 마지막 인덱스일 경우 반복문 종료
            if i == N-1 { break }
            
            /// 배열 열간 순서 변경
            columnBoard[order].swapAt(i, i+1)
            
            /// 최대 사탕 개수 체크
            let maxCandy = check(from: columnBoard)
            if maxCandy > answer {
                answer = maxCandy
            }
            
            /// 배열 원상 복구
            columnBoard[order].swapAt(i+1, i)
        }
    }


    print(answer)

    /// 6. 행/열 최대 먹을 수 있는 사탕 개수 계산 함수
    func check(from arrays: [[String]]) -> Int {
        
        var count = 1
        var counts: [Int] = []
        
        /// 행 체크
        for row in arrays {
            for i in row.indices {
                
                /// 해당 행의 마지막 인덱스 만났을 때 종료
                if i == arrays.count-1 {
                    counts.append(count)
                    count = 1
                    break
                }
                
                /// 연속되어있는 사탕이라면 count 1 증가
                if row[i] == row[i+1] {
                    count += 1
                }
                
                /// 연속되어있지 않는 사탕이라면 다음 count로 넘기기
                else {
                    counts.append(count)
                    count = 1
                }
            }
        }
        
        /// 열 체크
        for columnIndex in 0..<arrays.count {
            for i in 0..<arrays.count {
                
                /// 해당 열의 마지막 인덱스 만났을 때 종료
                if i == arrays.count-1 {
                    counts.append(count)
                    count = 1
                    break
                }
                
                /// 연속되어있는 사탕이라면 count 1 증가
                if arrays[i][columnIndex] == arrays[i+1][columnIndex] {
                    count += 1
                }
                
                /// 연속되어있지 않는 사탕이라면 다음 count로 넘기기
                else {
                    counts.append(count)
                    count = 1
                }
            }
        }
        
        /// 모든 행/열에서 구할 수 있는 최대 사탕 개수 반환
        if let maxCandy = counts.max() {
            return maxCandy
        }
        
        return 1
    }
}
