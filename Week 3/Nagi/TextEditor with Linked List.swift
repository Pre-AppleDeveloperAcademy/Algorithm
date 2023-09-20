//
//  main.swift
//  algorithm
//
//  Created by 이윤학 on 2023/09/03.
//

class Node {
    var data: String?
    
    var previous: Node?
    var next: Node?
    
    init(data: String? = nil, previous: Node? = nil, next: Node? = nil) {
        self.data = data
        self.previous = previous
        self.next = next
    }

}

class LinkedList {
    var head: Node? = nil
    var curser: Node? = nil
    var tail: Node? = nil
    
    var isLast: Bool {
        curser?.next == nil
    }
    var isFirst: Bool {
        curser?.previous?.previous == nil
    }
}

extension LinkedList {
    
    func readData() {
        let initialData = readLine()!.map{String($0)}
        
        addData(data: "Start of Data")
        
        for data in initialData {
            addData(data: data)
        }
        
        addData(data: "End of Data")
    }
    
    func printResult() {
        curser = head?.next
        while !isLast {
            print(curser?.data ?? "Error", terminator: "")
            curser = curser?.next
        }
        print("")
    }
    
    func addData(data: String?) {
        let newData = Node(data: data)
        
        if head == nil {
            head = newData
            curser = newData
            tail = newData
            
        } else {
            let previous = tail
            tail?.next = newData
            tail = newData
            tail?.previous = previous
            curser = tail
        }
    }
    
}

extension LinkedList {
    
    func printDataLeftCurser() {
        if isFirst {
            print("")
        } else {
            print(curser?.previous?.data ?? "Error")
        }
    }
    
    func move(to direction: String) {
        if direction == "L" && !isFirst {
            curser = curser?.previous
        } else if direction == "D" && !isLast {
            curser = curser?.next
        }
    }
    
    func delete() {
        if !isFirst {
            curser?.previous?.previous?.next = curser
            curser?.previous = curser?.previous?.previous
        }
        
            // 사라진 노드의 메모리 해제는 ..?
    }
    
    func insert(_ data: String) {
        let newData = Node(data: data)
        
        newData.previous = curser?.previous
        curser?.previous?.next = newData
        
        curser?.previous = newData
        newData.next = curser
    }
    
}




//===== test =====//
var editor = LinkedList()

while let input = readLine() {
    
    if editor.head == nil {
        editor.readData()
        continue
    }
    
    if input == "B" {
        editor.delete()
    } else if input.first == "P" {
        editor.insert(String(input.last!))
    } else {
        editor.move(to: input)
    }
    editor.printDataLeftCurser()
}

editor.printResult()
