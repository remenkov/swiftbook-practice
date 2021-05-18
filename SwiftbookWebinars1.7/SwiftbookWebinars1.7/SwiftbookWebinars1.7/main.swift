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

 1.1 Создайте перечисление CalculationType, содержащее четыре математических действия:
 сложение, вычитание, умножение и деление.
 */

enum CalculationType {
    case addition, subtraction, multiplication, division
}

/*
 1.2 Напишите функцию возвращающую Int и принимающую в качестве аргументов три переменные:
 число один, число два и тип математической операции. Внутри функции, в зависимости от значения
 переменной типа CalculationType выполните соответствующую математическую операцию с константами и
 верните результат. Для перебора всех возможных результатов используйте конструкцию switch.
 Присвойте своей функции такое название, что бы из него было понятно для чего служит эта функция,
 но при этом сделайте это имя максимально лаконичным.
 */

func getMathOperationResult(firstNum: Int, secondNum: Int, mathType: CalculationType) -> Int {
    let result: Int

    switch mathType {
        case .addition:
            result = firstNum + secondNum

        case .subtraction:
            result = firstNum - secondNum

        case .division:
            result = firstNum / secondNum

        case .multiplication:
            result = firstNum * secondNum
    }

    return result
}

/*
 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.
 Постарайтесь сделать реализацию максимально гибкой — такой, что бы результат вывода можно было легко
 изменить, поменяв значения переменных. Доработайте функцию так, что бы при каждом её вызове на
 консоль выводился результат следующего содержания:
 «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>» для каждого отдельного случая.
 */

func printMathOperationResult(
    firstNum: Int,
    secondNum: Int,
    result: Int,
    mathType: CalculationType
) {
    let description: String

    switch mathType {
        case .addition:
            description = "сложения \(firstNum) и \(secondNum)"

        case .subtraction:
            description = "вычитания из \(firstNum) значения \(secondNum)"

        case .division:
            description = "деления \(firstNum) на \(secondNum)"

        case .multiplication:
            description = "умножения \(firstNum) на \(secondNum)"
    }

    print("Результат \(description) равен \(result)")
}

typealias MathData = (firstNum: Int, secondNum: Int, mathType: CalculationType)

let additionData = MathData(10, 5, CalculationType.addition)
let additionResult = getMathOperationResult(
    firstNum: additionData.firstNum,
    secondNum: additionData.secondNum,
    mathType: additionData.mathType
)
printMathOperationResult(
    firstNum: additionData.firstNum,
    secondNum: additionData.secondNum,
    result: additionResult,
    mathType: additionData.mathType
)

let subtractionData = MathData(firstNum: 10, secondNum: 5, mathType: .subtraction)
let subtractionResult = getMathOperationResult(
    firstNum: subtractionData.firstNum,
    secondNum: subtractionData.secondNum,
    mathType: subtractionData.mathType
)
printMathOperationResult(
    firstNum: subtractionData.firstNum,
    secondNum: subtractionData.secondNum,
    result: subtractionResult,
    mathType: subtractionData.mathType
)

let multiplicationData = MathData(firstNum: 5, secondNum: 5, mathType: .multiplication)
let multiplierResult = getMathOperationResult(
    firstNum: multiplicationData.firstNum,
    secondNum: multiplicationData.secondNum,
    mathType: multiplicationData.mathType
)
printMathOperationResult(
    firstNum: multiplicationData.firstNum,
    secondNum: multiplicationData.secondNum,
    result: multiplierResult,
    mathType: multiplicationData.mathType
)

let divisionData = MathData(firstNum: 5, secondNum: 5, mathType: .division)
let divisionResult = getMathOperationResult(
    firstNum: divisionData.firstNum,
    secondNum: divisionData.secondNum,
    mathType: divisionData.mathType
)
printMathOperationResult(
    firstNum: divisionData.firstNum,
    secondNum: divisionData.secondNum,
    result: divisionResult,
    mathType: divisionData.mathType
)

/*
 Задание 2

 2.1 Создайте перечисление CurrencyUnit со следующими членами: rouble, dollar, euro.
 Данные члены перечисления имеют тип связанных значений следующего вида: ([String], String),
 где массив должен содержать перечень тех стран, в которых используется валюта,
 а тип String - сокращенное наименование валюты.
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
 2.3 Внутри перечисления CurrencyUnit создайте еще одно перечисление DollarCountries, в котором
 содержится перчень стран, национальной валютой которых является доллар (USA, Canada, Australia)

 2.4 Расширьте тип связанных значений (ассоциированный параметр) для члена dollar, который будет
 сообщать о том, валютой какой страны является данный доллар

 2.5 Создайте переменную someCurrency и присвойете ей значения относящиеся к доллару
 */

let someCurrency = CurrencyUnit.dollar(
    countries: ["Мексика", "США"],
    dollarNationalCountry: .usa,
    currencyName: "USD"
)

/*
 2.6 Используя ветвление switch выведите на коносль сообщение в котором описано что за валюта,
   в каких странах катируется, короткое наименование.
 */

func joinWithComma(array: [String]) -> String {
    array.joined(separator: ", ")
}

switch roubleCurrency {
    case .rouble(let countries, let currencyName):
        let joinedCountries = joinWithComma(array: countries)
        print("""
              Валюта Российской рубль.
              Котируется в странах: \(joinedCountries). 
              Краткое наименование: \(currencyName)
              """)

    case .dollar(let countries, let dollarNationalCountry, let currencyName):
        print("""
              Валюта Доллар США.
              Котируется в странах: \(countries).
              Является национальной валютой в \(dollarNationalCountry).
              Краткое наименование: \(currencyName)
              """)

    case .euro(let countries, let currencyName):
        print("""
              Валюта Евро.
              Котируется в странах: \(countries).
              Краткое наименование: \(currencyName)
              """)
}

switch someCurrency {
    case .rouble(let countries, let currencyName):
        let joinedCountries = joinWithComma(array: countries)
        print("""
              Валюта Российской рубль.
              Котируется в странах: \(joinedCountries)
              Краткое наименование: \(currencyName)
              """)

    case .dollar(let countries, let dollarNationalCountry, let currencyName):
        let joinedCountries = joinWithComma(array: countries)
        print("""
              Валюта Доллар США. Котируется в странах: \(joinedCountries).
              Является национальной валютой в \(dollarNationalCountry).
              Краткое наименование: \(currencyName)
              """)

    case .euro(let countries, let currencyName):
        print("""
              Валюта Евро.
              Котируется в странах: \(countries).
              Краткое наименование: \(currencyName).
              """)
}

/*
 Задание 3

 3.1 Создайте структуру Car со следующими элементами:

 name: String
 productionYear: Int
 horsePower: Int
 */

struct Car: CustomStringConvertible {
    var description: String {
        get {
            "Мощность двигателя \(name) составляет \(horsePower) л.с., \(productionYear)"
        }
    }

    var name: String
    let productionYear: Int
    var horsePower: Int
}

/*
 3.2 Создайте экземпляр структуры Car с названием какого-либо автомобильного бренда,
 например honda.
 */

let honda = Car(name: "Honda", productionYear: 2000, horsePower: 100)

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

(1...5).forEach { _ in
    hondaCivic.horsePower += 1
}

/*
 3.6 Выведите значения структур honda и hondaCivic на консоль в следующем виде:
 "Мощность двигателя <..> составляет <...> л.с."
 */

print(honda)
print(hondaCivic)

/*
 Задание 4

4.1 Создайте структуру PlayerInChess, в которой есть два свойства:
    name с типом Sting и totalWins с типом Int
 */

struct PlayerInChess {
    let name: String
    var totalWins: Int

    func printDescription() {
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

playerOne.printDescription()

/*
 4.5 Расширте структуру методом addWins, который должен принимать целочисленное значение и
 увеличивать количество побед на это значение.

 4.6 Вызовите метод addWins из экземпляра структуры, затем вызовите метод description
 */

playerOne.addWins(increment: 10)
playerOne.printDescription()
