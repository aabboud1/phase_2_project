class ApplicationController < ActionController::Base

    #see 24-authorization for more info

    helper_method :current_user, :current_user_name, :logged_in?

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
end
