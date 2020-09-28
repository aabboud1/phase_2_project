class PurchasesController < ApplicationController
    def new
        if params[:format]
            @inventory = Inventory.find(params[:format])
            @purchase = Purchase.new(store_id: @inventory[:store_id], product_id: @inventory[:product_id])
        else
            @purchase = Purchase.new
        end
    end
    
    def create
        @purchase = Purchase.new(purchase_params)
        @inventory = Inventory.find_by(params[:purchase][:store_id], params[:purchase][:product_id])
        
        if @purchase.save && @inventory.quantity > 0 
            @purchase.save
            #checkout @inventory not decreasing 
            @inventory.quantity -= 1
            redirect_to customer_path(@purchase.customer)
        else
            #error message stuff here
            render :new
        end
    end


    private

    def purchase_params
        params.require(:purchase).permit(:customer_id, :product_id, :store_id)
    end
    
end
