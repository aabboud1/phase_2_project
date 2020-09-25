class PurchasesController < ApplicationController
    def new
        # @inventory = Inventory.find(params[:format])
        # @purchase = Purchase.new(store_id: @inventory[:store_id], product_id: @inventory[:product_id])
        @purchase = Purchase.new
    end
    
    def create
        #throwing error, need to make strong params and pass them possibly take off inventroy and inven.find
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


    private
    
end
