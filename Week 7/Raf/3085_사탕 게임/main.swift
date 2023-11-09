//
//  main.swift
//  3085_사탕 게임
//
//  Created by 예강이다 on 2023/11/09.
//

import Foundation

// 두 문자를 교환하는 메서드
func swap (a: String, b: String) {
    let tmp = a
    _ = b
    _ = tmp
}

// 가로, 세로 비교하면서 먹을 수 있는 사탕의 최대 갯수를 찾는 메서드
func arrCheck() {
    // 가로로 체크
    for i in 0..<N {
        var cnt = 1
        
        for j in 0..<N-1 {
            // 이전 사탕과 동일한 경우 가로 기준 바로 앞칸을 계속 먹는다
            if board[i][j] == board[i][j+1] {
                cnt += 1
                // 아닐경우 다른 사탕이니 cnt 다시 1로 초기화
            } else {
                cnt = 1
            }
            // 먹을 수 있는 최대 개수의 사탕 저장
            maxCandy = max(maxCandy, cnt)
        }
    }
    
    // 세로로 체크
    for i in 0..<N {
        var cnt = 1
        
        // 가로와 반대로 세로기준 아래칸의 사탕이랑 같을 경우
        for j in 0..<N-1 {
            if board[j][i] == board[j+1][i] {
                cnt += 1
            } else {
                cnt = 1
            }
            maxCandy = max(maxCandy, cnt)
        }
    }
}

let N = Int(readLine()!)!
var board = [[String]]()
var maxCandy = 0

for _ in 0..<N {
    // 공백에 쓰이는 것 처럼 split 사용시 컴파일 에러 발생
    let input = Array(readLine()!.map{ String($0) })
    board.append(input)
}

// 가로로 인접한 두 사탕 교환하고, 최대 사탕 개수 찾고 원위치
for i in 0..<N {
    for j in 0..<N-1 {
        // 만약 현재칸과 다음칸에 있는 사탕이 똑같은 사탕이면 교환해도 똑같아서 아닐 때만 수행
        if board[i][j] != board[i][j+1] {
            var tmp = board[i][j]
            board[i][j] = board[i][j+1]
            board[i][j+1] = tmp
            
            arrCheck()
            
            tmp = board[i][j]
            board[i][j] = board[i][j+1]
            board[i][j+1] = tmp
        }
    }
}

for i in 0..<N {
    for j in 0..<N-1 {
        if board[j][i] != board[j+1][i] {
            var tmp = board[j][i]
            board[j][i] = board[j+1][i]
            board[j+1][i] = tmp
            
            arrCheck()
            
            tmp = board[j][i]
            board[j][i] = board[j+1][i]
            board[j+1][i] = tmp
        }
    }
}

print(maxCandy)
