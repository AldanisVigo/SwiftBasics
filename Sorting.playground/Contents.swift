//: Playground - noun: a place where people can play

import UIKit
class Benchmark {
    
    var startTime: NSDate
    var key: String
    
    init(key: String) {
        self.startTime = NSDate()
        self.key = key
    }
    
    func finish() {
        let elapsed = NSDate().timeIntervalSince(self.startTime as Date) as Double
        let formatedElapsed = String(format: "%.3f", elapsed)
        print("Benchmark: \(key), Elasped time: \(formatedElapsed)(s)")
    }
    
    class func measure(key: String, block: () -> ()) {
        let benchmark = Benchmark(key: key)
        block()
        benchmark.finish()
    }
}


//Swift Sorted
var tmpList:[Int] = []
for _ in 0...30{
    tmpList.append(Int(arc4random_uniform(UInt32(100))))
}

var list = tmpList
Benchmark.measure(key: "swiftSorted", block:{
    list = list.sorted(by: <)
})
list

/*============================================================*/

//Insertion Sort
list = tmpList

func insertionSort(){
    for index in 1..<list.count {
        var currentIndex = index
        let tmp = list[currentIndex]
        while currentIndex > 0 && tmp < list[currentIndex - 1] {
            list[currentIndex] = list[currentIndex - 1]
            currentIndex -= 1
        }
        list[currentIndex] = tmp
    }
}

Benchmark.measure(key: "insertionSort", block: {
    insertionSort()
})
list
/*=============================================================*/

//Selection Sort
list = tmpList

func selectionSort(){
    for index in 0..<list.count - 1{
        var min_index = index
        for j in index + 1..<list.count{
            if list[j] < list[min_index]{
                min_index = j
            }
            
            let tmp = list[min_index]
            list[min_index] = list[index]
            list[index] = tmp
        }
    }
}

selectionSort()
list

/*============================================================*/

list = tmpList

//Recursive Quick Sort
func quickSort(the array:[Int]) -> [Int]{
    if array.count <= 1{
        return array
    }
    let pivot = array[array.count / 2]
    var lessArray: [Int] = []
    var moreArray: [Int] = []
    var equalArray: [Int] = []
    
    for element in array {
        if(element < pivot){
            lessArray.append(element)
        }else if element > pivot{
            moreArray.append(element)
        }else{
            equalArray.append(element)
        }
    }
    return quickSort(the: lessArray) + equalArray + quickSort(the: moreArray)
}

Benchmark.measure(key: "quicksort", block: {
    list = quickSort(the: list)
})
list

/*============================================================*/

//BubbleSort
list = tmpList
func bubbleSort(){
    for i in 0..<(list.count - 1){
        for j in 0..<(list.count-i-1){
            let tmp = list[j + 1]
            list[j + 1] = list[j]
            list[j] = tmp
        }
    }
}

Benchmark.measure(key: "bubbleSort", block: {
    bubbleSort()
})
list

/*============================================================*/


//Bucket Sort
list = tmpList

func bucketSort(){
    //If the list has 1 or less items return it
    if list.count <= 1{
        return
    }
    
    //Get the total number of buckets
    let maxVal = list.max()
    
    //Fill the buckets with 0
    var buckets = [Int](repeatElement(0, count: maxVal! + 1))
    
    //Create an output array
    var outputArray = [Int]()

    for element in 0..<list.count{
        //For every element in the list, increment it's bucket by one
        buckets[list[element]] = buckets[list[element]] + 1
    }
    
    //Run through each bucket
    buckets.enumerated().forEach{ index, value in
        //Check that the bucket has at least one item
        guard value > 0 else {return}
        
        //Append the items in the bucket to the output array
        outputArray.append(contentsOf: [Int](repeating: index, count: value))
    }
    
    list = outputArray
}

Benchmark.measure(key: "bucketSort", block: {
    bucketSort()
})

list

/*============================================================*/

//Recursive Merge Sort
list = tmpList

func merge(l:[Int],r:[Int]) -> [Int]{
    var left = l
    var right = r
    var dest:[Int] = []
    while( left.count > 0 && right.count > 0){
        if let firstElement = left.first, let secondElement = right.first {
            if(firstElement > secondElement){
                dest.append(secondElement)
                right.remove(at: 0)
            }else{
                dest.append(firstElement)
                left.remove(at: 0)
            }
        }
    }
    dest.append(contentsOf: left)
    dest.append(contentsOf: right)
    return dest
}

func mergeSort(array:[Int]) -> [Int]{
    if array.count < 2 { return array}

    let left = Array(array[..<Int(array.count / 2)])
    let right = Array(array[Int(array.count / 2)..<array.count])
    
    return merge(l: mergeSort(array: left), r: mergeSort(array: right))
}
Benchmark.measure(key: "mergeSort", block: {
    list = mergeSort(array:list)
})
list


