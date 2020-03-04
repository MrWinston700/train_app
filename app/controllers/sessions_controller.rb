require 'securerandom'
class SessionsController < ApplicationController
    def home  
      @routes = TrainRoute.all   
    end
  
    def new
      @error = nil
      @user = User.new
    end
  
    def create
      if request.env['omniauth.auth'] != nil
        @user = User.find_by(name: request.env['omniauth.auth']['info']['name'])
          
        @user = User.create(name: request.env['omniauth.auth']['info']['name'], password: SecureRandom.hex) unless @user !=nil
        log_in @user 
        redirect_to user_path(@user)
      else
        @user = User.find_by(name: params[:name])
        
          if @user && @user.authenticate(params[:password])
            log_in @user 
            redirect_to user_path(@user)
          else
            @error = "could not log in. user or password is invalid"
            render 'sessions/new'
          end
      end
    end
  
  
    def destroy
      log_out
      redirect_to root_path '/'
    end
end
