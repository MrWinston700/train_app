class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if @user 
            @user = User.create(user_params) 

        else 
            render new_user_path
        end
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def update

    end 

    def show 
        @user = User.find(params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
