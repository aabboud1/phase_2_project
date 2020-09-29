class InventoriesController < ApplicationController
    def new
    end
    
    def create
    end

    def edit
        @inventory = Inventory.find(params[:id])
    end

    def update
        @inventory = Inventory.find(params[:id])
        @inventory.update(strong_params)
        @existing_inventory = Inventory.find_by(store_id: params[:inventory][:store_id], product_id: params[:inventory][:product_id])

        if @inventory.valid? #&& !!@existing_inventory[:quantity]
            @existing_inventory.increase_quantity(@inventory.quantity)
            @inventory.save
            redirect_to product_path(@inventory.product_id)
        else
            #error message stuff here
            #need to make custom error messages for !!@inventory[:quantity]
                #and @inventory[:quantity] > 0
            render :new
            #redirect_to(new_purchase_path)
        end
    end


    private
    def strong_params
        params.require(:inventory).permit(:store_id, :product_id, :quantity)
    end
end
