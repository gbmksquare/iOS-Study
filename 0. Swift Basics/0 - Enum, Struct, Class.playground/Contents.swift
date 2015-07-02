// Created by BumMo Koo

import Foundation
import UIKit

//: ## Enum

enum Error {
    case Network, Server, Client, Unknown
}

let networkError = Error.Network
let serverError: Error = .Server

//: Enum에 값을 지정할 수 있다.

enum NetworkError: Int {
    case Unauthorized = 401
    case Restricted = 403
    case NotFound = 404
}

let errorCode = NetworkError.NotFound.rawValue
let notFoundError = NetworkError(rawValue: 404)

//: Enum 안에 계산된 변수 (computed property) 또는 메서드를 선언할 수 있다.

enum ErrorDescription: Int {
    case Unathorized = 401
    case Network = 404
    
    var description: String {
        switch self {
        case .Unathorized: return "You are unauthorized to access this page."
        case .Network: return "Page you are looking for is not found."
            // 모든 Enum 케이스에 대해 처리를 했기 때문에 `default:`가 필요없다.
        }
    }
    
    func logError() {
        println("Encountered error: \(description)")
    }
}

println(ErrorDescription.Network.description)
ErrorDescription.Unathorized.logError()

//: Enum 값에 연관된 데이터를 저장할 수 있다.

enum NetworkResult {
    case Success(data: NSData)
    case Failed(error: NSError)
    case Unknown
}

let result = NetworkResult.Success(data: NSData())
switch result {
case .Success(let data): println("Got data: \(data.description)")
case .Failed(let error): println("Encountered error: \(error.localizedDescription)")
case .Unknown: println("Result is unknown")
}

//: ## Struct

//: Passed by value

enum Shape: String {
    case Diamond = "Diamond"
    case Heart = "Heart"
    case Clover = "Clover"
    case Spade = "Spade"
}

struct Card {
    var number: Int
    var color: UIColor
    var shape: Shape
    
    var description: String {
        return "\(shape.rawValue) \(number)"
    }
}
let card = Card(number: 1, color: UIColor.redColor(), shape: .Diamond)
println(card.description)

//: ## Class

//: Passed by reference

class Person {
    var name: String
    var age: Int
    var isMale: Bool
    
    var isFemale: Bool {
        return !isMale
    }
    
    init(name: String, age: Int, isMale: Bool) {
        self.name = name
        self.age = age
        self.isMale = isMale
    }
    
    func sayHello() {
        println("Hello, \(name)")
    }
}

let person = Person(name: "BumMo", age: 23, isMale: true)
person.sayHello()
println("\(person.name) is \(person.age)")
println(person.isFemale)

//: Inheritance
class Student: Person {
    var university: String
    var gpa: Float
    var girlFriend: Person?
    
    init(name: String, age: Int, isMale: Bool, university: String, gpa: Float) {
        self.university = university
        self.gpa = gpa
        super.init(name: name, age: age, isMale: isMale)
    }
    
    func escapeFromClass() -> Bool {
        println("Running away from class!")
        return Bool(Int(arc4random_uniform(2)))
    }
}

let student = Student(name: "BumMo", age: 23, isMale: true, university: "Korea University", gpa: 3.9)
println("\(student.name)'s GPA is not \(student.gpa)")
let isJailbreakSuccess = student.escapeFromClass
println(student.girlFriend)
