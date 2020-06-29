require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy EVERYTHING !!!"

users = User.all

users.each do |user|
  if user.photo.attached?
    user.photo.purge
  end
end

creeks = Creek.all

creeks.each do |creek|
  if creek.photo.attached?
    creek.photo.purge
  end
end


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

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370202/woman-holding-black-camera-1854897_su22ej.jpg')
camille = User.new(username:"Camille", email:"camille@gmail.com", password:"secret", role: 1, description: "Passionnée de photographie, je vous apprendrai tous mes trucs et astuces pour tirer le meilleur de votre appareil photo !")
camille.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
camille.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370203/woman-meditating-in-the-outdoors-2908175_lnxfjd.jpg')
anna = User.new(username:"Anna", email:"anna@gmail.com", password:"secret", role: 1, description: "On se calme, on se détend et on médite avec moi.")
anna.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
anna.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370198/man-cross-legs-seating-on-white-wooden-chair-1270076_teknja.jpg')
marcel = User.new(username:"Marcel", email:"marcel@gmail.com", password:"secret", role: 1, description: "J'ai débuté ma formation en tant que mindfulness teacher au fin fond du Tibet avec les moines du temple Ying...")
marcel.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
marcel.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370680/body-stretching-yoga-beauty-35990_rnbqy6.jpg')
julie = User.new(username:"Julie", email:"julie@gmail.com", password:"secret", role: 1, description: "Avec moi vous allez découvrir le plaisir de transpirer ;)")
julie.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
julie.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370209/damir-spanic-rHDK3UU7HUw-unsplash_r7ldzf.jpg')
kevin = User.new(username:"Kevin", email:"kevin@gmail.com", password:"secret", role: 1, description: "Je suis professeur de boxe depuis 15 ans, grand passionné de ma discipline !")
kevin.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
kevin.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370198/man-holding-two-plates-with-cooked-foods-2494704_a3rxgc.jpg')
emma = User.new(username:"Emmannuel", email:"emma@gmail.com", password:"secret", role: 1, description: "Ancien chef dans un restaurant deux étoiles, j'adore partager ma passion pour la cuisine en live !")
emma.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
emma.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593175819/yf7jjb6aht2wfwxw8p4wfbdolgev.jpg')
user = User.new(username:"Michel", email:"michel@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

puts "create creeks"

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370267/tranquil-girlfriends-sitting-in-namaste-pose-while-4127336_wfmlus.jpg')
creek = Creek.new(title: "Découvrez votre ying", description:"Nous allons développer dans un premier temps notre ying et dans un second temps nous accorderons une attention particulière à notre yang intérieur...", scheduledStartTime:"2020-07-24T05:06:07.0Z", price:10, user:marcel, capacity:20, duration:30, category: "méditation")
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370229/burrito-chicken-delicious-dinner-461198_n8zlcb.jpg')
creek = Creek.new(title: "Des burritos par bourratifs", description:"Tout, tout, vous saurez tout sur les burritos !", scheduledStartTime:"2020-06-30T05:06:07.0Z", price:15, user:emma, capacity:10, duration:50, category: "food")
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370265/person-holding-barbell-841130_yp86f3.jpg')
creek = Creek.new(title: "Fitness Ultimate", description:"Une nouvelle façon de garder la forme en répétant des postures de combat et en s'affrontant soi-même.", scheduledStartTime:"2020-06-29T05:06:07.0Z", price:8, user:kevin, capacity:300, duration:40, category: "fitness")
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370252/woman-in-gray-sweater-holding-black-camera-4626358_xamczt.jpg')
creek = Creek.new(title: "Selfie like a boss", description:"Les meilleurs réglages et lumières pour prendre des selfies comme une influenceuse.", scheduledStartTime:"2020-07-01T05:06:07.0Z", price:10, user:camille, capacity:60, duration:60, category: "photo")
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370260/active-adult-athlete-body-416778_xg68f5.jpg')
creek = Creek.new(title: "Le meilleur cours de fitness", description:"Développer votre souplesse dans ce cours prévu pour les débutants de tout âge.", scheduledStartTime:"2020-06-28T05:06:07.0Z", price:10, user:julie, capacity:200, duration:80, category: "fitness")
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/dvwipbafx/image/upload/v1593370270/woman-stretching-on-ground-3076509_bygnu9.jpg')
creek = Creek.new(title: "Se développer grâce à l'introspection", description:"Technique de développement personnel en instropection en lien direct avec les moines tibétains #peace", scheduledStartTime:"2020-06-29T05:06:07.0Z", price:10, user:anna, capacity:300, duration:60, category: "sophrologie")
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!


puts "We seed like a boss"




