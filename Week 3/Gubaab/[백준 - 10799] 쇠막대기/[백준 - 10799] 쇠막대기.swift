func solution()->Int{
    let cut = Array(readLine()!)

    var left = 0
    var pre: Character = "("

    var result = 0

    for i in cut{
        switch i{
        case "(":
            left += 1
        case ")":
            if pre == "("{
                if left>1{
                    result += left-1
                    left -= 1
                }else{
                    left -= 1
                }
            }else{
                result += 1
                left -= 1
            }
           
        default:
            print(-1)
        }
        pre = i
    }
    return result
}


print(solution())


