class SessionsController < ApplicationController
    def home     
    end
  
    def new
      @user = User.new
    end
  
    def create
        binding.pry
      @user = User.find_by(name: params[:name])
      
      if @user && @user.authenticate(params[:password])
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
