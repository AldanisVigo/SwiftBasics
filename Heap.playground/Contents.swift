//: Playground - noun: a place where people can play

import UIKit


///*
//    Sum of n natural numbers
//*/
//
////Naive approach O(n)
//func sum(_ n: UInt) -> UInt {
//    var result: UInt = 0
//    for i in 1...n{
//        result += i
//    }
//    return result
//}
//
////Algorithm O(1)
////n(n+1)/2
//func sumOptimized(_ n: UInt) -> UInt {
//    return (n * (n + 1)) / 2
//}
//
//sum(4)
//sumOptimized(4)
//
//
///*
//    Binary Search
//*/
// let numbers = [1,2,4,6,8,9,11,13,16,17,20]
//
////Naive approach O(n)
//func linearSearchForSearchValue(searchValue: Int, array: [Int]) -> Bool{
//    for num in array{
//        if num == searchValue {
//            return true
//        }
//    }
//    return false
//}
//
////Binary Search O(log n)
//
////(1) = (N / 2ˣ)
////Multiply both sides by 2ˣ
////[(2ˣ)(1) = N]  ==  [2ˣ = N]
////Log both sides
////log₂(2ˣ) = log₂(N)
////Bing down the x exponent
////xlog₂2 = log₂(N)
//
////Rewrite the log
////2ˣ = 2
////Calculate for X
////X = 2/2 == 1
////log₂2 = 1
//
////Rewrite the equation above
////x * 1 = log₂2(N)
////X = log₂2(N)
//
//
//func binarySearchForSearchValue(searchValue: Int, array: [Int]) -> Bool{
//    var min = 0
//    var max = array.count - 1
//
//    while min <= max {
//        let mid = (min + max) / 2
//        print("Mid:\(mid) Min:\(min) Max:\(max)")
//        if array[mid] == searchValue{
//            print("Found \(searchValue) at index \(mid)")
//            return true
//        }
//
//        if array[mid] > searchValue{
//            max = mid - 1
//        }else if array[mid] < searchValue{
//            min = mid + 1
//        }
//    }
//    return false
//}
//
//let search30Linear = linearSearchForSearchValue(searchValue: 1, array: numbers)
//
//let search30 = binarySearchForSearchValue(searchValue: 16, array: numbers)


//Heap
struct Heap{
    var elements:[Int]
    init(A:[Int]){
        elements = A
    }
    
    func getParent(for index:Int) -> Int{
        return index / 2
    }
    
    func getLeftChild(for parentIndex:Int) -> Int{
        return parentIndex * 2
    }
    
    func getRightChild(for parentIndex:Int) -> Int{
        return (parentIndex * 2) + 1
    }
    
    mutating func buildMaxHeap(){
        for (index,_) in elements.enumerated(){
            //If it's not a parent
            var parentIndex = getParent(for: index) + 1
            var leftChildIndex:Int?
            var rightChildIndex:Int?
            
            if(getLeftChild(for: parentIndex - 1) < elements.count - 1){
                leftChildIndex = getLeftChild(for: parentIndex) - 1
            }
            
            if(getRightChild(for: parentIndex - 1) < elements.count - 1){
                rightChildIndex = getRightChild(for: parentIndex) - 1
            }
            parentIndex = parentIndex - 1
            
            guard rightChildIndex != nil else{
                return
            }
            
            let leftChildVal = elements[leftChildIndex!]
            let rightChildVal = elements[rightChildIndex!]
            
            let biggerChildIndex = leftChildVal > rightChildVal ? leftChildIndex : rightChildIndex
            
            let biggerChildVal = elements[biggerChildIndex!]
            
            let parentVal = elements[parentIndex]
            
            //Swap parent and child if child is bigger
            if(biggerChildVal > parentVal){
                //Swapem
                let tmp = parentVal
                elements[parentIndex] = elements[biggerChildIndex!]
                elements[biggerChildIndex!] = tmp
            }
        }
    }
    
    mutating func swap(childKey:Int,parentKey:Int){
        let tmp = elements[childKey]
        self.elements[childKey] = self.elements[parentKey]
        self.elements[parentKey] = tmp
    }
    
    var lastElement: Int {
       return elements.last!
    }
}

var myHeap = Heap(A: [4,24,5,3,23,65])
myHeap.buildMaxHeap()
myHeap.elements



