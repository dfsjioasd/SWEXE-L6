class CartsController < ApplicationController
    def show
        @carts = Cart.find(params[:id]).cart_items
    end
end
