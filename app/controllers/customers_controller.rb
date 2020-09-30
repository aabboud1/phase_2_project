class CustomersController < ApplicationController

    def show
        @customer = Customer.find(params[:id])
        # @customer.purchases.map {|f| f.product_id} 
    end

    def new
        @customer = Customer.new
    end

    def create
        manager_code = params[:customer][:manager_of_store_id] #if we inputted an id to prove we're manager of a store
        if manager_code != nil
            store = Store.find_by(manager_code: manager_code) #check to see if any store has the manager code we inputted
            if store != nil #if any of those stores actually did have that code
                params[:customer][:manager_of_store_id] = store[:id] #save what store id we're a manager over
            else
                params[:customer][:manager_of_store_id] = nil #we are not a manager
            end
        else
            params[:customer][:manager_of_store_id] = nil #we are not a manager
        end

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
        if !logged_in? #if we aren't logged in, go to login page
            render :login_form
        else
            flash[:message] = "You're already logged in!"
            redirect_to homepage_path
        end
    end

    def process_login
        customer = Customer.find_by(name: params[:name])
        if customer && customer.authenticate(params[:password])
            session[:customer_id] = customer.id
            redirect_to(homepage_path)
        else
            flash.now[:no_user] = "Check your name or password is spelt correctly."
            render :login_form
        end
    end

    def logout
        session.clear
        flash[:message] = "You have been logged out."
        redirect_to homepage_path
    end

    def homepage
    end


    private

    def customer_params
        params.require(:customer).permit(:name, :birth_year, :balance, :password, :manager_of_store_id)
    end
end
