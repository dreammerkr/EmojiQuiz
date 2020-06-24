class UsersController < ApplicationController

    def create
        user = User.new(email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation])
        user.save!
        redirect_to index_path
    end
    
    def profile
        @user = current_user
        if session[:random].nil?
            @score = 0
        else
            @score = session[:random]
        end
    end
    
    def myrandom
        @user = current_user
    end
end
