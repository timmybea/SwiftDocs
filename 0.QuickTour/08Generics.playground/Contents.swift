//: Playground - noun: a place where people can play

import UIKit

//Generics are created using angled brackets.
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

//makeArray(repeating: "knock", numberOfTimes: 4)
makeArray(repeating: 1.42, numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//Use 'where' right before the body to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [Int]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element{
        var commonElements: [Int] = []
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                   commonElements.append(lhsItem as! Int)
                }
            }
        }
        return commonElements
}

anyCommonElements([1, 2, 3, 7], [3, 9, 7])

//EXPERIMENT
//Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.

//Writing <T: Equatable> is the same as writing <T> ... where T: Equatable>.
