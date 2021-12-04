class OrdersController < ApplicationController
	before_action :authenticate_user!
	
  def index
	 @orders = current_user.orders
  end
	
  def create
	  order = Order.create(user_id: current_user.id)
	  
	  carts = Cart.where(id: params[:cart_id])
	  
	  carts.each do |cart|
		  order.order_items.create(pack_id: cart.pack.id, quantity: cart.quantity)
	  end
	  
	  # carts.destroy_all
	  
	  redirect_to "/orders/#{order.id}"
  end

  def show
	  @order = Order.find(params[:id])
  end
end
