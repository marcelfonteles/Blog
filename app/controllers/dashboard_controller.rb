class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def index
        @posts = Post.all.sort_by {|post| post.comments.count}.reverse
        @comments = Comment.all
        @users = User.all
    end
    
    def all_posts
        @posts = Post.all.sort_by {|post| post.created_at}.reverse
    end
    
    def edit_post
        @post = Post.find(params[:id])
    end
end
