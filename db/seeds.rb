require "open-uri"

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

categories = Category.all

categories.each do |category|
  if category.photo.attached?
    category.photo.purge
  end
end

Contact.destroy_all
Message.destroy_all
Ticket.destroy_all
Creek.destroy_all
User.destroy_all
Category.destroy_all

puts "Create categories"

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593607870/img%20projet/sebastian-coman-photography-cQbOSRpElxw-unsplash_rpsisi.jpg')
food = Category.new(name:"Cuisine")
food.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
food.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587392/img%20projet/sport/woman-wearing-black-fitness-outfit-performs-yoga-near-body-802417_hpvjlv.jpg')
meditation = Category.new(name:"Méditation")
meditation.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
meditation.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587391/img%20projet/sport/woman-exercising-bear-body-of-water-1300526_gxpzic.jpg')
fitness = Category.new(name:"Fitness")
fitness.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
fitness.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587389/img%20projet/Photography/man-taking-picture-of-person-s-left-arm-1391786_c8nura.jpg')
photo = Category.new(name:"Photographie")
photo.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
photo.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593607980/img%20projet/nine-kopfer-zosE9lAYQlo-unsplash_enjbwm.jpg')
sophrologie = Category.new(name:"Sophrologie")
sophrologie.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
sophrologie.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593607841/img%20projet/danial-ricaros-FCHlYvR5gJI-unsplash_iotx4g.jpg')
code = Category.new(name:"Code")
code.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
code.save!

puts "Create users"

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598951/img%20projet/users/qunwhvo4fw6kloh8w5b49tmx8lx5.jpg')
user = User.new(username:"Aude", email:"aude@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598917/img%20projet/users/ybti419doxfgkqnoevbzxqegumb7.jpg')
user = User.new(username:"Laura", email:"laura@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598921/img%20projet/users/a59x7ew7fu1logcptkbnpyzaoc3r.jpg')
user = User.new(username:"Charlie", email:"charlie@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598976/img%20projet/users/122q4rimlxnqtd8oalk3g2dlg4jg.jpg')
camille = User.new(username:"Camille", email:"camille@gmail.com", password:"secret", role: 1, description: "Passionné de photographie, je vous apprendrai tous mes trucs et astuces pour tirer le meilleur de votre appareil photo !")
camille.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
camille.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593600162/img%20projet/users/woman-meditating-in-the-outdoors-2908175_ikkesx.jpg')
anna = User.new(username:"Anna", email:"anna@gmail.com", password:"secret", role: 1, description: "On se calme, on se détend et on médite avec moi. Venez découvrir les bienfaits de la respiration ventrale à travers mon cours de sophrologie.")
anna.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
anna.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593601310/img%20projet/users/man-meditating-on-a-tree-log-3576284_ffjabq.jpg')
marcel = User.new(username:"Marcel", email:"marcel@gmail.com", password:"secret", role: 1, description: "J'ai débuté ma formation en tant que mindfulness teacher au fin fond du Tibet avec les moines du temple Ying...")
marcel.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
marcel.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598964/img%20projet/users/w15x8j23uv3w02zvbrniz5h0xlno.jpg')
julie = User.new(username:"Julie", email:"julie@gmail.com", password:"secret", role: 1, description: "Avec moi vous allez découvrir le plaisir de transpirer ;) alors n'hésitez pas à venir très nombreux !")
julie.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
julie.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598954/img%20projet/users/f6mmen1jh15fh629cmljeu9yu753.jpg')
kevin = User.new(username:"Kevin", email:"kevin@gmail.com", password:"secret", role: 1, description: "Je suis professeur de boxe depuis 15 ans, grand passionné de ma discipline !")
kevin.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
kevin.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593599763/img%20projet/users/adult-cutting-daylight-facial-expression-1153369_d5o9js.jpg')
emma = User.new(username:"Emmanuelle", email:"emma@gmail.com", password:"secret", role: 1, description: "Ancien chef dans un restaurant deux étoiles, j'adore partager ma passion pour la cuisine en live ! Avec moi plus besoin de choisir entre goût et nutrition saine")
emma.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
emma.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593598976/img%20projet/users/122q4rimlxnqtd8oalk3g2dlg4jg.jpg')
user = User.new(username:"Michel", email:"michel@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

puts "create creeks"

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587389/img%20projet/sport/man-doing-yoga-2294363_xcaldb.jpg')
creek = Creek.new(title: "Découvrez votre ying", description:"Nous allons développer dans un premier temps notre ying et dans un second temps nous accorderons une attention particulière à notre yang intérieur...", scheduledStartTime:"2020-07-29T05:06:07.0Z", price:10, user:marcel, capacity:20, duration:30, category:meditation)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587393/img%20projet/food/young-man-grilling-meat-in-camp-4311067_gcxbmo.jpg')
creek = Creek.new(title: "Des burritos veggies", description:"Tout, tout, vous saurez tout sur nos burritos sans viande, sans graisse saturée, et sans gluten ! Zéro prise de calories et plaisir garanti !", scheduledStartTime:"2020-07-30T05:06:07.0Z", price:15, user:emma, capacity:10, duration:50, category:food)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587391/img%20projet/sport/person-holding-barbell-841130_id5dhr.jpg')
creek = Creek.new(title: "Fitness Ultimate", description:"Une nouvelle façon de garder la forme en répétant des postures de combat et en s'affrontant soi-même. Venez affronter votre côté obscur.", scheduledStartTime:"2020-07-29T05:06:07.0Z", price:8, user:kevin, capacity:300, duration:40, category:fitness)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593611610/img%20projet/users/person-holding-iphone-1322360_seeqga.jpg')
creek = Creek.new(title: "Selfie like a boss", description:"Les meilleurs réglages et lumières pour prendre des selfies comme vos influenceuses favorites ! De long, en large, de haut, en bas !", scheduledStartTime:"2020-07-01T05:06:07.0Z", price:10, user:camille, capacity:60, duration:60, category:photo)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

puts "We seed like a boss"
