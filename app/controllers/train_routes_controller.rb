class TrainRoutesController < ApplicationController
    @@temp_train_id = nil
    def new
        @train_route = TrainRoute.new

        #the code below is to capture to the train id while it's being rendered in the new nested route url. It's in an if params due to fact that we have varied way of creating new train routes
        if params
            @@temp_train_id = params[:train_id]
         end
         binding.pry
        render :new

        
    end

    def create

        @train_route = TrainRoute.new(train_route_params)
        # refer to comment above
        if @@temp_train_id != nil
            @train = Train.find_by_id(@@temp_train_id)
            @train.train_routes << @train_route
            @train.save
            @@temp_train_id = nil
            current_user.train_routes << @train_route 
            current_user.save
        else
            current_user.train_routes << @train_route 
            current_user.save
        end
        #because render is being used, sessions/home view does not have access to the sessions controller. That's why we have @routes below
        @routes = TrainRoute.all
        render 'sessions/home'

    end

    def save
        @train_route = TrainRoute.find_by(id: params[:route_id])
        current_user.train_routes << @train_route 
        current_user.save
        @booking_alert = true

        @routes = TrainRoute.all
        render 'sessions/home'
        binding.pry
    end

    def destroy
        @train_route = TrainRoute.find_by(id: params[:id])
        @train_route.delete
        redirect_to root_path
    end

    def edit
        @train_route = TrainRoute.find_by(id: params[:id])
        
        
    end

    def update
        if @train_route.valid?
            @train_route.save
            redirect_to user_path(@train.user)
        else
            
        end
    end

    def index
        binding.pry
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @train_routes = @user.train_routes
        else
            @train_routes = TrainRoute.all
        end
    end

    def train_route_params
        params.require(:train_route).permit(:departing, :destination, :train_id)
    end
end
