class PurchasesController < ApplicationController
    
    before_action :authorized
    
    def new
        if params[:format]
            @inventory = Inventory.find(params[:format])
            @purchase = Purchase.new(store_id: @inventory[:store_id], product_id: @inventory[:product_id], customer_id: session[:customer_id])
        else
            @purchase = Purchase.new
        end
    end
    
    def create
        #the cost param equals the purchase product's price
        params[:purchase][:cost] = Product.find(params[:purchase][:product_id]).price
        @purchase = Purchase.new(purchase_params)
        @inventory = Inventory.find_by(store_id: params[:purchase][:store_id], product_id: params[:purchase][:product_id])
        customer = @purchase.customer
        if @purchase.valid? && !!@inventory[:quantity] && @inventory[:quantity] > 0
            if customer.balance >= @purchase.cost
                @purchase.save
                #byebug
                customer.make_purchase(@purchase.cost)
                @inventory.decrease_quantity
                redirect_to customer_path(customer)
            else
                @purchase.errors.add(:insufficient, "Funds to Purchase")
                render :new
            end
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
        params.require(:purchase).permit(:customer_id, :product_id, :store_id, :cost)
    end
    
end
