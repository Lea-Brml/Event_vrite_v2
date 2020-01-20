# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

chiffre_multiple_5 = [5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100]
u = []
e = []

10.times do |index|

  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 20), email: Faker::Name.first_name+"@yopmail.com", password:"Anonymous" )
  u << user
  puts user

end

10.times do |index|

  event = Event.create(start_date: Faker::Date.forward(days: 28) , duration: chiffre_multiple_5.sample , title: Faker::Beer.name , description: Faker::Lorem.sentence(word_count: 10) , price: Faker::Number.between(from: 2, to: 999) , location: Faker::Address.city, administrator: u.sample)
  e << event
  puts event

end

10.times do |index|

  Attendance.create(user: u.sample , event: e.sample)

end
