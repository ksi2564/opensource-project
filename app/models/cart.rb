class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :pack
	
  def verified_save
	  cart = 
	  sample_carts = user.carts # current_user replace
	  
	# 기존에 장바구니에 상품이 있는지 확인하는 과정
	remain_cart = sample_carts.find_by(pack_id: pack_id)
	  
	if remain_cart.present?
		sum_quantity = remain_cart.quantity + quantity.to_i
		remain_cart.update(quantity: sum_quantity)
	else
		save
	end
  end
end
