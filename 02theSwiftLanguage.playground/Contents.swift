//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// USING STANDARD TYPES
// A playground

str = "Hello, Swift"
let constStr = str

// SPECIFYING TYPES
var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

// COLLECTION TYPES
// Array
var arrayOfInts: [Int]

// Dictionary
var dictoinaryOfCaptialsByCountry: [String:String]

// Sets
var winningLotteryNumbers: Set<Int>

// LITERALS AND SUBSCRIPTING

// Number LIterals
let number = 42
let fmStation = 91.1

// Array and Dictionary Literals
var countingUP = ["one", "two"]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

let secondElement = countingUP[1]


// INITIALIZERS
let emptyString = String()
let emptyArrayOfInts = Int()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

// PROPERTIES
countingUP.count

emptyString.isEmpty

// INSTANCE METHODS
countingUP.append("three")


// OPTIONALS
var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil"
}


// SUBSCRIPTING DICTIONARIES
//let space13Assignee: String? = nameByParkingSpace[13]

if let space13Assignee = nameByParkingSpace[13] {
    print("key 13 is assigned in the dictionary!")
}

let space42Assignee: String? = nameByParkingSpace[42]


// LOOPS AND STRING INTERPOLATION
for (space, name) in nameByParkingSpace {
    let per = "Space \(space): \(name)"
}


// ENUMERATIONS AND THE SWITCH STATEMENT

// Enumeration
enum PieType: Int {
    case apple = 0
    case cherry
    case pecan
}

let favoritePie = PieType.apple

// Switch Statement
let name: String
switch favoritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
}


// ENUMERATIONS AND RAW VALUES
let pieRawValue = PieType.pecan.rawValue

if let pieType = PieType(rawValue: pieRawValue) {
    
}























