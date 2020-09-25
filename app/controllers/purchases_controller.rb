class PurchasesController < ApplicationController
    def new
        @inventory = Inventory.find(params[:format])
        @purchase = Purchase.new(store_id: @inventory[:store_id], product_id: @inventory[:product_id])
    end
    
    def create
        inventory = Inventory.find_by(params[:purchase][:store_id], params[:purchase][:product_id].quantity)
        if inventory.quantity > 0
            @purchase = Purchase.create(
                customer_id: params[:purchase][:customer_id],
                product_id: params[:purchase][:product_id],
                store_id: params[:purchase][:store_id]
            )
            Inventory.find_by(params[:purchase][:store_id], params[:purchase][:product_id].quantity).quantity -= 1
        else
            #error message stuff here
            render :new
        end
    end
end
