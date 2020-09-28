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
        #throwing error, need to make strong params and pass them possibly take off inventroy and inven.find
        
        @purchase = Purchase.new
        inventory = Inventory.find_by(params[:purchase][:store_id], params[:purchase][:product_id])
        if @purchase.save && inventory.quantity > 0 
            @purchase = Purchase.save(purchase_params)
            Inventory.find_by(params[:purchase][:store_id], params[:purchase][:product_id].quantity).quantity -= 1
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
