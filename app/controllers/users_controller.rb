class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if @user 
            @user.create(user_params) 
        else 
            render new_user_path
        end
    end 

    def edit 
        @user.find(params[:id])
    end 

    def update
        
    end 

    private 

    def user_params
    end
end
