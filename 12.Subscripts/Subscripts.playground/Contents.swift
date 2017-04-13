//: Playground - noun: a place where people can play

import UIKit

//subscript(index: Int) -> Int {
//    get {
//        
//    } set(newValue) {
//        
//    }
//}

//Note that newValue is the same type as the return type. In this case Int. Also, newValue doesn't need to be explicitly stated as it is the default name.

//Subscripts can be read only too by removing getter and setter keywords.

//subscript(index: Int)  -> Int {
//    
//}


struct timesTable {
    let multiplier: Int!
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = timesTable(multiplier: 3)
threeTimesTable[6]

//What's happening here?
//We are initializing a timesTable struct with the property of three to make the three times table. Then we are querying the instance by calling the subscript essentially requsting the sixth entry of the the subscript.

//Notice that subscripts behave according to their type. For example here is how a subscript behaves for a dictionary, specifically referencing the key so that you can set of get associated values.

var numberOfLegs = ["cat": 4, "spider": 8, "ant": 6]
numberOfLegs["spider"]
numberOfLegs["bird"] = 2
numberOfLegs


//The definition of multiple subscripts is known as subscript overloading.

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


//Create a two by two grid
var twoByTwo = Matrix(rows: 2, columns: 2)
twoByTwo.grid

twoByTwo[0, 0] = 7.0
twoByTwo.grid

twoByTwo[1, 1] = 4.4
twoByTwo.grid

//twoByTwo[2, 1]
//Notice that going out of range will return an error because of the assert command.