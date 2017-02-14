//: Playground - noun: a place where people can play

import UIKit

//COLLECTIONS - There are three types of collections. Arrays, Dictionaries and sets. They can be mutable or immutable. Use let or var to declare either of these two states.

//ARRAY
//An array stores one specific data type in an ordered list. The same object can appear in the same array at different indexes.

var someInts = [Int]()
print("SomeInts is an array of ints with \(someInts.count) objects inside")

someInts.append(4)
someInts.count

someInts = []
//it is now empty, but still initialized to hold the same data type (int)


//Notice that you can initialize an array with this repeating function (although I'm not sure why someone would need it!) and you can add two arrays together using +. Notice also that I am using let so these are immutable arrays.
let threeDoubles: [Double] = Array(repeating: 0.0, count: 3)
let threeMoreDoubles: [Double] = Array(repeating: 2.5, count: 3)
let sixDoubles: [Double] = threeDoubles + threeMoreDoubles


//INITIALIZING AN ARRAY WITH LITERALS

var shoppingList: [String] = ["eggs", "milk", "ham"]
//thanks to type inference, you can also do the following:
//var shoppingList = ["Eggs", "Milk"]

//Some methods
shoppingList.count

shoppingList.isEmpty


//APPENDING
shoppingList.append("Cereal")

//OR

shoppingList += ["juice"]
//Notice with this syntax you are literally adding an array of one item to the existing array

//GET ITEM AT INDEX
shoppingList[0]
shoppingList.first
shoppingList.last

//Changing items in an array with a range. Notice that these two items get added beginning at index 3. Notice that 4 is the last element of the array as it existed before this line.
shoppingList[3...4] = ["apple", "banana"]
shoppingList


shoppingList.insert("yoghurt", at: 3)

//This cool function not only removes the item ham from the array, but it alse returns it so that you can use the element if you wish.
let ham = shoppingList.remove(at: 2)
ham

shoppingList

shoppingList.contains("milk")

shoppingList.removeLast()


for item: String in shoppingList {
    
    if item.contains("apple") {
        var newItem = item
        newItem += "pie"
    }
}

//If you need the index of the items as well as the item itself, use the enumerated method

shoppingList

for (index, item) in shoppingList.enumerated() {
    if item.contains("apple") {
        var newItem = item
        newItem += " pie"
        shoppingList.remove(at: index)
        shoppingList.insert(newItem, at: index)
    }
}

shoppingList


shoppingList.removeAll()

//SETS
//Use sets to group objects of the same type when the order is not important, or you need to ensure that each item appears only once.
//To appear in a set, the values must be hashable. A hash value is an identifying int that is used to confirm whether the contents of two variables are equal. All basic data types in swift are hashable.

let name: String = "Ruby"
name.hashValue

let anotherName = "Ruby"
anotherName.hashValue

//Notice that these two variables have the same value so their hash values are identical.

//A note on equatlability. The equatable protocol requires three conditions to be true:
//a == (a reflexivity)
//if a == b then b == a (symmetry)
//if a == b && b == c then a == c (transivity)

var letters = Set<Character>()
print("Letters is of type Set<Character> containing \(letters.count) items")

letters.insert("a")
letters.count

//Makes the set empty again, but keeps the type of Set<Character>
letters = []
letters.count

//Initialize a set with an array literal
var musicGenres: Set<String> = ["Rock", "Pop", "Classical"]
musicGenres.count

print("I have \(musicGenres.count) favorite music genres")

//Bool test set is empty
if musicGenres.isEmpty {
    print("I'm not so picky when it comes to music")
} else {
    print("I definitely have musical preferences")
}

//remove: Note that this not only removes the value, but it also returns it so that you can assign it to a variable.
if let removedItem = musicGenres.remove("Pop") {
    print("I've changed my mind abour \(removedItem) music")
}
print(musicGenres)

//.contains returns a bool
musicGenres.contains("funk")

//iterate on items in set with for in loop
for genre in musicGenres {
    print(genre)
}

//Using the .sorted command, returns the set in a sorted ARRAY using the < operator.
for genre in musicGenres.sorted() {
    print(genre)
}

//FUNDAMENTAL SET OPERATIONS

//a.intersection(b)  - returns values shared by both a and b (but removes all items unique to a or b)
//a.symmetricDifference(b) - returns values that are not shared by a or b (removes all shared items)
//a.union(b) - returns all values of a and b (obviously without repeating shared items)
//a.subtracting(b) - returns values that are unique to a only (removes shared items and b items)


let evenNumbers: Set<Int> = [2, 4, 6, 8]
let oddNumbers: Set<Int> = [1, 3, 5, 7, 9]
let lowPrimes: Set<Int> = [2, 3, 5, 7]

oddNumbers.union(evenNumbers).sorted()

oddNumbers.intersection(lowPrimes).sorted()

oddNumbers.symmetricDifference(lowPrimes).sorted()

lowPrimes.subtracting(oddNumbers).sorted()


//SUBSET - a set that has all of its items contained in another set
//SUPERSET - a set that contains all of the elements in another set
//DISJOINT SET - Two sets that have mutually exclusive items

let farmAnimals: Set<String> = ["cat", "dog"]
let housePets: Set<String> = ["cat", "dog"]
let nativeNZAnimals: Set<String> = ["tuatara", "kiwi", "kereru"]


//Notice that two equal sets can also qualify as superset or subset. Use StrictSubset to indicate that the sets are not equal.
farmAnimals.isSuperset(of: housePets)
farmAnimals.isStrictSuperset(of: housePets)

housePets.isSubset(of: farmAnimals)

//to be disjoint, the two sets cannot contain any shared items
nativeNZAnimals.isDisjoint(with: farmAnimals)



//DICTIONARIES

var namesOfIntegers = [Int: String]()

//Add item to the dictionary. Note that [] is the key
namesOfIntegers[16] = "sixteen"
namesOfIntegers.count

//reset the dictionary to be empty
namesOfIntegers = [:]
namesOfIntegers.isEmpty

var airports: [String: String] = ["YVR": "Vancouver", "JFK": "John F Kennedy"]
airports.count

//This will first create the new key and assign a value, and then change the value for the existing key
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

airports


//update is a good for not only changing the value at a key, but also returning the old value in the same step
if let oldValue = airports.updateValue("Vancouver International Airport", forKey: "YVR") {
    print("The old value for YVR was \(oldValue). Now it is \(airports["YVR"])")
}

//Get value from dictionary key
var valueFromDictionary = airports["LHR"]


//Remove key value pair from dictionary
airports["JFK"] = nil
print(airports)

//This removes the key value pair and returns the value
if let removedValue = airports.removeValue(forKey: "YVR") {
    print("\(removedValue) was removed from the dictionary")
}
airports

airports["AKL"] = "Auckland"
airports["BKK"] = "Bankok"
airports["YVR"] = "Vancouver"

airports

//Iterating over a dictionary

//access both key and value
for (code, name) in airports {
    print("The code for \(name) is \(code)")
}


//access just keys
for key in airports.keys {
    print(key)
}


//access just values
for names in airports.values {
    print(names)
}


//You can also put the keys or values into an array if necessary:
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)










