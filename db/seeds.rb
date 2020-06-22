# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy EVERYTHING !!!"

Ticket.destroy_all
Creek.destroy_all
User.destroy_all

puts "Create users"

bob = User.create!(username:"Bob", email:"bob@gmail.com", password:"secret")
alice = User.create!(username:"alice", email:"alice@gmail.com", password:"secret")
jose = User.create!(username:"jose", email:"jose@gmail.com", password:"secret", role: 1)

puts "create creeks"

creek1 = Creek.create!(title: "Super event", description:"tu vas en chier", scheduledStartTime:"2020-06-24T05:06:07.0Z", price:10, user:jose, capacity:300)

puts "create tickets"

ticket = Ticket.create!(user: bob, creek: creek1)

puts "We seed like a boss"
