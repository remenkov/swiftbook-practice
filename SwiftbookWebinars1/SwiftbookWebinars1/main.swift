//
//  main.swift
//  SwiftbookWebinars1
//
//  Created by Roman Remenkov on 26.04.2021.
//

import Foundation

/*
 Объявите две строковые константы firstString и secondString.
 Присвойте им значения "I can" и "code" (именно такие, ни каких хитростей с лишними пробелами).
 Выведите в консоль фразу "I can code!" используя эти строковые переменные.
 */

let firstString = "I can"
let secondString = "code"
print("\(firstString) \(secondString)!")

/*
 Необходимо создать константу с именем myAge и присвоить ей значение вашего возраста (можно не настоящее).

 Объявите переменную типа Int с именем myAgeInTenYears и присвойте ей значение вашего возраста
  через 10 лет (используйте константу myAge и оператор сложения).

 Объявите ещё одну константу daysInYear и присвойте ей значение 365.25 (число дней в году с
  учетом высокосных годов).

 Объявите переменную типа Float с именем daysPassed и присвойте ей значение количества дней
  с момента вашего рождения плюс 10 лет (используйте myAgeInTenYears и daysInYear).

 При помощи функции print() выведите на консоль фразу: «Мой возраст <...> лет.

 Через 10 лет, мне будет <...> лет, с момента моего рождения пройдет <...> дней.

 Символы (<...>) необходимо заменить на значения переменных.
 */

print("Введите возраст: ")
guard let input = readLine(), let myAge = Int(input) else {
    fatalError()
}

let myAgeInTenYears = myAge + 10
let daysInYear = 365.25
let daysPassed = Float(myAgeInTenYears) * Float(daysInYear)
print("Мой возраст \(myAge) лет.")
print("Через 10 лет, мне будет \(myAgeInTenYears) лет, с момента моего рождения пройдет \(daysPassed) дней. ")


/*
 Необходимо вычислить площадь и периметр прямоугольного треугольника.

 Условия: Катеты прямоугольного треугольника: AC = 8.0, CB = 6.0.
 Гипотенузу треугольника AB вычисляем при помощи функции sqrt(Double),
  заменив Double суммой квадратов катетов
 */

print("Введите длину 1 катета: ")
guard let input = readLine(), let a = Double(input) else {
    fatalError()
}

print("Введите длину 2 катета: ")
guard let input = readLine(), let b = Double(input) else {
    fatalError()
}

func squareOfRightTriangle(a: Double, b: Double) -> Double {
    (a * b) / 2
}

func perimeterOfTriangle(a: Double, b: Double, c: Double) -> Double {
    a * b * c
}

func hypotenuseOfTriangle(a: Double, b: Double) -> Double {
    sqrt(pow(a, 2) + pow(b, 2))
}

let c = hypotenuseOfTriangle(a: a, b: b)
let square = squareOfRightTriangle(a: a, b: b)
let perimeter = perimeterOfTriangle(a: a, b: b, c: c)

print(square, perimeter)
