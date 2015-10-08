//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

//for index in 1...6 {
//    let i = index
//    switch i {
//    case 1:
//        print("Index = \(index)", terminator: "")
//    case 2...5:
//        print("Index is between 2 and 5")
//    default:
//        print("Index is 6", terminator: "")
//    }
//}

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData,
encoding: NSUTF8StringEncoding) as! String
    return
        result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming: String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

while(true) {
    print("Welcome to the SimpleCalc App")
    
    let userInput1 = "calc 5 5 6 7 8 9 add"
    let userInput2 = "calc 3 4 5 sum"
    
    let inputArr = userInput1.componentsSeparatedByString(" ")
    
    let first = inputArr[0]
    var result = 0

    switch first {
        case "calc":
            let operation = inputArr[inputArr.count - 1]
        
            switch operation {
                case "add":
                    for var index = 1; index < inputArr.count - 1; ++index {
                        var n = convert(inputArr[index])
                        
                        result = result + n
                    }
                    print("Result = \(result)", separator: "")
                case "count":
                    print("Result = ", separator: "")
                case "avg":
                    print("Result = ", separator: "")
                case "sub":
                    print("Result = ", separator: "")
                case "mul":
                    print("Result = ", separator: "")
                case "mod":
                    print("Result = ", separator: "")
                case "fact":
                    if inputArr.count > 3 {
                        print("Factorial operation can only support one number")
                    } else {
                        print("Result = ", separator: "")
                    }
                
                default:
                    print("Invalid operator")
            }
        default:
            print("Usage: calc n1 n2 n2 <operation>", separator: "")
    }
    
    break
}
