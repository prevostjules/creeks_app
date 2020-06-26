require "open-uri"
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

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1592577270/xw9tccgmbifvdxo4zzcwaby7ozhl.jpg')
user = User.new(username:"Calvin", email:"calvin@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1592577250/zskvjdqkxl8gcor9v5oq5npa4r4j.jpg')
user = User.new(username:"Dylan", email:"dylan@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1592577244/o3p5cqo0rokzosudfaara0whlpq8.jpg')
user = User.new(username:"Charles", email:"charles@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593166799/Camille_fiioao.jpg')
camille = User.new(username:"Camille", email:"camille@gmail.com", password:"secret", role: 1)
camille.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
camille.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593166799/Anna_mybfh9.jpg')
anna = User.new(username:"Anna", email:"anna@gmail.com", password:"secret", role: 1)
anna.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
anna.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593166800/Marcel_pxyq25.jpg')
marcel = User.new(username:"Marcel", email:"marcel@gmail.com", password:"secret", role: 1)
marcel.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
marcel.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593166799/Julie_onldfs.jpg')
julie = User.new(username:"Julie", email:"julie@gmail.com", password:"secret", role: 1)
julie.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
julie.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593166800/Kevin_ewf3tc.jpg')
kevin = User.new(username:"Kevin", email:"kevin@gmail.com", password:"secret", role: 1)
kevin.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
kevin.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593166799/Emma_vwipci.jpg')
emma = User.new(username:"Emma", email:"emma@gmail.com", password:"secret", role: 1)
emma.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
emma.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1592571144/wqwlrzqfb2x75hwlojpd8agyahlt.jpg')
user = User.new(username:"Michel", email:"michel@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

puts "create creeks"

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593172939/marcel_o16lqf.jpg')
creek = Creek.new(title: "Mindfulness", description:"Nous allons développer dans un premier temps notre ying et dans un second temps nous accorderons une attention particulière à notre yang intérieur..", scheduledStartTime:"2020-07-24T05:06:07.0Z", price:10, user:marcel, capacity:20, duration:30)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593172948/emma_ixhlgc.jpg')
creek = Creek.new(title: "Fitness", description:"Une occasion unique de faire une bonne session de sport intensive tout en s'exprimant à travers la danse", scheduledStartTime:"2020-06-30T05:06:07.0Z", price:15, user:emma, capacity:10, duration:50)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593172939/kevin_jhqb5q.png')
creek = Creek.new(title: "Fitness", description:"Une nouvelle façon de garder la forme en répétant des postures de combat et en s'affrontant soi-même !", scheduledStartTime:"2020-06-29T05:06:07.0Z", price:8, user:kevin, capacity:300, duration:40)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593172948/camille_tufb0v.jpg')
creek = Creek.new(title: "Yoga", description:"Une technique de respiration puissante basée sur les rythmes, les sons et le souffle, permettant d'éliminer le stress et les émotions négatives profondément du système, pour méditer naturellement", scheduledStartTime:"2020-07-01T05:06:07.0Z", price:10, user:camille, capacity:60, duration:60)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593172939/julie_dkspgf.jpg')
creek = Creek.new(title: "Yoga", description:"Développer votre souplesse dans ce cours prévu pour les débutants de tout âge", scheduledStartTime:"2020-06-28T05:06:07.0Z", price:10, user:julie, capacity:200, duration:80)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593172948/anna_esqsav.jpg')
creek = Creek.new(title: "Instropection", description:"Technique de développement personnel en instropection en lien direct avec les moines tibétains !", scheduledStartTime:"2020-06-29T05:06:07.0Z", price:10, user:anna, capacity:300, duration:60)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

puts "We seed like a boss"




