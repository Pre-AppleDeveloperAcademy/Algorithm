let input = readLine()!.split(separator: " ").map({Int($0)!})

//Set
var heard: Set<String> = []
var result: [String] = []

for _ in 0..<input[0] {
    heard.insert(readLine()!)
}

for _ in 0..<input[1] {
    let see = readLine()!
    if heard.contains(see) { //heard 배열에 있으면 result에 넣어줌
        result.append(see)
    }
}

result.sort()
print(result.count)
for person in result {
    print(person)
}

//Dictionary
//var people: [String:Int] = [:]
//
//for _ in 0..<input[0] {
//    people[readLine()!] = 1
//}
//
//for _ in 0..<input[1] {
//    let see = readLine()!
//    people[see, default: 0] += 1
//}
//
//var result: [String] = []
//var count = 0
//
//for person in people {
//    if person.value > 1{
//        result.append(person.key)
//        count += 1
//    }
//}
//
//result.sort()
//print(count)
//for person in result {
//    print(person)
//}

