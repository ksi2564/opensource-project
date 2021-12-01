class Pack < ApplicationRecord
	has_one_attached :image
	
	validates :product_name, :company_name, :price, presence: true
	validates :is_publish, inclusion: [true, false]
	
	scope :published, -> {Pack.where(is_publish: true)}
	scope :unpublished, -> {Pack.where(is_publish: false)}
end
