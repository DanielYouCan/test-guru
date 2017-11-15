# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    questions = Question.create([
      { body: 'What does HTML stand for?' }, 
      { body: 'What typing is in Ruby?' }, 
      { body: 'What is the fastest JS framework?' }])

    answers = Answer.create([
      { body: 'HyperText Markup language', correct: true }, 
      { body: 'static' }, 
      { body: 'dynamic', correct: true }, 
      { body: 'Angular' }, 
      { body: 'React', correct: true }])

    users = User.create([
      { email: 'oliver@gmail.com' },
      { email: 'polina_s@yahoo.com' }, 
      { email: 'gosha600@mail.ru' }])

    categories = Category.create([
      { title: 'Frontend' }, 
      { title: 'BackEnd' }, 
      { title: 'DevOps' }])

    tests = Test.create([ 
      { title: 'PHP', level: 2 }, 
      { title: 'C#' }, 
      { title: 'C', level: 3 }])