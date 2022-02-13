import Cocoa

var greeting = "Hello, playground"
greeting = "Ashish"
print(greeting)

// Basic Data Types
let intValue = 5
let doubleVal : Double = 5.0
let str : String = "Hello I am a string"
let boolValue : Bool = true


// Multiple variables at same time + optional
var x,y,z : Int?

var optionalInt :  Int?

// Fun Stuff

let 🙏 = "Namaste"
print(🙏)
let name = "Ashish"
print("Hello \(name)")

// Comment in one line

/*
 Multi line
 comment
 */

print("Ashish"); print("Ashish Again")

print("Int minimum value = \(UInt64.max)")
print("Int Maximum value = \(Int.max)")
var doubleMaxInt : Double = 9223372034775807
doubleMaxInt = doubleMaxInt * 2
print(doubleMaxInt)

let binaryVal = 0b0111
print(binaryVal)
let octalValue = 0o237
let hexaValue = 0xE
print(hexaValue)


// Tuple values (Key Value)
let tupleValue = (404, "Not Found")
print(tupleValue.0)
print(tupleValue.1)

let (id, status) = (200, "OK")
print(id)
print(status)

let tripleValue = (234, "Abcd", true)
print(tripleValue.0)
print(tripleValue.1)
print(tripleValue.2)


// Optionals

var strName : String?

strName = "Ashish"
// One way of handling optional
if strName != nil {
    print(strName!)
}

// If let statement
 if let name = strName {
    
    print(name)
}
/*
private static void sampleFunc(String str){
    
}*/

var iValue : Int?



func sampleFunctionForGuard(strVal : String?){
    // print the string
    
    guard let name = strName else { return}
    
    print(name)
    
    
}















