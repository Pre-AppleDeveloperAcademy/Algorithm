func solution() -> String{
    let s = readLine()!
    
    var alpha = [Int](repeating: 0, count: 26)
    
    for i in s{
        let index: Int = Int(i.asciiValue!)-97
        alpha[index] += 1
    }
    
    return(alpha.map{String($0)}.joined(separator: " "))
}

print(solution())
