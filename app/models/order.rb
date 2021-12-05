class Order < ApplicationRecord
  belongs_to :user
	
  has_many :order_items, dependent: :destroy
  has_many :packs, through: :order_items
	
  has_one :payment, dependent: :nullify
	
  enum status: [:before_payment, :processed, :completed, :failed, :cancelled]
	
    def product_price
	  result = 0
	  order_items.each do |order_item|
	  result += (order_item.quantity * order_item.pack.price)
    end
	  return result
  end	  

	
  def shipping_fee
	  if product_price > 40000
	    result = 0
	  else
	    result = 3000
	  end
	  return result
  end
	
  def total_price
	result = product_price + shipping_fee
	return result
  end
end
