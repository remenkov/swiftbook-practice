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

/*
 Задание 3

3.1 Создайте структуру Car со следующими элементами:

name: String
porductionYear: Int
horsePower: Int
 */

struct Car {
    var name: String
    let productionYear: Int
    var horsePower: Int
}

/*
 3.2 Создайте экземпляр структуры Car с названием какого либо автомобильного бренда,
 например honda.
 */

let honda = Car(name: "Honda", productionYear: 2000, horsePower:100)

/*
 3.3 Создайте копию экземпляра honda, например, hondaCivic
 */

var hondaCivic = honda
hondaCivic.name = "HondaCivic"

/*
 3.5 Создайте цикл с пятью итерациями, в котором в каждой итерации необходимо увеличивать значение
   horsePower у структуры hondaCivic на единицу
 */

for _ in 1...5 {
    hondaCivic.horsePower += 1
}

/*
 3.6 Выведите значения структур honda и hondaCivic на консоль в следующем виде:
 "Мощность двигателя <..> составляет <...> л.с."
 */

print("Мощность двигателя \(honda.name) составляет \(honda.horsePower)  л.с.")
print("Мощность двигателя \(hondaCivic.name) составляет \(hondaCivic.horsePower)) л.с.")


/*
 Задание 4

4.1 Создайте структуру PlayerInChess, в которой есть два свойства: name с типом Sting и wins с типом Int

 */

struct PlayerInChess {
    let name: String
    var totalWins: Int

    func description() {
        print("Игрок: \(name), всего побед: \(totalWins)")
    }

    mutating func addWins(increment: Int) {
        totalWins += increment
    }
}

/*
4.2 Создайте экзмепляр струкутуры и инициализируйте её свойства
 */

var playerOne = PlayerInChess(name: "Silvester", totalWins: 10)

/*
4.3 Расширьте структуру PlayerInChess методом description, который должен выводить на консоль имя
 игрока и количество его побед
4.4 Вызвите данный метод из экземпляра структуры
 */

playerOne.description()

/*
 4.5 Расширте структуру методом addWins, который должен принимать целочисленное значение и
 увеличивать количество побед на это значение.

4.6 Вызовите метод addWins из экземпляра структуры, затем вызовите метод description
 */

playerOne.addWins(increment: 10)
playerOne.description()
