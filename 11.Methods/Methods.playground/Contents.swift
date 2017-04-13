//: Playground - noun: a place where people can play

import UIKit

//Methods v Functions
//The distinction between these two terms is that a method is contained within a type (class, struct, enum etc.) whereas a func is not contained in a type (for example a View Controller??). Both functions and methods are denoted by the keyword 'func'

class Counter {
    
    var count = 0
    
    func increment() -> Int{
        count += 1
        return count
    }
    
    func increment(byAmount amount: Int) -> Int {
        count += amount
        return count
    }

    func resetCount() -> Int {
        count = 0
        return count
    }
}


let newCounter = Counter()
newCounter.increment()
newCounter.increment(byAmount: 4)
newCounter.resetCount()


//Self
//Self is important to use when you have a method parameter and an instance property that are called the same thing. Without self, the compiler assumes that you are referring to the method parameter.


struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
        //self.x is the instance property and x is the method parameter.
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}


//Modifying value types within instance methods
//Structures and snumerations are value types. This means that their properties cannot be modified by their methods.
//However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.

struct AnotherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

//In this example, we want to change the value of x and y in the struct, so we use the mutating keyword. When the method is completed, it will then write the new values back to the struct.

var thisPoint = AnotherPoint(x: 3, y: 4)
thisPoint.x
thisPoint.y

thisPoint.moveBy(x: 2, y: 2)
thisPoint.x
thisPoint.y


//Notice that you can do this another way by creating a new self property. Once again the values are written to the origin properties at the end of the method.

struct yetAnotherPoint {
    
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = yetAnotherPoint(x: x + deltaX, y: y + deltaY)
    }
}

var wow = yetAnotherPoint(x: 3, y: 6)
wow.moveBy(x: 2, y: 2)
wow.x
wow.y


//You can also use self to change the value of an enumeration:


enum OvenLightStates {
    
    case off, low, medium, high
    mutating func nextState() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .medium
        case .medium:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = OvenLightStates.off
ovenLight.nextState()
ovenLight.nextState()
ovenLight.nextState()

//Type methods
//You can create a type method that is able to be called without the type being instantiated. When you do this, you cannot modify any properties that are specific to the instance though. When you are doing this with a class you use the 'class' keyword, otherwise  if you are doing this with a value type you use the static keyword.

//self - when you are creating a type method 'self' refers to the type as opposed to the instance.

//In this example, LevelTracker keeps track of the levels for all players using static variables and methods; it also keeps track of individual players' levels with the instance variables and methods.


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

//A note about @discardingResult: This is an attribute that tells the compiler to suppress its warning when the returned value is not used. In this case, the method call may or may not use the boolean return value.

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

let Tim = Player(name: "Tim")
Tim.tracker.currentLevel
Tim.tracker.advance(to: 2)
Tim.complete(level: 1)
Tim.tracker.currentLevel
Tim.tracker.advance(to: 2)
LevelTracker.highestUnlockedLevel

