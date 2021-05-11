//
//  main.swift
//  SwiftbookWebinars1.5
//
//  Created by Roman Remenkov on 29.04.2021.
//
//

import Foundation

/*
 Задание 1

 Создайте словарь, который содержит результаты игр спортивной команды в чемпионате (например по
  хоккею). Ключом словаря должно быть название команды соперника, а в качестве значения должен быть
  массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр.
 Выглядить это должно примерно следующим образом:

 Игра с Салават Юлаев - 3:6
 Игра с Салават Юлаев - 5:5
 Игра с Авангард - 2:1
 Игра с Авангард - 2:3
 Игра с АкБарс - 3:3
 Игра с АкБарс - 1:2
 */

let hockeyChampionship = [
    "Salavat Youlaev": [
        [3, 6],
        [5, 5],
        [5, 9]
    ],
    "Avangard": [
        [2, 1],
        [2, 3]
    ],
    "AkBars": [
        [3, 3],
        [1, 2]
    ]
]

for (team, scores) in hockeyChampionship {
    for score in scores {
        print("\(team) - \(score[0]) : \(score[1])")
    }
}

/*
 Рыдание 2

Создайте функцию которая принимает в качестве аргументов день, месяц и год вашего рождения и делает
расчет полных прожитых вами дней, месяцев и лет с момента вашего рождения.
При вызове функции на консоль должно выходить то же самое сообщение, что и в предыдущих заданиях
 */

struct SWDate {
    let day: Int
    let month: Int
    let year: Int
}

struct SWDiff {
    let numberOfDays: Int
    let numberOfMonths: Int
    let numberOfYears: Int
}

func getDiffBetweenDates(dateFrom: SWDate, dateTo: SWDate) -> SWDiff {
    let monthsPerYear = 12
    let daysPerMonth = 30
    let totalDaysFromDateTo = (dateTo.year * monthsPerYear * daysPerMonth) + (dateTo.month * daysPerMonth) +
        dateTo.day
    let totalDaysFromDateFrom = (dateFrom.year * monthsPerYear * daysPerMonth) + (dateFrom.month * daysPerMonth) + dateFrom.day
    let daysDiff = totalDaysFromDateTo - totalDaysFromDateFrom
    let monthsDiff: Int = daysDiff / daysPerMonth
    let yearsDiff: Int = monthsDiff / monthsPerYear

    let diff = SWDiff(
        numberOfDays: daysDiff,
        numberOfMonths: monthsDiff,
        numberOfYears: yearsDiff
    )
    return diff
}

let birthdayDate = SWDate(day: 21, month: 5, year: 1988)
let currentDate = SWDate(day: 30, month: 4, year: 2021)
let diff = getDiffBetweenDates(dateFrom: birthdayDate, dateTo: currentDate)
print(
    """
    С момента Вашего рождения прошло дней: \(diff.numberOfDays), 
    месяцев: \(diff.numberOfMonths), 
    лет: \(diff.numberOfYears)
    """)

/*
 Задание 3

 Создайте функцию, которая считает общую сумму денег, хранящихся в кошельке. В кошельке имеются
 купюры различного достоинства от 50 до 5000 рублей
 Заполните массив различными купюрами и подсчитайте общую сумму
 */

func getSumOfBanknotes(numOf50s: Int, numOf100s: Int, numOf500s: Int) -> Int {
    var buffer = 0
    buffer = (numOf50s * 50) + (numOf100s * 100) + (numOf500s * 500)
    return buffer
}

let money = getSumOfBanknotes(numOf50s: 5, numOf100s: 1, numOf500s: 3)
print(money)

let walletOfBanknotes = [50, 50, 100, 500, 1000]

func getSumFromArray(array: [Int]) -> Int {
    var buffer = 0
    for item in array {
        buffer += item
    }
    return buffer
}

let moneyInWallet = getSumFromArray(array: walletOfBanknotes)
print(moneyInWallet)

/*
 Задание 4

Создайте функцию, которая определяет является ли число четным или нет. В случае, если число является
    четным, функция должна возвращать true. Иначе - false.
Подумайте над названием функции, оно должно быть ёмким и в то же время не очень длинным

Создайте функцию, которая определяет делится ли число на 3 без остатка. Функция так же должна возвращать
    булево значение. Так же подумайте над названием функции

Создайте функцию, которая создает возрастающий массив чисел в интервале от x до y. Данный интервал
    должен определять пользователь при вызове функции.
Если хотите усложить задание, то пусть данная функция создает массив случайных чисел в заданном интервале
    с уникальными значениями

Создайте массив чисел от 1 до 100, используя для этого вышесозданную функцию
 */

func isEvenNumber(number: Int) -> Bool {
    number % 2 == 0
}

func isDivisionByThree(number: Int) -> Bool {
    number % 3 == 0
}

func isNotDivisionByThree(number: Int) -> Bool {
    !isDivisionByThree(number: number)
}

let isEven = isEvenNumber(number: 11)
print(isEven)

let isDivByThree = isDivisionByThree(number: 9)
print(isDivByThree)

func getAscendingArray(fromNum: Int, toNum: Int, step: Int) -> [Int] {
    var arrayOfNumbers = [Int]()
    for (index, value) in (fromNum...toNum).enumerated() {
        if index % step == 0 {
            arrayOfNumbers.append(value)
        }
    }
    return arrayOfNumbers
}

let someArray = getAscendingArray(fromNum: 1, toNum: 100, step: 1)
print(someArray)

//for element in stride(from: 3, to: 100, by: 3) {
//    print(element)
//}

print(someArray.filter(isEvenNumber))
print(someArray.filter(isNotDivisionByThree))

