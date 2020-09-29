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
            session[:customer_id] = @customer.id
            redirect_to products_path # customer home page, or purchase page
        else
            render :new
        end
    end

    #see 24-authorization for more info
    def login
        render :login_form
    end

    def process_login
        customer = Customer.find_by(name: params[:name])
        if customer #&& user.authenticate(params[:password])
            session[:customer_id] = customer.id
            redirect_to(products_path)
        else
            flash.now[:no_user] = "Check your name is spelt correctly."
            render :login_form
        end
    end

    def logout
        session.clear
        flash[:message] = "You have been logged out."
        redirect_to login_path
    end


    private

    def customer_params
        params.require(:customer).permit(:name, :birth_year, :balance, :password)
    end
end
