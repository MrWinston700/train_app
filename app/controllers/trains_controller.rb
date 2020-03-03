class TrainsController < ApplicationController
    
    def new 
        @train = Train.new
    end

    def create
        @train = Train.create(train_params)
        
        #binding.pry
        redirect_to user_path(current_user)
  end

    end

    private

    def train_params
        params.require(:train).permit(:ident_number, :model, :max_pax, routes_attributes: [:destination, :departing, :train_id])
    end
end