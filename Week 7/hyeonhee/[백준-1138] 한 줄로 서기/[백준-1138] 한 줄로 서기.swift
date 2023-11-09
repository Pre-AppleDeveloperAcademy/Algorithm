//
//  main.swift
//  Practice_Algorithm
//
//  Created by 심현희 on 2023/11/09.
//

import Foundation

print("입력: ", terminator: "")

// 디폴트 strippingNewline: true 설정
// guard let input = readLine() else { throw NSError() }
// guard let input = readLine(strippingNewline: false) else { throw NSError() }
// 개행문자를 포함하고 싶을때는 false 설정
// print("\(input)")

/*문제
 N명의 사람들은 매일 아침 한 줄로 선다. 이 사람들은 자리를 마음대로 서지 못하고 오민식의 지시대로 선다.
 어느 날 사람들은 오민식이 사람들이 줄 서는 위치를 기록해 놓는다는 것을 알았다. 그리고 아침에 자기가 기록해 놓은 것과 사람들이 줄을 선 위치가 맞는지 확인한다.
 **사람들은 자기보다 큰 사람이 왼쪽에 몇 명 있었는지만을 기억한다. N명의 사람이 있고, 사람들의 키는 1부터 N까지 모두 다르다.**

 각 사람들이 기억하는 정보가 주어질 때, 줄을 어떻게 서야 하는지 출력하는 프로그램을 작성하시오.

 입력
 첫째 줄에 사람의 수 N이 주어진다.
 N은 10보다 작거나 같은 자연수이다.
 둘째 줄에는 키가 1인 사람부터 차례대로 자기보다 키가 큰 사람이 왼쪽에 몇 명이 있었는지 주어진다.
 i번째 수는 0보다 크거나 같고, N-i보다 작거나 같다.
 i는 0부터 시작한다.

*/


let totalNumber = Int(readLine()!)!

let array = readLine()!.components(separatedBy: " ").map { Int($0)!}
var resultArray: [Int] = []
for _ in 0..<totalNumber {
    resultArray.append(0)
}

for (i, arrayNumber) in array.enumerated() {
    var count = 0
    // i : 0 1 2 3
    // arrayNumber : 2 1 1 0
    // 왼쪽에 arrayNumber 명이 있을때
    // 1. 앞에 키 큰 사람을 그만큼 0이 비워져 있는지 확인하고, 비워져있다면 i+1을 채운다
    // 0 을 확인하고 0을 i+1 을 대체하는 행위는 resultArray 에서 일어나야하므로 루프를 한번 더 돌린다
    // https://stackoverflow.com/questions/42058478/type-int-does-not-conform-to-protocol-sequence
    
    for (j, resultNumber) in resultArray.enumerated() {
        // j : 0 1 2 3
        // resultArrayNumber : 0 0 0 0
        // 현재 갯수만큼 0이 있는지 확인해야하므로 j == arrayNumber 을 이용해서 같아질때까지 돌린다.
        // 단 j == arrayNumber 을 이용해서 현재 갯수(arrayNumber) 만큼의 0의 갯수를 확인하기 위한 루프를 돌리게 되면 [0210] 인경우에서 빠져나감 i 가 2 이고 키는 3 일때
        // (i, arrayNumber) = (2,1) 왼쪽에 0은 한개여야 하는 루프에서 동작하지 않는다
        // 따라서 답이 [4 2 1 0] 으로 나오게 됨
        // 따라서 원하는 횟수만큼 0을 확인하는 루프를 돌리려면 조건이 하나 더 필요하다
        // 이 조건은 count 로 count 는 최종적으로는 2 1 1 0 즉 arrayNumber과 같게된다.
        //
        // 0 이 있지만 아직 원하는 만큼의 arrayNumber 에 도달하지 못했다면
        if resultNumber == 0 &&  count < arrayNumber {
            // 해당 문이 실행되면서 count 를 올린다
            count += 1
            
        }
        // count를 arrayNumber 만큼 올려놓았으므로 이때 (내가 원하는 시점, 즉 왼쪽의 0의 갯수인 arrayNumber 과 올려놓은 count 가 일치하는 시점에서)
        // 해당 else if 문이 실행된다
        // 이때 그 자리에 i+1 을 넣는다(왜냐면 키는 1부터 시작, i 는 0부터 시작이기 때문이다)
        else if  resultNumber == 0 && count == arrayNumber {
            resultArray[j] = i+1
            break
        }
    }
}
resultArray.map({String($0)}).forEach{print($0, terminator : " " )}


/*
 4
 2 1 1 0
 >>>
 
 4 2 1 3
 / 사람의 수 : 4명
 [0 0 0 0]
영번째 / 키가 1인 사람 : 왼쪽에 키가 큰 사람이 2명 xx1x.  ==> 아직 0번째 돌리는 경우 이므로 일단 앞에 두개를 비우고 나를 넣는다  0010
첫번째 / 키가 2인 사람 : 왼쪽에 키가 큰 사람이 1명 x2xx.  ==> 1번째 돌리는 경우 왼쪽에 0이 한개있는 자리인지 확인한다, 그 자리라면 2를 넣는다.  0210
두번째 / 키가 3인 사람 : 왼쪽에 키가 큰 사람이 1명 xx3x 혹은 xxx3. ==> 2번째 돌리는 경우 왼쪽에 0이 한개있는 자리인지 확인한다. 0213
세번째 / 키가 4인 사람 : 왼쪽에 키가 큰 사람이 0명 xxx4 => 첫번째에 위배 ===> 3번째 돌리는 경우 왼쪽에 0이 0개 있는 자리인지 확인한다. 4213
                                        4xxx
즉 4213

제일 키큰 사람부터 카운팅 해보자
 
 영번째 / 키가 1인 사람 : 왼쪽에 키가 큰 사람이 2명 42---1---3 인건 확실 => 결론 : 4231
 첫번째 / 키가 2인 사람 : 왼쪽에 키가 큰 사람이 1명 4---2---3 인건 확실
 두번째 / 키가 3인 사람 : 왼쪽에 키가 큰 사람이 1명 => 4---3 인건 확실
 세번째 / 키가 4인 사람 : 왼쪽에 키가 큰 사람이 0명 => 어딜가도 0명
 
 */
