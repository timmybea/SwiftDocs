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
//Causes one loop iteration to end immediately and begin the next loop. Notice that it does not break out of the loop though.
//In this example, vowels are being removed from the input text. If the vowels arrray contains the character we want to leap ahead to the beginning of the next loop.

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

//FALLTHROUGH
//In a C switch you have to put a break in every case to avoid falling through to the next case. However, in Swift a break is the default behavior. However, if you would like fallthrough, you must explicitly call for it.

let numberToDescribe = 7
var description = "The number \(numberToDescribe) is "

switch numberToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number and "
    fallthrough
default:
    description += "an integer"
}

//Without this fallthrough command you could only ever have one addition to the descrition. This allows for two.

//LABELED STATEMENTS
//Because you can have nested loops, and conditionals, you can easily end up with complex looping behavior. This can make it hard to be precise about which loop you want your control transfer statement to apply to. Perhaps you want the break or fallthrough to apply to the parent loop as opposed to the loop that you are executing the line on. To combat this we can use labeled statements. Here is the snakes and ladders game again, this time with a 'gameLoop' label which is necessary because the while loop contains a switch.
//In this version of the game, the player must land exactly on the final square to win.


square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    
    diceRoll += 1
    
    if diceRoll == 7 { diceRoll = 1 }
    
    switch square + diceRoll {
    case finalSquare:
        // is equal to final square so break out of the while loop (not the switch)
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        //The player has rolled past the final square, so don't move and iterate through the gameLoop again (not the switch)
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("You win!")


//GUARD Command
//Guard is like a condition except it must always have an else statement with it


func greet(person: [String: String]) {
    
    guard let thisName = person["name"] else { return }
    
    print("Hello, \(thisName)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice wherever you are")
        return
    }
    
    print("I hope the weather is nice in \(location)")
    
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."


//Checking API Availability
//The idea is that the compiler can use the SDK data to determine which versions of APIs are available and so you can modify your code to allow for older or newer versions of OS etc.

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}

