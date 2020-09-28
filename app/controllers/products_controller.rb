class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(strong_params)
        if @product.save
            redirect_to(product_path(@product))
        else
            render :new
        end
    end

    private
    def strong_params
        params.require(:product).permit(:name, :price, :type_of_product, store_ids:[])
    end
end
