# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([ {login: 'Alex', email: 'alex@goole.com'}, {login: 'Tom', email: 'tom@google.com'}, {login: 'Ban', email: 'ban@google.com'} ])

categories = Category.create([{title: 'Математика'}, {title: 'Русский язык'}, {title: 'География'}])

tests = Test.create([{title: 'Целые числа', category_id: 1, level: 1},
                     {title: 'Правописание', category_id: 2, level: 2},
                     {title: 'Картография', category_id: 3, level: 1}])
                     #{title: 'Орфография ',  category_id: 2, level: 2},
                     #{title: 'Картография', category_id: 3, level: 1},
                     #{title: 'Карта мира', category_id: 3, level: 2}])


questions = Question.create([{body: 'Сумма чисел 35 и 47 равна ли 82? ', test_id: 1},
                             {body: 'При х = 12 значение выражения (80 - x) равно 68?',test_id: 1},
                             {body: 'Слово "неизмен.ый" пишется с двумя "н"?', test_id: 2},
                             {body: 'Необходим ли мягкий знак в слове "пер.я"?', test_id: 2},
                             {body: 'Является ли глобус моделью земли?', test_id: 3},
                             {body: 'Сидней, это столица Австралии?', test_id: 3}])

answers = Answer.create([
               {body: 'Да', question_id: 1, correct: true},
               {body: 'Нет', question_id: 1},
               {body: 'Вероятно', question_id: 1},
               {body: 'Да', question_id: 2, correct: true},
               {body: 'Нет', question_id: 2},
               {body: 'Да', question_id: 3, correct: true},
               {body: 'Нет', question_id: 3},
               {body: 'Да', question_id: 4, correct: true},
               {body: 'Нет', question_id: 4},
               {body: 'Да', question_id: 5, correct: true},
               {body: 'Нет', question_id: 5},
               {body: 'Нет', question_id: 6, correct: true},
               {body: 'Да', question_id: 6}])

badges = Badge.create([{ title: 'Вы успешно завершили математический тест', rule_type: 'category_complete' },
                       { title: 'Вы успешно завершили тест с первой попытки', rule_type: 'first_attempt_complete' },
                       { title: 'Вы успешно завершили тест второго уровня сложности', rule_type: 'level_complete' }])

#tests_users = TestsUser.create([{user_id: users[0].id, test_id: tests[0].id}, {user_id: users[0].id, test_id: tests[1].id}, {user_id: users[0].id, test_id: tests[2].id}])

