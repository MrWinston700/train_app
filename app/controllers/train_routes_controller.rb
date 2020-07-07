class TrainRoutesController < ApplicationController
    @@my_id = nil
    def new
        @train_route = TrainRoute.new
        render :new
        if params
            @@my_id = params[:train_id]
        end
    end

    def create
        @train_route = TrainRoute.new(train_route_params)
        if @@my_id != nil
            @train = Train.find_by_id(@@my_id)
            @train.train_routes << @train_route
            @train.save
            @@my_id = nil
            current_user.train_routes << @train_route 
            current_user.save
        else
        current_user.train_routes << @train_route 
        current_user.save
        end
        redirect_to root_path
    end

    def save
        @train_route = TrainRoute.find_by(id: params[:route_id])
        current_user.train_routes << @train_route 
        current_user.save
        redirect_to root_path
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
        @user = User.find_by(id: params[:user_id])
        @train_routes = @user.train_routes
    end

    def train_route_params
        params.require(:train_route).permit(:departing, :destination, :train_id)
    end
end
