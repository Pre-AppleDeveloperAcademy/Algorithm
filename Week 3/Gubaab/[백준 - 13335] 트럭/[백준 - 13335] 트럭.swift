let input = readLine()!.split(separator: " ").map({Int($0)!})
let n = input[0] //트럭 수
let width = input[1] //다리 길이
let maximum = input[2] //최대 하중

var truck: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
var pointer: Int = 1

var queue:[Int] = Array(repeating: 0, count: width+1)

var front: Int = 0 //dequeue
var rear: Int = width //enqueue
queue[width] = truck[0]

var nowWeight: Int = truck[0]
var time: Int = 1

while front != rear{
    time += 1
    front = front>=width ? (front+1)%(width+1) : front+1
    nowWeight -= queue[front]
    if pointer<n{
        if nowWeight + truck[pointer] <= maximum{
            rear = rear>=width ? (rear+1)%(width+1) : rear+1
            queue[rear] = truck[pointer]
            nowWeight += truck[pointer]
            pointer += 1 //다음 트럭 포인터 이동
        }else{
            rear = rear>=width ? (rear+1)%(width+1) : rear+1
            queue[rear] = 0
            
        }
    }

}

print(time)


