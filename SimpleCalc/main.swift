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


var total : Double = 0

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
    var secondInput = input()
    var thirdInput = input()
    
    switch secondInput {
        case "+":
            total = convert(firstInput) + convert(thirdInput)
            print("Result = \(total)", separator: "")
        case "-":
            total = convert(firstInput) - convert(thirdInput)
            print("Result = \(total)", separator: "")
        case "*":
            total = convert(firstInput) * convert(thirdInput)
            print("Result = \(total)", separator: "")
        case "/":
            total = convert(firstInput) / convert(thirdInput)
            print("Result = \(total)", separator: "")
        case "%":
            total = convert(firstInput) % convert(thirdInput)
            print("Result = \(total)", separator: "")
        default: break
    }
    break
}
