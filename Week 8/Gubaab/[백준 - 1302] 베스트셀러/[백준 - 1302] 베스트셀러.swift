var ribraury: [String:Int] = [:]

for _ in 0..<Int(readLine()!)! {
    ribraury[readLine()!, default: 0] += 1
}

print(ribraury.sorted(by:{ if $0.value == $1.value{
   return $0.key < $1.key
}
    return $0.value > $1.value})[0].key)
