//
//  main.swift
//  SwiftbookWebinars1.2
//
//  Created by Roman Remenkov on 26.04.2021.
//

import Foundation

/*
 Объявите два свойства с типом Float и присвойте каждому число с дробной частью, например, 3.14
или 42.0

 Объявите еще одно свойство с типом Double и присвойте ей сумму двух переменных типа Float

 Выведите результат при помощи print()
 */

let pi: Float = 3.14
let levelFortyTwo: Float = 42.0
let sumOfPiAndLevelFortyTwo = Double(pi + levelFortyTwo)

print(sumOfPiAndLevelFortyTwo)

/*
 Задание 2

 Создайте переменную numberOne и присвойте ей любое целочисленное значение

 Создайте ещё одну целочисленную переменную numberTwo и присвойте ей любое значение меньше numberOne

 Присвойте новой целочисленной константе result результат деления numberOne на numberTwo

 Присвойте новой целочисленной константе remainder остаток от деления numberOne на numberTwo

 Выведите на консоль сообщение: «При делении <...> на <...> результат равен <...>,
   остаток равен <...>», подставив вместо (<...>) свои результаты.

 Выведите на консоль фразу: «Результат деления <...> на <...> равен <...> <...>/<...>».
 Поясню: в математике результатом деления 5 на 3 будет натуральная дробь 1 2/3
   (одна целая две третьих, здесь мы используем стандартную математическую запись, а не оператор
    деления). Вам необходимо вывести на консоль именно такой результат от деления numberOne на
    numberTwo в виде натуральной дроби — например «Результат деления 7 на 3 равен 2 1/3».
 */

func sum(numberOne: Int, numberTwo: Int) -> Int {
    numberOne + numberTwo
}

func getRemainder(divisible: Int, divisor: Int) -> Int {
    divisible % divisor
}

print("Для сложения двух целых чисел введите первое целочисленное значение: ")
guard let input = readLine(), let numberOne = Int(input) else {
    print("Разрешается вводить только целые числа")
    fatalError()
}

print("Введите второе целочисленное значение: ")

guard let input = readLine(), let numberTwo = Int(input) else {
    print("Разрешается вводить только целые числа ¯\\_(ツ)_/¯")
    fatalError()
}

let result = sum(numberOne: numberOne, numberTwo: numberTwo)
print("Результат сложения двух значений: \(result)\n\n\n")

print("Для получения остатка от деления двух чисел введите делимое: ")
guard let input = readLine(), let divisible = Int(input) else {
    print("Разрешается вводить только целые числа")
    fatalError()
}

print("Для получения остатка от деления двух чисел введите второе значение: ")
guard let input = readLine(), let divisor = Int(input) else {
    print("Разрешается вводить только целые числа")
    fatalError()
}

let remainder = getRemainder(divisible: divisible, divisor: divisor)
print("Остаток от деления двух чисел: \(remainder)")


print("Для деления и получения остатка с натуральной дробью введите первое целое число: ")
guard let input = readLine(), let divisibleTwo = Int(input) else {
    print("Разрешается вводить только целые числа")
    fatalError()
}

print("Введите второе целое число: ")
guard let input = readLine(), let divisorTwo = Int(input) else {
    print("Разрешается вводить только целые числа")
    fatalError()
}
let integerPart = Int(divisibleTwo / divisorTwo)
let newRemainder = getRemainder(divisible: divisibleTwo, divisor: divisorTwo)
print("Результат деления \(divisibleTwo) на \(divisorTwo) равен: ")
print("\(integerPart) \(newRemainder)/\(divisorTwo)")
print("\n\n\n")

/*
 Задание 3

 Объявите константу dayOfBirth и присвоейте ей дату вашего рождения

 Объявите константу mothOfBirth и присвоейте ей месяц вашего рождения

 Объявите константу yearOfBirth и присвоейте ей год вашего рождения

 Подсичтайте количество полных лет, полных месяцев, дней и секунд с момента вашего рождения,
    по текущее время. За текущее время возьмите сегодняшнуюю дату и 0 часов 0 минут.
    Високосные года можете не учитывать. Пусть среднее количество дней в месяце будет 30.
    Создайте необходимы для решения данной задачи константы и переменные самостоятельно используя
    базовые операторы

 Выведите результат решения на консоль в виде текста (n years, n months, n days and n seconds
 have passed since my birth). Можете использовать свой текст

 Выведите на консоль сообщение о том в каком квартале вы родились. Для этого используейте операторы
   сравнения, что бы сравнить номер месяца вашего рождения с одним из четрырех кварталов.
   Например если номер месяца больше 0 и меньше или равно 3, то это будет первый квартал.
   Для получения результата используйте конструкцию if
 */

let dayOfBirth = 21
let monthOfBirth = 5
let yearOfBirth = 1988

let currentDate = 26
let currentMonth = 4
let currentYear = 2021

let daysPerMonth = 30
let monthPerYear = 12
let monthsLeft = (monthOfBirth - currentMonth + monthPerYear) % monthPerYear
let quarter: Int

// Подсчет полных лет
let diffOfYears = currentYear - yearOfBirth
let fullYears: Int

// Подсчет полных месяцев
let monthsFromBirthday = (currentYear - yearOfBirth) * monthPerYear - monthsLeft

if monthOfBirth > currentMonth {
    fullYears = diffOfYears - 1
} else {
    fullYears = diffOfYears
}

// Подсчет полных дней
let fullDays = monthsFromBirthday * daysPerMonth

// Подсчет полных секунд
let secondsInDay = 24 * 60 * 60
let fullSeconds = fullDays * secondsInDay

let output = "\(fullYears) years, " +
    "\(monthsFromBirthday) months, " +
    "\(fullDays) days and \(fullSeconds) seconds " +
    "have passed since my birth"

print(output)

// Вычисление квартала

switch monthOfBirth {
    case 1...3: quarter = 1
    case 4...6: quarter = 2
    case 7...9: quarter = 3
    case 10...12: quarter = 4
    default: fatalError("Internal system error")
}
print("You born in \(quarter) quarter")

/*
 Задание 4

Задание на вашу способность гуглить. Необходимо вычислить синус от числа 1 и округлить результат
 до тысячных.
 Подсказка: в результате должно получиться 0.841
 */

let number: CGFloat = 1
let sinus = sin(number)
let formattedOutput = String(format: "%.3f", sinus)
print(formattedOutput)
