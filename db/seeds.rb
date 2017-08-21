require 'random_data'


  5.times do
    User.create!(
    name:     Faker::Internet.user_name,
    email:    Faker::Internet.safe_email,
    password: Faker::Internet.password
    )
  end
 
 users = User.all


  15.times do
   Topic.create!(
     name:         Faker::Lovecraft.sentence,
     description:  Faker::Lovecraft.paragraph
   )
 end
 topics = Topic.all


 50.times do
   post = Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  Faker::Lovecraft.sentence,
     body:   Faker::Lovecraft.paragraph
   )
   post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
   rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
  end
 
 
 posts = Post.all
 

 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: Faker::Lovecraft.paragraph
   )
 end

  10.times do
   Advertisement.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_sentence,
     price: rand(10...500)
   )
 end
 
   15.times do
   Question.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_sentence,
     resolved: [true, false].sample
   )
 end
 
   30.times do
   SponsoredPost.create!(
     topic:  topics.sample,
     title: RandomData.random_sentence,
     body: RandomData.random_sentence,
     price: rand(10...500)
   )
 end
 
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 
  mod = User.create!(
   name:     'Mod User',
   email:    'mod@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} ads created"
 puts "#{Question.count} questions created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Vote.count} votes created"