// Created by BumMo Koo

import Foundation

//: ## 변수, 상수 선언

let constant = 1 // 상수
var variable = 0 // 변수

//: 타입 표기

let annotatedDouble: Double = 3.14
let annotatedString: String = "An annotated string."

//: 상수 / 변수의 타입은 초기값으로 유추 가능하기 때문에 생략 가능하다.

let inferredDouble = 3.14
let inferredString = "An inferred string."

//: ## Hello, world!

print("Hello, world!")
println("Hello, world!")

println("Hello, " + "world!")

let helloWorldString = "Hello, world!"
println(helloWorldString)

let nameString = "BumMo"
println("Hello, \(nameString)!")

//: ## Types

let boolean: Bool = true
let integer: Int = 0
let float: Float = 1.0
let double: Double = 2.0
let string: String = "String"


//: Array

let annotatedIntArray: Array<Int> = Array<Int>()

let inferredIntArray = Array<Int>()

let defaultIntArray = [1, 2, 3, 4, 5]

let emptyIntArray = [Int]() // `Array<Int>()`와 동일

//: Dictionary

let annotatedDictionary: Dictionary<String, Double> = Dictionary<String, Double>()

let inferredDictionary = Dictionary<String, Double>()

let defaultDictionary = ["math": 1.5, "physics": 0.0, "algorithm": 3.5]

let emptyDictionary = [String: Int]()

//: Tuples

let doubleTuple: (String, Int) = ("Error", 404)

let tripleTuple = (30, 2.3, 10)
let firstTupleValue = tripleTuple.0
let secondTupleValue = tripleTuple.1
let lastTupleValue = tripleTuple.2

let namedTuple = (name: "BumMo", major: "Computer Science", isSingle: true)
let name = namedTuple.name
let major = namedTuple.major
let isSad = namedTuple.isSingle

//: Optionals
//:
//: 옵셔널은 값을 가지고 있거나 아무 값도 가지고 있지 않다. (nil)

var intOptional: Int?
println(intOptional)

intOptional = 1
println(intOptional)

//: 옵셔널 안의 값을 사용하려면 언렙(unwrap)을 해주어야한다.
//:
//: 강제 언랩 (forced unwrap)을 사용할 때 값이 없으면 crash가 일어난다.

let unwrappedInt = intOptional!

//: 안전하게 언랩을 하려면 `if let`을 사용한다.

if let unwrappedInt = intOptional {
    println("Got int \(unwrappedInt).")
} else {
    println("The value is nil.")
}

