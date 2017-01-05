//: Playground - noun: a place where people can play

import Cocoa

// Prefix and Postfix Operator

prefix operator !

prefix func ! (number: Int) -> Int {
    
    var factorial: Int = 0;
    
    guard (number - 1) > 0 else {
        
        return 1
        
    } // guard
    
    factorial = number * (!(number - 1))
    
    return factorial
    
} // prefix operator !

let number = 9

let factorial = !number

print("\(number)! = \(factorial)")

print()

// Infix Operator

protocol NumericType {
    
    var doubleValue: Double { get }

} // NumericType

infix operator ¿%
infix operator %?

func ¿% <T: NumericType>(percentage: T, ofTotal: Double) -> Double {
    
    return percentage.doubleValue * ofTotal / 100.0

} // infix operator ¿%

func %? <T: NumericType>(segment: T, ofTotal: Double) -> Double {
    
    return segment.doubleValue * 100 / ofTotal
    
} // infix operator %?

extension Double: NumericType {
    
    var doubleValue: Double { return self }
    
} // extension Double : NumericType

extension Int: NumericType {
    
    var doubleValue: Double { return Double(self) }
    
} // // extension Int : NumericType

let percentage: Double = 8
let price: Double = 45

let save = percentage ¿% price

print("\(percentage) % of \(price) $ = \(save) $")

print("\(save) $ of \(price) $ = \(save %? price) %")

print()

// Changing Precedence and Associativity

precedencegroup PowerPrecedence {
    associativity: left
    lowerThan: AdditionPrecedence
} // PowerPrecedence group

infix operator ^^ : PowerPrecedence

func ^^ (base: Int, power: Int) -> Double {
    
    return pow(Double(base), Double(power))
    
} // operator ^^^

print(5 ^^ 2 + 3)
