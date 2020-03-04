class TrainRoutesController < ApplicationController
    def create
        
        @train_route = TrainRoute.find_by(id: params[:route_id])
        binding.pry
    end
end
