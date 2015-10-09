//
//  main.swift
//  SimpleCalc
//
//  Created by user on 10/6/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation


func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData,
        encoding: NSUTF8StringEncoding) as! String
    return
        result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming: String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}

var result : Double = 0

var avg : Double = 0

func factorial(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var fact = 1
    for i in 1...n {
        fact = fact * i
    }
    return fact
}


while(true) {
    print("Welcome to the SimpleCalc App")
    
    var firstInput = input()
    
    let multiOps = firstInput.componentsSeparatedByString(" ")
    
    if multiOps.count > 1 {
        switch multiOps[multiOps.count - 1] {
            case "count":
                print("Count = \(multiOps.count - 1)")
            case "avg":
                var sum : Double = 0
                for i in 0..<multiOps.count - 1 {
                    var value = convert(multiOps[i])
                    sum += value
                }
                avg = sum / Double((multiOps.count - 1))
                print("Average = \(avg)")
            case "fact":
                if multiOps.count > 2 {
                    print("Factorial operation can only accept one number")
                    break
                }
                var fact = factorial(Int(convert(multiOps[0])))
                print("Factorial = \(fact)")
            default:
                print("Invalid operation")
        }
        break
    }

    var secondInput = input()
    var thirdInput = input()

    switch secondInput {
        case "+":
            result = convert(firstInput) + convert(thirdInput)
        case "-":
            result = convert(firstInput) - convert(thirdInput)
        case "*":
            result = convert(firstInput) * convert(thirdInput)
        case "/":
            if convert(thirdInput) == 0 {
                print("Cannot divide by zero!", separator: "")
                break
            }
            result = convert(firstInput) / convert(thirdInput)
        case "%":
            result = convert(firstInput) % convert(thirdInput)
        default: break
    }
    print("Result = \(result)")
    break
}
