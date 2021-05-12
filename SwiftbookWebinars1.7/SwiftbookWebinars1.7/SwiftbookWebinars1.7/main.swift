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

let mathResult = getSimpleMathOperation(firstNum: 10, secondNum: 5, mathType:.subtraction)
print(mathResult)

