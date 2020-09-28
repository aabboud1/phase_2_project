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
        @inventory = Inventory.find_by(store_id: params[:purchase][:store_id], product_id: params[:purchase][:product_id])

        if @purchase.valid? && !!@inventory[:quantity] && @inventory[:quantity] > 0 
            @purchase.save
            @inventory.decrease_quantity
            redirect_to customer_path(@purchase.customer)
        else
            #error message stuff here
            #need to make custom error messages for !!@inventory[:quantity]
                #and @inventory[:quantity] > 0
            render :new
            #redirect_to(new_purchase_path)
        end


    end


    private

    def purchase_params
        params.require(:purchase).permit(:customer_id, :product_id, :store_id)
    end
    
end
