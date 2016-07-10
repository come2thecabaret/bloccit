class FavoriteMailer < ApplicationMailer
  default from: "youremail@email.com"


   def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"

     @user = user
     @post = post
     @comment = comment

     mail(to: [user.email, 'come2thecabaret@gmail.com'], subject: "New comment on #{post.title}")
   end

   def new_post(user, post)
     headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"

     @user = user
     @post = post

     mail(to: [user.email], subject: "You have favorited your new post: #{post.title} and will receive notifications of new comments!")   
   end
 end
