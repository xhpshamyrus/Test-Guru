# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(login: 'Alex')
User.create(login: 'Ivan')
User.create(login: 'Ben')

Category.create(title: 'Математика')
Category.create(title: 'Русский язык')
Category.create(title: 'Геоеграфия')

Test.create(title: 'Целые числа', category_id: 1, level: 1)
Test.create(title: 'Значения выражений', category_id: 1, level: 2)
Test.create(title: 'Правописание', category_id: 2, level: 1)
Test.create(title: 'Орфография ',  category_id: 2, level: 2)
Test.create(title: 'Картография', category_id: 3, level: 1)
Test.create(title: 'Карта мира', category_id: 3, level: 2)


Question.create(body: 'Сумма чисел 35 и 47 равна ли 82? ', test_id: 1)
Question.create(body: 'При х = 12 значение выражения (80 - x) равно 68?',test_id: 2)
Question.create(body: 'Слово "неизмен.ый" пишется с двумя "н"?', test_id: 3)
Question.create(body: 'Необходим ли мягкий знак в слове "пер.я"?', test_id: 4)
Question.create(body: 'Является ли глобус моделью земли?', test_id: 5)
Question.create(body: 'Сидней, это столица Австралии?', test_id: 6)

Answer.create(body: 'Да', questions_id: 1, correct: true)
Answer.create(body: 'Нет', questions_id: 1)
Answer.create(body: 'Да', questions_id: 2, correct: true)
Answer.create(body: 'Нет', questions_id: 2)
Answer.create(body: 'Да', questions_id: 3, correct: true)
Answer.create(body: 'Нет', questions_id: 3)
Answer.create(body: 'Да', questions_id: 4, correct: true)
Answer.create(body: 'Нет', questions_id: 4)
Answer.create(body: 'Да', questions_id: 5, correct: true)
Answer.create(body: 'Нет', questions_id: 5)
Answer.create(body: 'Нет', questions_id: 6, correct: true)
Answer.create(body: 'Да', questions_id: 6 )

TestsUser.create(user_id: 1, test_id: 1)
TestsUser.create(user_id: 1, test_id: 2)
TestsUser.create(user_id: 1, test_id: 3)
