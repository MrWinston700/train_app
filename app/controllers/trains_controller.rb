class TrainsController < ApplicationController
    
    def new 
        @train = Train.new
    end

    def create
        @train = Train.create(train_params)
        redirect_to root_path
    end

    def edit
        @train = Train.find_by_id(params[:id])
        
        if @train.valid?
            @train.save
            redirect_to user_path(@train.user)
        else
            render 
        end
    end

    def show 
        @train = Train.find_by_id(params[:id])
        
    end

    def destroy
        @train = Train.find_by(id: params[:id])
        @train.delete 
        redirect_to user_path
    end

    private

    def train_params
        params.require(:train).permit(:ident_number, :model, :max_pax, train_routes_attributes: [:destination, :departing, :train_id])
    end
end