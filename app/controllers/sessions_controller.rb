class SessionsController < ApplicationController
    def home     
    end
  
    def new
      @user = User.new
    end
  
    def create
      if request.env['omniauth.auth'] != nil
        @user = User.find_by(name: request.env['omniauth.auth']['info']['name'])
      else
        @user = User.find_by(name: params[:name])
      end
      
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
