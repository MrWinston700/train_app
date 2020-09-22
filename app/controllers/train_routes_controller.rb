class TrainRoutesController < ApplicationController

    def new 
        if params[:train_id]
            @train = Train.find_by_id(params[:train_id])
            @train_route = @train.train_routes.build
        end
    end

    def create
        @train_route = TrainRoute.new(train_route_params)
        if params[:train_route][:train_id]
            @train_id = params[:train_route][:train_id].to_i
            @train = Train.find_by_id(@train_id)
            @train.train_routes << @train_route
            current_user.train_routes << @train_route 
            current_user.save
        end
        
        
        
        redirect_to user_path(current_user)

    end

    def save
        @train_route = TrainRoute.find_by(id: params[:route_id])
        current_user.train_routes << @train_route 
        current_user.save
        @booking_alert = true

        redirect_to user_path(current_user)
    end

    def destroy
        @train_route = TrainRoute.find_by(id: params[:id])
        @train_route.delete
        redirect_to user_path(current_user)
    end

    def edit
        @train_route = TrainRoute.find_by(id: params[:id]) 
    end

    def update
        if @train_route.valid?
            @train_route.save
            redirect_to user_path(current_user)
        else
            
        end
    end

    def index
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
