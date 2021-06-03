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

/*
 Пройдите по всем элементам коллекции.
 Для каждого целого, напечайте "Целое число " и его значение.
 Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

for value in randomValues {
    if value is Int {
        print("Целое число: \(value)")
    } else if value is String {
        print("Тип String: \(value)")
    } else if value is Bool {
        print("Булев тип: \(value)")
    } else if value is Double {
        print("Тип Double: \(value)")
    }
}
printDelimiter()

// Вариант 2
for value in randomValues {
    switch value {
        case is Int: print("\(value) is Int")
        case is String: print("\(value) is String")
        case is Double: print("\(value) is Double")
        case is Bool: print("\(value) is Bool")
        default:print("You know value type...")
    }
}

printDelimiter()


/*
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел,
 строк и булевых значений.
 Выведите пары ключ/значения для всех элементов коллекции.
 */

let someSchedules: [String: Any] = [
    "Хабаровск": "Москва", // 1
    "Ташкент": 5, // 6
    "Казань": true, // 2
    "Ура": "30",
    "Bro": 5.5, // 5.5
    "Ufa": 100, // 100
    "Miami": 38.5, // 38.5
    "Buenos": 35.5 // 35.5
]

for schedule in someSchedules {
    print("\(schedule.key): \(schedule.value)")
}

printDelimiter()

for key in someSchedules.keys.sorted() {
    print(key, someSchedules[key])
}

printDelimiter()

// Вариант 2
for (key, value) in someSchedules {
    print(key, value)
}
printDelimiter()
