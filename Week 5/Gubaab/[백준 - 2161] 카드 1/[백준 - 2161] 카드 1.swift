var nums = Array<Int>(1...Int(readLine()!)!)
var ping = true //배열 계속 돌면서 핑퐁으로 빼면 된다!
var count = 0

while count != nums.count{ //숫자 전체 다 출력할때까지
    for i in 0..<nums.count{
        if nums[i] == 0{
            continue
        }
        if ping == true{ //홀수라면
            print(nums[i]) //출력
            nums[i] = 0
            ping = false
            count += 1
        }else{
            ping = true
        }
    }
}

