// Created by BumMo Koo

import Foundation

//: ## If
//:
//: 조건문의 소괄호는 생략 가능하지만 대괄호는 생략할 수 없다.

if 3 > 1 { println("True") }

let isSingle = true
if isSingle == true { println("Cry.") }
else { println("Wake up.") }

let girlFriend: String? = nil
if let girlFriend = girlFriend { println("❤️") }
else { println("💩") }

//: ## For
for var index = 0; index < 10; index++ {
    println(index)
}

let array = [1, 1, 2, 3, 5, 8, 13, 21, 34]
for number in array {
    println(number)
}

var sum = 0
for number in 1 ... 100 {
    sum += number
}

let languages = ["Swift", "Objective-C", "C"]
for (index, language) in enumerate(languages) {
    println(language + " is at index \(index)")
}

//: ## Switch
//:
//: 반드시 모든 상황에 대한 처리를 해주어야한다. `break`는 안써주어도 `case` 하나만 실행을 한다.

let grade = 90
switch grade {
case 100: println("A+")
case 90 ..< 100: println("A")
case let grade where grade % 10 == 0: println("Can be divided by 10!")
default: break
}

//: ## Function
func emptyFunction() -> Void { }

func anotherEmptyFunction() -> () { }

func yetAnotherEmptyFunction() { }

func returnIntFunction() -> Int { return 0 }

func returnTupleFunction() -> (String, Int) { return ("error", 404) }

func returnNamedTupleFunction() -> (error: String, code: Int) {
    return ("Not Found", 404)
}

func parameterFunction(number: Int) { }
parameterFunction(3)

func twoParametersFunction(number: Int, string: String) { }
twoParametersFunction(3, "Parameter")

func namedParameterFunction(index number: Int, name string: String) { }
namedParameterFunction(index: 1, name: "BumMo")

func outerFunction() {
    func innerFunction() { }
    innerFunction()
}
outerFunction()
