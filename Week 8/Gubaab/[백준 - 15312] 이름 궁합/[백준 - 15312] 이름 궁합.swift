//런타임 에러
let stroke = [3, 2, 1, 2, 3, 3, 2, 3, 3, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 2, 2, 1]
var sum: [Int] = []
var next_sum: [Int] = []
var result: [Character] = []

for c in readLine()! {
    sum.append(stroke[Int(c.asciiValue!)-65])
}

for (i, c) in readLine()!.enumerated() {
    sum[i] += stroke[Int(c.asciiValue!)-65]
}

while sum.count > 2{
    love()
}

func love(){
    for i in 0..<sum.count-1{
        next_sum.append(sum[i]+sum[i+1])
    }
    sum = next_sum
    next_sum = []
}

for num in sum{
    result.append(String(num)[String(num).index(before: String(num).endIndex)])
}

print(String(result))

