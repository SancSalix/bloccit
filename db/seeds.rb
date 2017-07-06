require 'random_data'


 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 unique_post = Post.find_or_create_by!(title: "Testing post", body:"Shelby is testing posts")
 
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 unique_post.comments.find_or_create_by!(body: "Testing comments as well")
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"