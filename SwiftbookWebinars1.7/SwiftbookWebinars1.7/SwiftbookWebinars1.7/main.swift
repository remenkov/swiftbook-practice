//
//  main.swift
//  SwiftbookWebinars1.7
//
//  Created by Roman Remenkov on 11.05.2021.
//
//

import Foundation

/*
 Задание 1

1.1 Создайте перечисление CalculationType, содержащее четыре математических действия — сложение,
 вычитание, умножение и деление (если не знаете английские наименования — translate.google.com)
 */

enum CalculationType {
    case addition
    case subtraction
    case multiplication
    case division
}

/*
 1.2 Напишите функцию возвращающую Int и принимающую в качестве аргументов три переменные:
 число один, число два и тип математической операции. Внутри функции, в зависимости от значения
 переменной типа CalculationType выполните соответствующую математическую операцию с константами и
 верните результат. Для перебора всех возможных результатов используйте конструкцию switch.
 Присвойте своей функции такое название, что бы из него было понятно для чего служит эта функция,
 но при этом сделайте это имя максимально лаконичным.
 */

func getSimpleMathOperation(firstNum: Int, secondNum: Int, mathType: CalculationType) -> Int {
    switch mathType {
    case .addition:
        return firstNum + secondNum

    case .subtraction:
        return firstNum - secondNum

    case .division:
        return firstNum / secondNum

    case .multiplication:
        return firstNum * secondNum
    }
}

/*
 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.
 Постарайтесь сделать реализацию максимально гибкой — такой, что бы результат вывода можно было легко
 изменить, поменяв значения переменных. Доработайте функцию так, что бы при каждом её вызове на
 консоль выводился результат следующего содержания:
 «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>» для каждого отдельного случая.
 */

let additionResult = getSimpleMathOperation(
    firstNum: 10,
    secondNum: 5,
    mathType: .subtraction
)
print(additionResult)

let subtractionResult = getSimpleMathOperation(
    firstNum: 15,
    secondNum: 5,
    mathType: .subtraction
)
print(subtractionResult)

let multiplierResult = getSimpleMathOperation(
    firstNum: 5,
    secondNum: 5,
    mathType: .multiplication
)
print(multiplierResult)

let divisionResult = getSimpleMathOperation(
    firstNum: 10,
    secondNum: 5,
    mathType: .division
)
print(divisionResult)

func getSimpleMathOperationModified(firstNum: Int, secondNum: Int, mathType: CalculationType) {
    switch mathType {
    case .addition:
        print("Результат сложения \(firstNum) и \(secondNum) равен \(firstNum + secondNum)")

    case .subtraction:
        print("Результат вычитания из \(firstNum) значения \(secondNum) равен \(firstNum - secondNum)")

    case .multiplication:
        print("Результат умножения \(firstNum) на \(secondNum) равен \(firstNum * secondNum)")

    case .division:
        print("Результат деления \(firstNum) на \(secondNum) равен \(firstNum / secondNum)")
    }
}

getSimpleMathOperationModified(firstNum: 10, secondNum: 10, mathType: .multiplication)

/*
 Задание 2

2.1 Создайте перечисление CurrencyUnit со следующими членами: rouble, dollar, euro. Данные члены
 перечисления имеют тип связанных значений следующего вида: ([String], String),
 где массив должен содержать перечень тех стран, в которых используется валюта,
 а тип стринг - сокращенное наименование валюты.
 */

enum CurrencyUnit {

    enum DollarCountries: String {
        case australia = "Австралия"
        case canada = "Канада"
        case usa = "США"
    }

    case rouble(countries: [String], currencyName: String)
    case dollar(countries: [String], dollarNationalCountry: DollarCountries, currencyName: String)
    case euro(countries: [String], currencyName: String)
}

/*
 2.2 Создайте переменную roubleCurrency и присвойте ей соответствующие значения
 */

let roubleCurrency = CurrencyUnit.rouble(countries: ["Россия", "Узбекистан"], currencyName: "RUB")

/*
 2.3 Внутри перечисления CurrencyUnit создайте еще одно перечисление DollarCountrys, в котором
 содержиться перчень стран, национальной валютой которых является доллар (USA, Canada, Australia)

 2.4 Расширьте тип связанных значений (ассоциированный параметр) для члена dollar, который будет
 сообщать о том, валютой какой страны является данный доллар

2.5 Создайте переменную someCurrency и присвойете ей значения относящиеся к доллару
 */

let someCurrency = CurrencyUnit.dollar(countries: ["Мексика", "Эстония"], dollarNationalCountry:
.usa, currencyName: "USD")

/*
 2.6 Используя ветвление switch выведите на коносль сообщение в котором описано что за валюта,
   в каких странах катируется, короткое наименование.
 */

switch roubleCurrency {
case let .rouble(countries, currencyName):
    print("Валюта Российской рубль. Котируется в странах: \(countries.joined(separator: ", ")).Краткое наименование: \(currencyName)")

case let .dollar(countries, dollarNationalCountry, currencyName):
    print("""
          Валюта Доллар США. Котируется в странах: \(countries),
           является национальной валютой в \(dollarNationalCountry) краткое наименование: \(currencyName)
          """)

case let .euro(countries, currencyName):
    print("Валюта Евро. Котируется в странах: \(countries), краткое наименование: \(currencyName)")
}

switch someCurrency {
case let .rouble(countries, currencyName):
    print("Валюта Российской рубль. Котируется в странах: \(countries.joined(separator: ", ")), краткое наименование: \(currencyName)")

case let .dollar(countries, dollarNationalCountry, currencyName):
    print("""
          Валюта Доллар США. Котируется в странах: \(countries.joined(separator: ", ")),
           является национальной валютой в \(dollarNationalCountry) краткое наименование: \(currencyName)
          """)

case let .euro(countries, currencyName):
    print("Валюта Евро. Котируется в странах: \(countries), краткое наименование: \(currencyName)")
}
