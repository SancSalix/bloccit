class FavoriteMailer < ApplicationMailer
    default from: "shelbcoleman@gmail.com"
    
    def new_comment(user, post, comment)
     headers["Message-ID"] = "<comments/#{comment.id}@https://obscure-anchorage-28821.herokuapp>"
     headers["In-Reply-To"] = "<post/#{post.id}@https://obscure-anchorage-28821.herokuapp>"
     headers["References"] = "<post/#{post.id}@https://obscure-anchorage-28821.herokuapp>"
 
     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}")
    end
    
    def new_post(post)
     headers["Message-ID"] = "<posts/#{post.id}@https://obscure-anchorage-28821.herokuapp>"
     headers["In-Reply-To"] = "<post/#{post.id}@https://obscure-anchorage-28821.herokuapp>"
     headers["References"] = "<post/#{post.id}@https://obscure-anchorage-28821.herokuapp>"
 
     @post = post

     mail(to: post.user.email, subject: "New post #{post.title}")
    end
end
