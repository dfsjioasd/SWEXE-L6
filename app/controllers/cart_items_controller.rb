class CartItemsController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        @citem = CartItem.new(product_id: params[:product_id])
    end
    
    def create
        @citem = CartItem.new(qty: params[:cart_item][:qty], product_id: params[:cart_item][:product_id], cart_id: session[:cart_id])
        if @citem.save
          flash[:notice] = "ツイートしました"
          redirect_to products_path
        else
          flash[:error] = @citem.errors.full_messages
          render new_product_path
        end
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_path(session[:cart_id])
    end
end
