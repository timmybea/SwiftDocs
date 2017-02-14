//: Playground - noun: a place where people can play

import UIKit

let stringLiteral = "This is how to initialize a constant with a string literal"

var emptyString = "" //literal syntax
var anotherEmptyString = String() //initializer syntax

//isEmpty boolean
if emptyString.isEmpty {
    print("There is no string here")
}

//In objective C you need to declare if your string is immutable or mutable, but in Swift you just need to indicate whether or not the string is a constant or a variable.

var variableString = "horse"
variableString += " and carriage"

//VALUE TYPE
//Swift strings are a value type as opposed to a reference type. So when you are working with strings you need to be aware that you are passing copies of values.

var pet = "dog"
var myPet = pet
myPet += " that is brown"
pet

//CHARACTERS

var hello = "hello"

for character in hello.characters {
    print(character)
}

hello.characters.count

//Turn a string into an array of characters. Manipulate it and return it into string form.

var catfish = "catfish"

var characters: [Character] = []

for character in catfish.characters {
    characters.append(character)
}

characters

for i in 1...4 {
    var index = characters.count - 1
    characters.remove(at: index)
}

characters

var cat = String(characters)
cat

//CONCATENATING STRINGS

var string1 = "hello"
var string2 = " there"
var welcome = string1 + string2

var string3 = "Look over"
string3 += string2

var character: Character = "!"
string3.append(character)

//NOTE: You must concatenate to a String and not to a  character. This is because the character data type can only contain one character.


//STRING INTERPOLATION
//This is when you interpret other datatypes to be represented in a string. For example:

var multiplier = 3
var statement = "The square of \(multiplier) is \(multiplier * multiplier)"

//UNICODE SCALAR 
//Behind the scenes, Swift strings are built from unicode scalar values which are a 21 bit number representing a character or emoji. They usually also come with a descriptioln eg:
//U+0061 for LATIN SMALL LETTER A ("a")

//SPECIAL CHARACTERS
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

//EXTENDED GRAPHEME CLUSTER
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é

//Notice that is the example above, you can achieve the character by either getting the single unicode scalar, OR by combining the 'e' scalar with the COMBINING ACCUTE ACCENT scalar. This is called a grapheme cluster. You can do similar things with foreign languages like korean or japanese, and even with some emoji graphics.

//Character count and extended grapheme clusters:

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")
// Prints "the number of characters in café is 4"

//Even though we have appended the combining accute accent, it has not affected the overall character count for our string. This is different to NSString. The count of the characters returned by the characters property is not always the same as the length property of an NSString that contains the same characters. The length of an NSString is based on the number of 16-bit code units within the string’s UTF-16 representation and not the number of Unicode extended grapheme clusters within the string.




//STRING INDICES
//greeting[0]   Note that this does not work. An index is different to an Int

let greeting = "greeting!"
let first = greeting.startIndex
let last = greeting.endIndex
greeting[first]

//SUBSTRING TO
let index = greeting.index(greeting.startIndex, offsetBy: 5)
let greet = greeting.substring(to: index)

//SUBSTRING FROM
let index2 = greet.index(greet.startIndex, offsetBy: 3)
let et = greet.substring(from: index2)
var ethical = et + "hical"

//SUBSTRING WITH RANGE
let start = ethical.index(ethical.startIndex, offsetBy: 1)
let end = ethical.index(ethical.endIndex, offsetBy: -2)
let range = start..<end

let thic = ethical.substring(with: range)
let thick = thic + "k"

//INSERT CHARACTER(S)
ethical
ethical.insert("!", at: ethical.endIndex)
ethical.insert(contentsOf: "ly".characters, at: ethical.index(ethical.startIndex, offsetBy: 7))


//REMOVE CHARACTER(S)
ethical
ethical.remove(at: ethical.index(before: ethical.endIndex))
ethical
let newRange = ethical.index(ethical.endIndex, offsetBy: -4)..<ethical.endIndex
ethical.removeSubrange(newRange)

//TESTING FOR EQUALITY
let quotation = "We're alot alike, you and I"
let sameQuotation = "We're alot alike, you and I"

if quotation == sameQuotation {
    print("Ha! These strings have the same contents")
}

//PREFIX AND SUFFIX EQUALITY
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var Act1SceneCount: Int = 0


for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        Act1SceneCount += 1
    }
}
print("There are \(Act1SceneCount) scenes in Act 1 of Romeo and Julliet")


let timber = "Timber"

if timber.hasPrefix("Tim") {
    print("This word begins with Tim")
}


var mansionScenes = 0

for scene in romeoAndJuliet {
    if scene.contains("Capulet's mansion") {
        mansionScenes += 1
    }
}
print("There are \(mansionScenes) scenes that take place in the Capulet mansion")


// get UTF8 codeUnits from strings.

let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 226 128 188 240 159 144 182


