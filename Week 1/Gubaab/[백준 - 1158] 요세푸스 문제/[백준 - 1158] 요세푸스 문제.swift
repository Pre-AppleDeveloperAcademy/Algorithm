func solution()->String {
    let input:[Int] = readLine()!.split(separator: " ").map{Int($0)!}
    var people:[Int] = Array<Int>(1...input[0])
    let k = input[1]
    
    var result:[Int] = []
    var pointer:Int = 0
    
    while people.count>0{
        pointer += k-1
        if pointer>people.count-1{
            pointer = pointer%people.count
        }
        result.append(people[pointer])
        people.remove(at:pointer)
    }
    return "<"+result.map{String($0)}.joined(separator: ", ")+">"
}

print(solution())

