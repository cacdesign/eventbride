# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all




# - Je crée mes users
10.times do |index|
	u = User.create(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, description: Faker::Shakespeare.hamlet_quote, email: "hihi@yopmail.com", password:'password')
	p "L'utilisateur #{u.last_name} de #{u.first_name}ans a été crée"
end


# - Je crée mes events
10.times do |index|
	e = Event.create(start_date: Faker::Date.forward(rand(1..10)), duration: (rand(1..25)*5), description: Faker::Shakespeare.hamlet_quote, price:rand(1..999), location: Faker::Address.city, admin: User.all.sample, title: Faker::Shakespeare.hamlet_quote)
	p "Le gossip #{e.start_date} a été créé"
end


# - Je crée mes attendances
10.times do |index|
	a = Attendance.create(stripe_customer_id: Faker::Code.nric, event: Event.all.sample, user: User.all.sample)
	p "L'attendee #{a.stripe_customer_id} a été crée"
end



