class TrainRoutesController < ApplicationController
    def create
        @train_route = TrainRoute.find_by(id: params[:route_id])
        current_user.train_routes << @train_route 

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
            render
        end
    end
end
