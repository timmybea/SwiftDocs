//: Playground - noun: a place where people can play

import UIKit


//Different types of control flow operations:
//while: performs a task multiple times
//if, guard, switch: performs a particular task given a particular condition
//break, continue: transfer flow of execution to another line of code
//for-in: allows iteration over items in a sequence, eg: array, range, string
//where: can be used for complex matching conditions


//an inclusive range
for index in 1...5 {
    print("\(index) * 4 is \(index * 4)")
}


//If you don't need each value in the sequence you can use an underscore
let base = 3
let power = 2
var answer = 1

for _ in 1...power {
    answer *= base
}

var report = "\(base) to the power of \(power) is \(answer)"

//Use a for-in loop to iterate over an array
let names = ["Ruby", "Silas", "my kids"]

for name in names {
    print("I love \(name),")
}
print("so very, very much.")


//You can also use a for-in loop for key value pairs in a dictionary
let numberOfLegs = ["Spider": 8, "horse": 4, "Octopus": 8, "Ant": 6]

for (creature, legs) in numberOfLegs {
    print("\(creature)s have \(legs) legs")
}



//Snakes and Ladders Game

//setup board
let finalSquare = 25
var board = [Int](repeatElement(0, count: finalSquare + 1))
board[3] = 8; board[6] = 11; board[9] = 9; board[10] = 2; board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8

board

var square = 0
var diceRoll = 0

while square < finalSquare {

    diceRoll += 1

    if diceRoll == 7 {
        diceRoll = 1
    }

    square += diceRoll

    //This line tripped me up. Notice that if the previous line resulted in a square greater thatn finalSquare, then you would be trying to access the array at an index beyond its bounds resulting in a segmentation fault
    if square < finalSquare {
        square += board[square]
    }
}
print("Game Over")



//Repeat while: We can do the same program using a repeat while, the difference being that it will perform the check at the end of the loop rather than at the beginning

square = 0
diceRoll = 0

repeat {
    
    diceRoll += 1
    
    if diceRoll == 7 { diceRoll = 1}
    square += diceRoll
    
    if square < finalSquare {
        square += board[square]
    }
    
} while square < finalSquare



//Switch
//The switch is a good structure to use when you hae lots of possible cases to check

let character: Character = "z"

switch character {
case "a", "A":
    print("The first letter of the alphabet")
case "z", "Z":
    print("The last letter of the alphabet")

default:
    print("another letter in the alphabet")
}

//Unlike other languages, the swift switch doesn't need a 'break' command as the compiler automatically breaks out of the switch after one case is executed
//Note that the two cases are compound cases. This means that there is more than one case "a" and "A" that can execute the same code inside the switch

//In this example the case is being expressed as a range

let countedThing = "moons orbitting Saturn"
let numberCounted = 62
let naturalisedCount: String

switch numberCounted {
case 0:
    naturalisedCount = "no"
case 1..<5:
    naturalisedCount = "a very small number of"
case 5..<12:
    naturalisedCount = "several"
case 12..<100:
    naturalisedCount = "dozens of"
case 100..<1000:
    naturalisedCount = "hundreds of"
default:
    naturalisedCount = "so many"
}

report = "There are \(naturalisedCount) \(countedThing)"

//This is a switch that handles a tuple. Notice that the underscore has been used as a placeholder value
//In this case it would true for the point (0, 0) to apply to all three of the cases, however it will default to the first applicable case. In this way, the ordering of your cases is important

let somepoint = (0, 0)

switch somepoint {
case (_, 0):
    print("The point is on the x axis")
case (0, _):
    print("The point is on the y axis")
case (-2...2, -2...2):
    print("The point is inside the square")
default:
    print("The point is outside the square")
}



//In this example the values in the tuple can be temporarily bound to variables or constants within the switch
//Notice that the last case makes both x and y values temporarily bound, which will apply to every case. Because of this, no default case is necessary
let anotherPoint = (0, 1)

switch anotherPoint {
case (let x, 0):
    print("point is on the x axis at the value: \(x)")
case (0, let y):
    print("point is on the y axis at value: \(y)")
case let (x, y):
    print("Point is not on either axis, but at xy value \(x), \(y)")
}


//where can be used in a switch case to further express a condition that must be met.

let yetAnotherPoint = (-1, 1)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("The point (\(x), \(y)) is on the line x == y")
    
case let (x, y) where x == -y:
    print("The point (\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("The point (\(x), \(y)) is is somewhere else")
}


//In this example, several cases that execute the same line of code can be listed with a comma seperator
let someCharacter = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
default:
    print("\(someCharacter) is a consonant")
}


//Here is the same idea with tuples. Notice how the distance constant is declared twice (for each possible case)

let stillAnotherPoint = (2, 0)

switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("\(stillAnotherPoint) is on an axis \(distance) from the origin")
default:
    print("just another point")
}


//Control Transfer Statements
//These are statements that change the order with which code is executed:

//return
//break
//throw
//fallthrough
//continue


//CONTINUE
//Causes one loop iteration to end immediately and begin the next loop. Notice that it does not break out of the loop though. Without the continue keyword in this example, the compiler would have to check every vowel in the array before continuing. This keyword means can save several operations in each loop.
//In this example, vowels are being removed from the input text.

var inputText = "Great minds think alike"
var outputText = ""
let vowels: [Character] = ["a", "e", "i", "o", "u", " "]

for character in inputText.characters {
    if vowels.contains(character) {
        continue
    } else {
        outputText.append(character)
    }
}
outputText

//BREAK
//The break command tells the program to break immediately out of the loop or switch. In a loop the break statement leaps immediately to the closing brace of the loop. It doesn't execute any more code within the loop.
//In this example the switch requires every case to be covered, but we rally just want to break out of the switch and execute the next line of code if the switch is provided a symbol that it doesn't recognise. Note that because possibleNumber is an optional, we simply have to check if it was assigned a value by the switch to know that it was recognised.


let numberSymbol = "三"
var possibleNumber: Int?

switch numberSymbol {
case "1", "١", "一", "๑":
    possibleNumber = 1
case "2", "٢", "二", "๒":
    possibleNumber = 2
case "3", "٣", "三", "๓":
    possibleNumber = 3
case "4", "٤", "四", "๔":
    possibleNumber = 4
default:
    break
}

if let number = possibleNumber {
    print("\(numberSymbol) means number \(number)")
} else {
    print("I don't recognise that symbol")
}

let greets = "hello"



