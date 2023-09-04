func solution()-> String{
    let s = readLine()!
    var dict: [Character:Int] = [:]
    for ch in s{
        if dict[ch] != nil{
            dict[ch]! += 1
        }else{
            dict[ch] = 1
        }
    }
    var odd: Character?
    for (key, value) in dict{
        if value%2 != 0 {
            if odd != nil{
                return ("I'm Sorry Hansoo")
            }
            odd = key
            dict[key] = value-1
        }
    }
    var sortedDict = dict.sorted {$0.0<$1.0}
    var result:[Character] = []
    for (key, value) in sortedDict{
        result += (String(repeating: key, count: value/2))
    }
    if odd != nil{
        result.append(odd!)

    }
    sortedDict = dict.sorted{$0.0>$1.0}
    for (key, value) in sortedDict{
        result += (String(repeating: key, count: value/2))
    }
    return String(result)
}

print(solution())

