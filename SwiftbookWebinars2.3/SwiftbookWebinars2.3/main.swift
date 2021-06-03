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


/*
 Создайте переменную total типа Double, равную 0.
 Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к
 значению вашей переменной.
 Для каждой строки добавьте 1.
 Для каждого булева значения, добавьте 2, в случае, если значение равно true, либо вычтите 3,
 если оно false.  Напечатайте значение total.
 */

var total = 0.0

for value in someSchedules.values {
    switch value {
        case let intValue as Int:
            total += Double(intValue)
        case let doubleValue as Double:
            total += doubleValue
        case is String:
            total += 1
        case let boolValue as Bool:
            total += boolValue ? 1 : -3
        default:
            Void()
    }
}

print(total)
printDelimiter()

total = 0.0

for value in someSchedules.values {
    if let value = value as? Int {
        total += Double(value)

    } else if let value = value as? Double {
        total += value

    } else if value is String {
        total += 1

    } else if let value = value as? Bool {
        total += value ? 2 : -3
    }
}

printDelimiter()
print("Total: \(total)")
printDelimiter()

/*
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и
 вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в
 число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
*/

total = 0.0

for value in someSchedules.values {
    if let value = value as? Int {
        total += Double(value)

    } else if let value = value as? Double {
        total += value

    } else if let value = value as? String, let value = Double(value)  {
        total += value
    }
}

printDelimiter()
print("Total: \(total)")
printDelimiter()

/*
 Напишите функции describeRun(runningWorkout:) и describeSwim(swimmingWorkout:), принимающие
 объекты типаRun и Swim соответственно. Ни одна не должна возвращать значений. Каждая функция
 должна вывести описание тренировки, включая темп бега, либо стиль плавания.  Время представлено
 в секундах, расстояние — в метрах, темп — в шагах в минуту.
 */

class Workout {             // тренировка
    let time: Double        // время
    let distance: Double    // дистанция

    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {    // бег
    let cadence: Double // темп

    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {   // плавание
    let stroke: String  // стиль

    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

let workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "вольный стиль", time: 32.1, distance: 50),
    Swim(stroke: "баттерфляй", time: 36.8, distance: 50),
    Swim(stroke: "вольный стиль", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

func describeRun(runningWorkout: Run) {
    print("RUNNING WORKOUT")
    describe(workout: runningWorkout)
    print("cadence: \(runningWorkout.cadence) per steps.")
}

func describeSwim(swimmingWorkout: Swim) {
    print("SWIMMING WORKOUT")
    describe(workout: swimmingWorkout)
    print("stroke: \(swimmingWorkout.stroke).")
}

func describe(workout: Workout) {
    print("time: \(workout.time) in sec.")
    print("distance: \(workout.distance) in meters.")
}

for workout in workouts {
    if let runWorkout = workout as? Run {
        describeRun(runningWorkout: runWorkout)
    } else if let swimWorkout = workout as? Swim {
        describeSwim(swimmingWorkout: swimWorkout)
    }
}
