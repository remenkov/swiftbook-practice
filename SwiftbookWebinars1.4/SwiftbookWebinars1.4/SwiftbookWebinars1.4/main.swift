//
//  main.swift
//  SwiftbookWebinars1.4
//
//  Created by Roman Remenkov on 29.04.2021.
//
//

import Foundation

/*
 Задание 1

 Пользователь открывает вклад (deposit) в банке на 5 лет на сумму 500 тыс. рублей. Процентная
 ставка годовых (rate) составляет 11%. Необходимо просчитать сумму дохода (profit) по окончании срока
 действия (period) вклада.  Для решения данной задачи используйет цикл for-in.
 Примечание: сумма вклада увеличивается с каждым годом и процент нужно считать уже от увелеченной суммы.

 Выведите результат на консоль в таком виде: "Сумма вклада через <... > лет увеличится на <...> и
   составит <...>"
 */

var deposit = 500.0
let rate = 0.11
var profit = 0.0
let period = 5
var revenue = 0.0

for _ in 1...period {
    profit = deposit * rate
    deposit += profit
    revenue += profit
    print("Сумма дохода: \(deposit)")
}

print("Сумма вклада через \(period) лет увеличится на \(revenue) и составит \(deposit)")

/*
 Задание 2
 Создайте целочисленные переменные base и power с любым значениями на ваше усмотрение.
 При помощи цикла for in возведите переменную base в степень power и присвойте результат 
  переменной result
 Выведите результат на консоль в следующем виде: «<…> в <…> степени равно <…>»
 */

let base = 5
let power = 3
var result = base

for _ in 2...power {
    result *= base
}

print("\(base) в \(power) степени равно \(result)")

/*
 Создайте целочисленный массив данных с любым набором чисел.
 Выведите на консоль все четные числа из массива
 Используя оператор Continue выведите на консоль все нечетные числа из массива.
 Оператор continue предназначен для перехода к очередной итерации, игнорируя следующий за ним код.
 Т.е. вам нужно выполнить проверку на четность числа, и если оно оказалось четным перейти
 к следующей итерации.
 */

let array = [1, 3, 5, 7, 9, 8, 6, 4, 2, 3, 5, 7, 9, 0, 8, 6, 4, 3, 2, 1]

for element in array {
    if element % 2 == 0 {
        continue
    }
    print(element)
}

/*
 Задание 4

 Создайте цикл (интревал можно задать от 1 до 10) в котором будет случайным образом вычисляться
 число в пределах от 1 до 10. Если число будет равно 5, выведите на коносль сообщение с номером итерации,
 например (Что бы выпало число 5 понадобилось 3 итерации) и остановите цикл.
 Для остановки цикла используйте оператор break. Оператор break предназначен для досрочного
 завершения работы цикла. При этом весь последующий код в теле цикла игнорируется.
 */

for (index, item) in (2...1105).reversed().enumerated() {
    if item == 5 {
        print("\(index + 1), \(item)")
        break
    }
}

/*
 Задание 5

 На 10 метровый столб лезет черепашка. За день она забирается на два метра, за ночь съезжает на 1.
 Определите при помощи цикла, через сколько дней она заберетсья на столб. Подумайте над тем, какой
 цикл использовать в этой ситуации.
 */

let distancePerMeters = 10
let dayDistance = 2
let nightDistance = -1
var finish = 0

for _ in (1...distancePerMeters) {
    finish += dayDistance + nightDistance
}

print("Черепаха заберется на столб за: \(finish) дней")

/*
 Задание 6

Очень сложное заданиe, не обязательно, только для желающих

Заполнить массив из 100 элементов простыми числами.
Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
Данная задача выполняется по методу решета Эратосфена
 */

var primeNumbers = [Int]()

external: for number in 2...101 {
    guard number % number == 0 && number % 1 == 0 else {
        continue
    }

    for i in 2..<number {
        if number % i == 0 {
            continue external
        }
    }

    primeNumbers.append(number)
}

print(primeNumbers)
