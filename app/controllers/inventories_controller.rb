class InventoriesController < ApplicationController
    
    before_action :manager_authorized
    
    def new
        if params[:format]
            @store = Store.find(params[:format])
            @inventory = Inventory.new(store_id: @store.id)
        else
            #MAKE IT THROW AN ERROR IF WE DON'T INCLUDE A STORE
            @inventory = Inventory.new
        end
    end

    def create
        @inventory = Inventory.new(strong_params)
        @existing_inventory = Inventory.find_by(store_id: params[:inventory][:store_id], product_id: params[:inventory][:product_id])
        #if we already have an inventory with our current inventory's params

        if @inventory.valid? #if we made a valid inventory
            if @existing_inventory #if our check for existing inventory came up with something
                @existing_inventory.increase_quantity(@inventory.quantity) #instead of making a new inventory item, we'll add the quantity to our existing inventory item
                redirect_to product_path(@existing_inventory.product_id)
            else
                @inventory.save
                redirect_to product_path(@inventory.product_id)
            end
        else
            #error message stuff here
            #need to make custom error messages for !!@inventory[:quantity]
                #and @inventory[:quantity] > 0
            render :new
            #redirect_to(new_purchase_path)
        end
    end

    def edit
        @inventory = Inventory.find(params[:id])
    end

    def update
        @inventory = Inventory.find(params[:id])
        @inventory.update(strong_params)
        # @existing_inventory = Inventory.find_by(store_id: params[:inventory][:store_id], product_id: params[:inventory][:product_id])

        if @inventory.valid? #&& !!@existing_inventory[:quantity]
            
            # @existing_inventory.increase_quantity(@inventory.quantity)
            @inventory.save
            redirect_to product_path(@inventory.product_id)
        else
            #error message stuff here
            #need to make custom error messages for !!@inventory[:quantity]
                #and @inventory[:quantity] > 0
            render :edit
            #redirect_to(new_purchase_path)
        end
    end


    private
    def strong_params
        params.require(:inventory).permit(:store_id, :product_id, :quantity)
    end

end
