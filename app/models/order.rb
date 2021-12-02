class Order < ApplicationRecord
  belongs_to :user
	
  has_many :order_items, dependent: :destroy
  has_many :packs, through: :order_items
	
  enum status: [:before_payment, :processed, :completed, :failed]
end
