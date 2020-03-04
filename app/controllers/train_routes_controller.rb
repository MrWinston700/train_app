class TrainRoutesController < ApplicationController
    def create
        @train_route = TrainRoute.find_by(id: params[:route_id])
        current_user.train_routes << @train_route 

        redirect_to user_path(current_user)
    end
end
