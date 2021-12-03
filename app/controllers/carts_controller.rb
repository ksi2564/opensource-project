class CartsController < ApplicationController
  before_action :authenticate_user!
	
  def index
	@carts = current_user.carts
	  
	@products_price = 0
	@carts.each do |cart|
	@products_price += cart.quantity * cart.pack.price
	end
	  
	if @products_price < 40000
		@shipping_fee = 3000
	else
		@shipping_fee = 0
	end
	  
	@total_price = @products_price + @shipping_fee
  end
  
  def create
    cart = Cart.new(
	  pack_id: params[:pack_id],
	  user_id: current_user.id,
	  quantity: params[:quantity]
	)
	  
	sample_carts = current_user.carts
	  
	# 기존에 장바구니에 상품이 있는지 확인하는 과정
	remain_cart = sample_carts.find_by(pack_id: params[:pack_id])
	  
	if remain_cart.present?
		sum_quantity = remain_cart.quantity + params[:quantity].to_i
		remain_cart.update(quantity: sum_quantity)
	else
		cart.save
	end
	  
    flash[:notice] = "장바구니에 상품을 담았습니다."
	  
	redirect_back(fallback_location: root_path)
  end
	
  def destroy
	cart = Cart.find(params[:id])
	  
	cart.destroy
	redirect_back(fallback_location: root_path)
  end
end
