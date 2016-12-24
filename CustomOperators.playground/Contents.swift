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
    
    static func *(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Int) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Int) -> Self
    
} // NumericType

extension Double : NumericType {
    
    internal static func *(lhs: Double, rhs: Int) -> Double {
        return lhs * Double(rhs)
    }

    internal static func /(lhs: Double, rhs: Int) -> Double {
        return lhs / Double(rhs)
    }
    
 } // extension Double : NumericType

extension Float : NumericType {
    
    internal static func *(lhs: Float, rhs: Int) -> Float {
        return lhs * Float(rhs)
    }

    internal static func /(lhs: Float, rhs: Int) -> Float {
        return lhs / Float(rhs)
    }
    
 } // extension Float : NumericType

extension Int : NumericType { }

infix operator ¿%

func ¿% <T: NumericType>(percentage: T, ofThisTotalValue: T) -> T {
    
    return (percentage * ofThisTotalValue) / 100

} // infix operator ¿%

infix operator %?

func %? <T: NumericType>(segment: T, ofThisTotalValue: T) -> T {

    return (segment * 100) / ofThisTotalValue

} // infix operator %?

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
