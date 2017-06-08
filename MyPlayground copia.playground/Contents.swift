//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

var numero = 18.0



let label = "Stringa"
let larghezza = 90
let margin = 10
let padding = 20
let larghezzaLabel = label + String(larghezza)

let altraLabel = "Larghezza label: \(larghezza + margin * 2 + padding * 2) cm totali"

var myArray = ["A", "B", "C", "D"]
/// Svuota array 
// myArray = []
var mySecondArray = [Int](repeating: 2, count: 5)
mySecondArray.append(1)
mySecondArray.append(1000000000000)

var myDictionary = [String: Int]()
myDictionary = [:]


/*func calcolaStat(punteggi: ([Int])->(minimo: Int, massimo: Int, somma: Int) {
    let min = punteggi.max()
    let max = punteggi.min()
    //let sum =
}*/

print ("-------------")

let individualScore = [75, 43, 103, 87, 12]
for score in individualScore {
    print (score)
}

print ("-------------")

func returnFifteen () -> Int {
    var y = 10;
    func add() {
        y += 5
    }
    add()
    return y
}
print (returnFifteen())

print ("-------------")

func returnFirstElement() -> (([Int]) -> Int) {
    func addOne(number: [Int]) -> Int {
        return number.first!
    }
    return addOne
}

var firstElementReturned = returnFirstElement()
print (firstElementReturned([7, 8, 9, 10]))

print ("-------------")

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func isOdd(number: Int) -> Bool {
    let testNumber = number % 2
    return testNumber == 1
}

let numbersToTest = [21, 9, 12]

print (hasAnyMatches(list: numbersToTest, condition: lessThanTen))
print (hasAnyMatches(list: numbersToTest, condition: isOdd))

print ("-------------")

print (numbersToTest.map({
    (number: Int) -> Int in
    return 3 * number
}))

print (numbersToTest.map({
    number in 3 * number }).sorted{$0 > $1})
print (numbersToTest.map({ $0 * 3 }).sorted{$0 > $1})

print ("-------------")

class Shape {
    var numberOfSides = 0
    let myCostant : String;
    
    init(numberOfSides: Int, name: String){
        self.numberOfSides = numberOfSides
        myCostant = name
    }
    deinit{
        numberOfSides = 0;
    }
    func simpleDescription() -> String {
        return "Shape sides: \(numberOfSides) sides."
    }
    func calculatePerimeter(sideLenghts: [Int]) -> Int{
        var perimeter = 0
        for side in sideLenghts{
            perimeter += side
        }
        return perimeter
    }
}


var myShape = Shape(numberOfSides: 4, name: "Quadrilatero");
print (myShape.numberOfSides);
myShape.simpleDescription();
var myPerimeter = myShape.calculatePerimeter(sideLenghts: [1,3,6,8]);

class Square: Shape{
    var sideLength : Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(numberOfSides: 4, name: "Quadrato")
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A squadre with sides of length \(sideLength)"
    }
}

class TriangoloEquilatero: Shape{
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(numberOfSides: 3, name: "Triangolo")
        numberOfSides = 3
    }
    
    var perimeter: Double{
        get{
            return 3.0 * sideLength
        }
        set (value){
            sideLength = value / 3.0
        }

        
    }
}

class TriangleAndSquare{
    var triangle: TriangoloEquilatero{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = TriangoloEquilatero(sideLength: size, name: name)
    }
}

var triangoloEQuadrato = TriangleAndSquare(size: 10, name: "un'altro esempio")
print(triangoloEQuadrato.square.sideLength)
print(triangoloEQuadrato.triangle.sideLength)
triangoloEQuadrato.square = Square(sideLength: 50, name: "Più grande")
print(triangoloEQuadrato.triangle.sideLength)




















