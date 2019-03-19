class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def index
        @posts = Post.all.sort_by {|post| post.comments.count}.reverse
        @comments = Comment.all
        @users = User.all
    end
end
