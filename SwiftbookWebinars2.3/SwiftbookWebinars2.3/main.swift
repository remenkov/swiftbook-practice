//
//  main.swift
//  SwiftbookExercise2.3
//
//  Created by Roman Remenkov on 01.06.2021.
//
//

import Foundation

/*
 Упражнение - приведение типов и их контроль
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых
 значений.
 Распечатайте содержимое коллекции.
 */

private func printDelimiter() {
    print("------*--------*----------*----------*--------*----------*----------")
}

let randomValues: [Any] = [
    "Tennis",
    10.23,
    11,
    33.34254,
    true,
    1111,
    "Musician",
    "Dirty Coder"
]

print(randomValues)
printDelimiter()
