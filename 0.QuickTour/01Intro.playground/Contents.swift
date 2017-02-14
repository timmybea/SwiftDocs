//: Playground - noun: a place where people can play

import UIKit

//Swift uses LLVM Low level virtual machine compiler, which was released in 2003. It's development began in 2000 at the Univeristy of Illinois.

//A SWIFT TOUR

//inferred type - the compiler infers that the type is int
var myVariable = 42
myVariable = 50
let myConstant = 42

//explicitly stated types. Note that the double has twice the accuracy of a float...
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

var float: Float = 10/3
var double: Double = 10/3

//converting types
let label = "The width is "
let width = 90
let widthLabel = label + String(width)

//Another (simpler) way of converting to string
let apples = 4
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

//Arrays and Dictionaries
//Both arrays and dictionaries are created using square brackets. Notice the use of commas in both, and colons in dictionaries.
var shoppingList = ["fish", "milk", "lettuce", "cereal"]
shoppingList[1] = "bottle of milk"
print(shoppingList)

var occupations = [
"Malcolm": "Captain",
"Keylee": "Mechanic"
]

occupations["Jayne"] = "Public relations"
occupations

//To create an empty dictionary or array, use the initializer syntax
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


//Optionals
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John" //= nil //sub with "John Appleseed"
var greeting = "Hello "
if let name = optionalName {
    greeting = greeting + name
} else {
    greeting = "Is anybody out there?"
}

//?? or else
let nickName: String? = "Johnny"
let fullName: String? = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

//Switches
let vegetable = "jalapeno pepper"
switch vegetable {
case "celery":
    print("Add some peanut butter and you've got a snack!")
case "cucumber", "creamcheese":
    print("Sounds like the makings of a sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything can go into a soup")
}

//Note that the default is necessary. After code inside the switch has been executed it doesn't continue to the next case, so there is no need to write break outs


//for in
let interestingNumbers = [
"Prime": [2, 3, 5, 7, 11, 13],
"Fibonacci": [1, 1, 2, 3, 5, 8, 13],
"Square": [1, 4, 9, 16, 25],
]

var largestNumber: Int = 0
var largestKind: String = ""

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largestNumber {
            largestNumber = number
            largestKind = kind
        }
    }
}
print("\(largestKind) \(largestNumber)")



//while loops
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

//Note that repeat-while will always run at least once whereas while could not meet the condition and never run

//for loops
var total = 0
for i in 0..<4 {
    total += i
}
print(total)




