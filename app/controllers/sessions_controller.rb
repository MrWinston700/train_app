class SessionsController < ApplicationController
    def home     
    end
  
    def new
      @user = User.new
      binding.pry
    end
  
    def create
    
      @user = User.find_by(name: params[:user][:name])
      binding.pry
      if @user && @user.authenticate(params[:user][:password])
        log_in @user 
        redirect_to user_path(@user)
      else
        flash[:error] = 'Invalid name and/or password combination'
        redirect_to signin_path
      end
    end
  
  
    def destroy
      log_out
      redirect_to root_path '/'
    end
end
