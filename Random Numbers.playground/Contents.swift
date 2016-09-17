//: Playground - noun: a place where people can play

import Foundation

var arrayOne = [0,1,2,3,4,5]
var arrayTwo = [0,1,2,3,4,5]

var equals = (arrayOne==arrayTwo)

print("Arrays equal? \(arrayOne==arrayTwo)")

//var arr = [Int].init(count: 10, repeatedValue: 0)
var arr = [UInt32].init(count: 10, repeatedValue: 0)

for i in 0...9{
    arr[i] = arc4random_uniform(2)
    //arr[i] = Int(arc4random_uniform(1))
    print("Value \(i):\(arr[i])")
}

var arr2 = arr;
