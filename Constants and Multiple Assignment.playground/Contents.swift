//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Variables
var age = 10
age

//Constants
let newAge = 16

//Multiple assignment
var (age1, age2, age3) = (10,12,13)
print(age1)
print(age2)
print(age3)

//Arithmetic Operators
1 + 1
1 - 1
1 * 1
1 / 1
10 % 3
1 & 1
var num1 = 12
var num2 = 2

num1 -= num2
//0010
var uno = 10
uno >> 1

//Function
func multiply(num1: Int, num2: Int) -> Float {
    return Float(num1 * num2)
}

print(multiply(num1: num1, num2: num2))


//Structs
struct userLocation {
    var name : String
    var latitude : Double
    var longitude : Double
}

var myLoc = userLocation(name: "Avi", latitude: 41.123, longitude: 43.123)
myLoc.name
myLoc.latitude
myLoc.longitude

func getLocation(loc: userLocation){
    print(loc.name)
}

print(getLocation(loc: myLoc))


//Arrays
var myarray = ["blue","red","orange"]
myarray[0]
myarray
myarray.remove(at: 0)
myarray
myarray.removeAll()
myarray.append("orange")
myarray.append("blue")
myarray.reverse()
myarray.reverse()
myarray.sort()

//Dictionary
var mydict = ["one":"supa","two":"dupa","three":"troopa"]
mydict["one"]
mydict["two"]
mydict["three"]

mydict["omg"]
mydict.removeValue(forKey: "one")
mydict


struct user {
    var name:String
    var lname:String
}

var userDict = ["one":user(name:"Aldanis", lname:"Vigo"),"two": user(name:"Jennifer",lname:"Vigo")]
userDict["one"]!.name

userDict.count


for i in 1...3{
    print(i)
}

for i in stride(from: 0, to: 10, by: 2){
    print(i)
}

var shoppingList = ["Apples","Oranges","Bananas"]

for item in shoppingList{
    print(item)
}

//To get the index and the value at once enumerate the structure
for (index,value) in shoppingList.enumerated(){
    print("\(value) \(index)")
}

for (index,value) in userDict.enumerated(){
    print("\(index) \(value.value.name)")
}

