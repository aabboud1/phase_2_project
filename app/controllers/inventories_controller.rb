class InventoriesController < ApplicationController
    def new
        @inventory = Inventory.new
    end

    def create
        @inventory = Inventory.new(strong_params)
        @existing_inventory = Inventory.find_by(store_id: params[:inventory][:store_id], product_id: params[:inventory][:product_id])

        if @inventory.valid? && !!@existing_inventory[:quantity]
            @inventory.save
            @existing_inventory.increase_quantity(@inventory.quantity)
            redirect_to product_path(@inventory.product_id)
        else
            #error message stuff here
            #need to make custom error messages for !!@inventory[:quantity]
                #and @inventory[:quantity] > 0
            render :new
            #redirect_to(new_purchase_path)
        end
        # existing_inventory = Inventory.find_by(product_id: params[:inventory][:product_id], store_id: params[:inventory][:store_id])

        # #basically, we're not validating IN THE INVENTORY CLASS whether this new inventory is unique
        # #this way, if it ISN'T unique, we can just add the quantity change to our existing inventory, instead of throwing an error
        # if existing_inventory != nil
        #     existing_inventory.increase_quantity(params[:inventory][:quantity])
        #     redirect_to(store_path(existing_inventory.store_id))
        # else
        #     @inventory = Inventory.new(strong_params)
        #     if @inventory.save
        #         redirect_to(store_path(@inventory.store_id))
        #     else
        #         render :new
        #     end
        # end
    end

    def edit
    end

    def update
    end

    private
    def strong_params
        params.require(:inventory).permit(:store_id, :product_id, :quantity)
    end
end
