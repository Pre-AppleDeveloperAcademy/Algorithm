//
//  main.swift
//  algorithm
//
//  Created by 이윤학 on 2023/09/03.
//

class Student {
    static var isFirst = true
    
    var name: String?
    var number: Int?
    
    var next: Student?
    
    init(name: String? = nil, number: Int? = nil, next: Student? = nil) {
        self.name = name
        self.number = number
        self.next = next
    }
}

var head: Student? = nil
var now: Student? = nil
var tail: Student? = nil

func addStudent(name: String?, number: Int?) {
    var newStudent = Student(name: name, number: number)
    
    if Student.isFirst {
        head = newStudent
        now = newStudent
        tail = newStudent
        
        Student.isFirst = false
    } else {
        tail?.next = newStudent
        tail = newStudent
    }
}



//===== test =====//


addStudent(name: "Teacher", number: 0)
addStudent(name: "GuBaab", number: 1)
addStudent(name: "Liver", number: 2)
addStudent(name: "Raf", number: 3)
addStudent(name: "Nagi", number: 4)

while true {
    print("\(now?.number ?? -1) \(now?.name ?? "")")
    
    if now?.next == nil {
        print("End of Node")
        break
    } else {
        now = now?.next
    }
}
