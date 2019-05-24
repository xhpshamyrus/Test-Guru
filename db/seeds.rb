# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([{ title: 'Математика' },
                              { title: 'Русский язык' },
                              { title: 'Геоеграфия' }])

tests = Test.create([
                      { title: 'Целые числа', level: 1, category_id: categories[0].id },
                      { title: 'Значения выражений', level: 2, category_id: categories[0].id },
                      { title: 'Правописание', level: 1, category_id: categories[1].id },
                      { title: 'Орфография ', level: 2, category_id: categories[1].id },
                      { title: 'Картография', level: 1, category_id: categories[2].id },
                      { title: 'Карта мира', level: 2, category_id: categories[2].id }
                    ])


questions = Question.create ([
                      { body: 'Сумма чисел 35 и 47 равна ли 82? ', test_id: tests[0].id },
                      { body: 'При х = 12 значение выражения (80 - x) равно 68?', test_id: tests[1].id },
                      { body: 'Слово "неизмен.ый" пишется с двумя "н"?', test_id: tests[2].id },
                      { body: 'Необходим ли мягкий знак в слове "пер.я"?', test_id: tests[3].id },
                      { body: 'Является ли глобус моделью земли?', test_id: tests[4].id },
                      { body: 'Сидней, это столица Австралии?', test_id: tests[5].id }
                    ])
answers = Answer.create ([
                      { body: 'Да', questions_id: questions[0].id, correct: true},
                      { body: 'Нет', questions_id: questions[0].id },
                      { body: 'Да', questions_id: questions[1].id, correct: true},
                      { body: 'Нет', questions_id: questions[1].id },
                      { body: 'Да', questions_id: questions[2].id, correct: true},
                      { body: 'Нет', questions_id: questions[2].id },
                      { body: 'Да', questions_id: questions[3].id, correct: true},
                      { body: 'Нет', questions_id: questions[3].id },
                      { body: 'Да', questions_id: questions[4].id, correct: true},
                      { body: 'Нет', questions_id: questions[4].id },
                      { body: 'Нет', questions_id: questions[5].id, correct: true},
                      { body: 'Да', questions_id: questions[5].id }
                    ])
