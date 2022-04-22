class PagesController < ApplicationController

#GET INDEX
def index
    @feeds = Post.all
    @name  = Post.joins(:user).select('users.user_name, posts.post_content').where("user_id = posts.user_id")

end
    

end