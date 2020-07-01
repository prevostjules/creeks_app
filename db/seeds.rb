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

Message.destroy_all
Ticket.destroy_all
Creek.destroy_all
User.destroy_all
Category.destroy_all

puts "Create categories"

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587392/img%20projet/food/burrito-chicken-delicious-dinner-461198_fvq4mc.jpg')
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
photo = Category.new(name:"Photo")
photo.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
photo.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587390/img%20projet/sport/happy-girlfriends-exercising-on-mat-on-grass-in-daylight-4127339_jwpu5m.jpg')
sophrologie = Category.new(name:"Sophrologie")
sophrologie.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
sophrologie.save!

puts "Create users"

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587574/Yohann_ijpwd5.jpg')
user = User.new(username:"Calvin", email:"calvin@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587573/Romain_afggqe.jpg')
user = User.new(username:"Dylan", email:"dylan@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587572/Romain_1_pgmuja.jpg')
user = User.new(username:"Charles", email:"charles@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587573/Valentine_2_ozloxm.jpg')
camille = User.new(username:"Camille", email:"camille@gmail.com", password:"secret", role: 1, category:fitness, description: "Passionnée de photographie, je vous apprendrai tous mes trucs et astuces pour tirer le meilleur de votre appareil photo !")
camille.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
camille.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587572/Pauline_cxattz.jpg')
anna = User.new(username:"Anna", email:"anna@gmail.com", password:"secret", role: 1, category:sophrologie, description: "On se calme, on se détend et on médite avec moi.")
anna.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
anna.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587572/Mathiueu_2_mhnlrx.jpg')
marcel = User.new(username:"Marcel", email:"marcel@gmail.com", password:"secret", role: 1, category:meditation, description: "J'ai débuté ma formation en tant que mindfulness teacher au fin fond du Tibet avec les moines du temple Ying...")
marcel.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
marcel.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587387/img%20projet/an3uwrjvpaf86kp9cwpr.jpg')
julie = User.new(username:"Julie", email:"julie@gmail.com", password:"secret", role: 1, category:fitness, description: "Avec moi vous allez découvrir le plaisir de transpirer ;)")
julie.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
julie.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587393/img%20projet/Avatars/damir-spanic-rHDK3UU7HUw-unsplash_atfvky.jpg')
kevin = User.new(username:"Kevin", email:"kevin@gmail.com", password:"secret", role: 1, category:fitness, description: "Je suis professeur de boxe depuis 15 ans, grand passionné de ma discipline !")
kevin.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
kevin.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587392/img%20projet/Avatars/a-chef-in-red-apron-with-a-smile-on-his-face-3351927_dexkxh.jpg')
emma = User.new(username:"Emmannuel", email:"emma@gmail.com", password:"secret", role: 1, category:food, description: "Ancien chef dans un restaurant deux étoiles, j'adore partager ma passion pour la cuisine en live !")
emma.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
emma.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587569/Charles-Henri_2_ejgakx.jpg')
user = User.new(username:"Michel", email:"michel@gmail.com", password:"secret")
user.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
user.save!

puts "create creeks"

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587389/img%20projet/sport/man-doing-yoga-2294363_xcaldb.jpg')
creek = Creek.new(title: "Découvrez votre ying", description:"Nous allons développer dans un premier temps notre ying et dans un second temps nous accorderons une attention particulière à notre yang intérieur...", scheduledStartTime:"2020-07-29T05:06:07.0Z", price:10, user:marcel, capacity:20, duration:30, category:meditation)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587393/img%20projet/food/young-man-grilling-meat-in-camp-4311067_gcxbmo.jpg')
creek = Creek.new(title: "Des burritos pas bourratifs", description:"Tout, tout, vous saurez tout sur les burritos !", scheduledStartTime:"2020-07-30T05:06:07.0Z", price:15, user:emma, capacity:10, duration:50, category:food)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587391/img%20projet/sport/person-holding-barbell-841130_id5dhr.jpg')
creek = Creek.new(title: "Fitness Ultimate", description:"Une nouvelle façon de garder la forme en répétant des postures de combat et en s'affrontant soi-même.", scheduledStartTime:"2020-07-29T05:06:07.0Z", price:8, user:kevin, capacity:300, duration:40, category:fitness)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

file = URI.open('https://res.cloudinary.com/domm9vey9/image/upload/v1593587390/img%20projet/Photography/photo-of-man-holding-a-camera-1567730_a7k72k.jpg')
creek = Creek.new(title: "Selfie like a boss", description:"Les meilleurs réglages et lumières pour prendre des selfies comme une influenceuse.", scheduledStartTime:"2020-07-01T05:06:07.0Z", price:10, user:camille, capacity:60, duration:60, category:photo)
creek.photo.attach(io: file, filename: 'bob.jpg', content_type: 'image/jpg')
creek.save!

puts "We seed like a boss"
