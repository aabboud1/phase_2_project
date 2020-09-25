class PurchasesController < ApplicationController
    def create
        @purchase = Purchase.create(
            customer_id: params[:purchase][:customer_id],
            product_id: params[:purchase][:product_id],
            store_id: params[:purchase][:store_id]
            )
        Inventory.find_by(params[:purchase][:store_id], params[:purchase][:product_id].quantity).quantity -= 1
    end
end
