class CustomersController < ApplicationController

    def show
        @customer = Customer.find(params[:id])
        # @customer.purchases.map {|f| f.product_id} 
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            redirect_to products_path # customer home page, or purchase page
        else
            render :new
        end
    end


    private

    def customer_params
        params.require(:customer).permit(:name, :birth_year)
    end
end
