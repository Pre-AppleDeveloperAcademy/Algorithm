let n = Int(readLine()!)!

var cal_list:[Double] = Array(repeating: 0, count: n+1)

if n > 1 {
    for i in 2...n{
        if i < 4 {
            cal_list[i] = 1
            continue
        }
        cal_list[i] = cal_list[i-1] + 1

        if i%3 == 0{
            cal_list[i] = min(cal_list[i], cal_list[i/3]+1)
        }
        if i%2 == 0{
            cal_list[i] = min(cal_list[i], cal_list[i/2]+1)
        }
    }
}
print(Int(cal_list[n]))

// 3으로 나눠지는 수 -> n/3 의 값 +1
// 2로 나눠지는 수 -> n/2 의 값 +1
// 직전 값 +1

