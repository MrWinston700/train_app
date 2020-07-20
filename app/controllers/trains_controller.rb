class TrainsController < ApplicationController
    
    def new 
        @train = Train.new
    end

    def create
        @train = Train.new(train_params)
        if @train.valid?
            @train.save
            redirect_to root_path
        else
            render new_train_path
        end
    end

    def edit
        @train = Train.find_by_id(params[:id])
    end

    def update
        @train = Train.find_by_id(params[:id])
        
        if @train.valid?
            @train.update(train_params)
            @train.save
            redirect_to root_path
        else
            render edit_train_path
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
        params.require(:train).permit(:ident_number, :model, :max_pax, train_routes_attributes: [:destination, :departing, :user_id])
    end
end