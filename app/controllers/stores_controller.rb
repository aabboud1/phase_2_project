class StoresController < ApplicationController
    
    before_action :manager_authorized, only: [ :owner_show]
    
    def show
        @store = Store.find(params[:id])
    end
    
    def owner_show
        @store = Store.find(params[:id])
    end

end
