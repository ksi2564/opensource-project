class CartsController < ApplicationController
  before_action :authenticate_user!
	
  def index
	@carts = current_user.carts
  end
  
  def create
    Cart.create(
	  pack_id: params[:pack_id],
	  user_id: current_user.id,
	  quantity: params[:quantity]
	)
	  
	redirect_back(fallback_location: root_path)
  end
end
