//
//  main.swift
//  SwiftbookWebinars1.6
//
//  Created by Roman Remenkov on 04.05.2021.
//
//

import Foundation

final class Orange {
    let color: String
    let taste: String
    let radius: Double

    init(color: String, taste: String, radius: Double) {
        self.color = color
        self.taste = taste
        self.radius = radius
    }

    func getOrangeVolume() -> Double {
        let volume = 4 / 3 * Double.pi * pow(radius, 3)
        return volume
    }


}

let someOrange = Orange(color: "Orange", taste: "Sweet", radius: 9.5)
print("Orange has \(someOrange.color) color, and \(someOrange.taste) taste.")

print(someOrange.getOrangeVolume())

/*
 Задание 2

2.1 Создайте класс Figure (родительский класс) со следующими свойствами:

height: Float
width: Float
radius: Float
square: Float
perimeter: Float

Oбъявите в классе виртуальные методы (это такие методы, которые нужно будет переопределить)
squareOfFigure и perimeterOfFigure для расчетов площади и периметра (длины) фигуры соответственно.
Методы должены возвращать Float. Создайте инициализатор для сторон прямоугольника и отдельный
инициализатор для радиуса.

Создайте классы Circle, Rectangle и Ellipse, унаследовав их от Figure.
Переопределите методы squareOfFigure и perimeterOfFigure для каждого класса в соответствии с правилом
расчета площади или периметра (длины) конкретной фигуры

В каждом классе создайте метод description, который выводит на консоль сообщение следующего вида:
 «Площадь фигуры <тип фигуры> равна <... >, периметр (длина) равна <...>»

Создайте по экземпляру каждого класса, кроме Figure, проинициализируйте свойства height и width или
radius для каждого класса в любые значения и вызовите у каждого экземпляра класса метод description
 */
class Figure {
    let height: Float
    let width: Float
    let radius: Float
    let square: Float
    let perimeter: Float

    init(height: Float, width: Float) {
        self.height = height
        self.width = width
        self.radius = 0
        self.perimeter = 0
        self.square = 0
    }

    init(radius: Float) {
        self.radius = radius
        width = 0
        height = 0
        perimeter = 0
        square = 0
    }


    func squareOfFigure() -> Float {
        0.0
    }

    func perimeterOfFigure() -> Float {
        0.0
    }
}

class Circle: Figure {
    override func squareOfFigure() -> Float {
        Float(Double.pi * pow(Double(radius), 2))
    }

    override func perimeterOfFigure() -> Float {
        Float(2 * Double.pi) * radius
    }

    func description() {
        print("Square of \(Circle.self) equals \(squareOfFigure()), perimeter equals \(perimeterOfFigure())")
    }
}

class Rectangle: Figure {
    override func squareOfFigure() -> Float {
        Float(width * height)
    }

    override func perimeterOfFigure() -> Float {
        Float(2 * (width + height))
    }

    func description() {
        print("Square of \(Rectangle.self) equals \(squareOfFigure()), perimeter equals \(perimeterOfFigure())")
    }
}

class Ellipse: Figure {
    override func squareOfFigure() -> Float {
        Float(Double.pi * pow(Double(radius), 2))
    }

    override func perimeterOfFigure() -> Float {
        Float(2 * Float(Double.pi) * radius)
    }

    func description() {
        print("Square of \(Ellipse.self) equals \(squareOfFigure()), perimeter equals \(perimeterOfFigure())")
    }
}

let circle = Circle(radius: 100)
circle.description()

let rectangle = Rectangle(height: 20, width: 30)
rectangle.description()

let ellipse = Ellipse(radius: 50)
ellipse.description()

/*
 Задание 3

Создайте класс Employee (сотрудник) со следующими свойствами:

salary
name
surname

Создайте массив из 5 объектов под названием names со следующими элементами: John, Aaron, Tim, Ted, Steven.
И еще один массив surnames с элементами: Smith, Dow, Isaacson, Pennyworth, Jankins

Объявите массив employees и создайте цикл, в котором он заполняется десятью объектами класса Employee
таким образом, что свойства name и surname инициализируются случайными именами и фамилиями из массивов
names и surnames, соответственно. Свойство salary (зарплата) тоже должно генерироваться в случайном
диапазоне от $1000 до $2000

 Пройдитесь по массиву employees при помощи for-in и выведите информацию по каждому объекту в виде:
 «<имя> <фимилия>’s salary is $<... >»

Создайте отдельный массив на основании employees, который включает только тех работников,
зарплата которых чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 3.4
 */

class Employee {
    var salary: Int
    var names: String
    var surnames: String

    init(salary: Int, names: String, surnames: String) {
        self.salary = salary
        self.names = names
        self.surnames = surnames
    }
}

let namesArray: [String] = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnamesArray: [String] = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]
var employees: [Employee] = []

for _ in 1...10 {
    let salary = Int.random(in: 1000...2000)
    let employee = Employee(
        salary: salary,
        names: namesArray.randomElement()!,
        surnames: surnamesArray.randomElement()!
    )
    employees.append(employee)
}

for employee in employees {
    print("Имя: \(employee.names), Фамилия: \(employee.surnames), Зарплата: $\(employee.salary)")
}

var employeesWithEvenSalary:[Employee] = []

for employee in employees {
    if employee.salary % 2 == 0 {
        employeesWithEvenSalary.append(employee)
    }
}

for employee in employeesWithEvenSalary {
    print(employee.names, employee.surnames, employee.salary)
}
