# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Answer.destroy_all
Question.destroy_all

categories = Category.create([
  {name: 'Science'},
  {name: 'Music'},
  {name: 'Arts'},
  {name: 'Memes'},
  {name: 'Literature'},
  {name: 'Programming'}
])

PASSWORD = 'pass123'

User.create([
  {first_name: 'Jon', last_name: 'Snow', email: 'js@winterfell.gov', password: PASSWORD},
  {first_name: 'Deanarys', last_name: 'Targaryan', email: 'danny@somewhere.gov', password: PASSWORD},
  {first_name: 'Cercei', last_name: 'Lannister', email: 'c@wkingslanding.gov', password: PASSWORD}
])

users = User.all

100.times do
  Question.create title: Faker::Hacker.say_something_smart,
                  body:  Faker::Hipster.paragraph,
                  view_count: rand(1000),
                  user: users.sample,
                  category: categories.sample
end

questions = Question.all

questions.each do |q|
  rand(1..5).times do
    Answer.create(body: Faker::RickAndMorty.quote, question: q)
  end
end

puts Cowsay.say 'Created 100 questions', :cow
puts Cowsay.say "Created #{Answer.all.count} answers! ð©", :ghostbusters
