//
//  main.swift
//  SwiftbookWebinars1.3
//
//  Created by Roman Remenkov on 27.04.2021.
//

/*
 Задание 1

 Представьте, что вы владелец розничного магазина и вам необходимо закупить товар, стоимость
 которого варьируется от его количества. Если количество закупаемого товара меньше 10 позиций,
 то цена равна 1000 рублей за штуку. От 10 до 20 единиц товара будет стоить вам 800 рублей за штуку.
 И вы заплатите 600 рублей за единцу при единовременно покупке от 20 единиц.
 Создайте условие для расчета цены за еденицу товара в зависмости от его количества и подсичитайте
 общую сумму используя конструкцию if-else. Постарайтесь написать короткое и читаемое решение
 */

var cost = 0
let costMaximum = 1000
let costMedium = 800
let costMinimum = 600

print("Здравствуйте, уважаемый Покупатель! \nТолько сегодня щедрая акции на пиво! При покупке от 20 ящиков вы заплатите всего 600 рублей за ящик! \nПри покупке от 10 до 20 ящиков вы заплатите 800 рублей за ящик! \nВведите количества закупаемого товара: ")
guard let input = readLine(), let productAmount = Int(input) else {
    fatalError()
}

if productAmount < 10 {
    cost = costMaximum
} else if (10...20).contains(productAmount) {
    cost = costMedium
} else if (20...).contains(productAmount) {
    cost = costMinimum
}

var totalPrice = cost * productAmount
let totalCost = totalPrice / productAmount

print("Стоимость товара составляет: \(totalPrice). "
    + "Цена за единицу товара составила: \(totalCost)")


/*
 Задание 2
 Во время выполнения упражнений данного плейграунда, вы будете выводить в консоль опциональные значения.
 Компилятор Swift выдаст предупреждение: «Expression implicitly coerced from Int? to Any».
 Для целей выполнения заданий, можете данные предупреждения игнорировать.

 Ваше приложение запрашивает пользователя его возраст.  Введённые пользователем данные передаются вам
 в виде текста, String.  Однако, вам нужно сохранить значение в виде целого числа Int.
 Пользователь может сделать ошибку и ввести неверные данные.

 Объявите константу userInputAge типа String и присвойте ей значение "34e" для моделирования
 опечатки.
 Затем определите константу userAge типа Int и используйте конструктор Int для преобразования
 userInputAge.  Какую ошибку вы получаете?
 */

print("Введите ваш возраст: ")
guard let input = readLine(), let userInput = Int(input) else {
    fatalError("Internal system error")
}

switch userInput {
case 0...20:
    print("Вам нельзя продавать алкоголь!\n\n\n")
case 21...110:
    print("Вам можно продавать алкоголь!\n\n\n")
default:
    print("Столько не живут!\n\n\n")
}

//if let userAge = Int(input) {
//    print("Ваш возраст: \(userAge)")
//} else {
//    print("Невозможно произвести опциональное связывание")
//}

/*
 Теперь поменяйте тип userAge на Int?, и напечатайте значение userAge.  Почему значение userAge равно nil?
 Ответьте в комментарии или внутри команды print.
 Теперь исправьте опечатку в значении userInputAge.  Что-нибудь в результатах вывода кажется вам неуместным?

 Напечатайте userAge снова, но теперь извлеките userAge с помощью оператора «!».
 Используйте привязку опционалов для извлечения userAge.  Если userAge содержит значение, выведите его в консоль.
 Теперь снова эмулируйте опечатку и попробуйте вывести на консоль целочисленное значение переменной
 userInputAge, при помощи оператора "!". Какую ошибку вы получите? Почему?

 -- Ошибка из за Force Unwrap, тк значение, введенное пользователем невозможно представить в виде
   целого числа
 */

/*
 Задание 3

 Доработать свое собственное решение первой половны второго задания прошлого урока с использованием оператора ветвления if-else.

 Вторую половину этого же задания необходимо выполнить, используя switch.
 */

/*
 Задание 4

 Как вы знаете, после выполнения кода, расположенного в блоке case, происходит завершение работы
    конструкции switch-case. Однако в некоторых случаях требуется не завершать работу конструкции
    switch-case, а перейти к выполнению кода в следующем блоке case. Для этого в конце блока case
    указывается ключевое слово fallthrough.
 Представьте, что существует три уровня готовности к чрезвычайным ситуациям: A, B и C.
 Каждая степень предусматривает выполнение ряда мероприятий, причем каждый последующий уровень
    включает в себя мероприятия предыдущих уровней. В зависимости от переданного уровня необходимо
    вывести на консоль все предназначенные для выполнения мероприятия.
 При этом минимальный уровень готовности — это C,
    максимальный — A (включает в себя мероприятия уровней C и B).
 В случае возникновения ситуации A необходимо "Выключить все электрические приборы".
 B - "Закрыть входные двери и окна". C - "Соблюдать спокойствие"
 */

print("""
      Введите мероприятия, которые необходимо выполнить,\nПри этом минимальный уровень готовности — это C,   
      максимальный — A (включает в себя мероприятия уровней C и B).
      """)

guard let input = readLine() else {
    fatalError("Internal system error")
}

switch input {
case "A":
    print("Внимание! Код красный! Необходимо выключить все электрические приборы")
    fallthrough
case "B":
    print("Закрыть входные двери и окна")
    fallthrough
case "C":
    print("Соблюдать спокойствие")
default:
    print("Вы ввели неверную команду. Введите команду на выбор - A, B или С")
}
