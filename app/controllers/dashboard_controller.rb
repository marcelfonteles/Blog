class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def index
        @posts = Post.all
        @comments = Comment.all
        @users = User.all
    end
end
