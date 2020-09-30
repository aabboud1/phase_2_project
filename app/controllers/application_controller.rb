class ApplicationController < ActionController::Base

    #see 24-authorization for more info

    helper_method :current_user, :current_user_name, :logged_in?, :manager_authorized, :manager?

    def current_user
        Customer.find_by(id: session[:customer_id])
    end

    def current_user_name
        current_user.name
    end

    def logged_in?
        !!current_user
    end

    def authorized
        if !logged_in?
            flash[:message] = "You must be logged in to do that!"
            redirect_to login_path
        end
    end

    def manager_authorized
        if !manager? #if we aren't a manager
            flash[:message] = "You must be a manager to access this."
            redirect_to login_path
        end
    end

    def manager?
        logged_in? && current_user.manager_of_store_id != nil
        #will return true if we are logged in, & we are a manager of a store
    end
end
