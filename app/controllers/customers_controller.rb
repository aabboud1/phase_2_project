class CustomersController < ApplicationController

    def show
        @customer = Customer.find(params[:id])
        
    end

    def new
        @cutomer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            redirect_to inventories_path # customer home page, or purchase page
        else
            render :new
        end
    end


    private

    def customer_params
        params.require(:customer).permit(:name, :birth_year)
    end
end
