require "open-uri"

class Pack < ApplicationRecord
	has_one_attached :image
	
	validates :product_name, :company_name, :price, presence: true
	validates :is_publish, inclusion: [true, false]
	
	scope :published, -> {Pack.where(is_publish: true)}
	scope :unpublished, -> {Pack.where(is_publish: false)}
	
	has_many :carts, dependent: :destroy
	has_many :users, through: :carts
	
	has_many :order_items, dependent: :destroy
	has_many :orders, through: :order_items
	
	def self.set_dummy_datas
	  50.times do |i|
		pack = Pack.new(
			product_name: Faker::Food.unique.dish,
			company_name: Faker::Company.unique.name,
			price: Faker::Commerce.price(range: 5000..50000, as_string: true),
			desc: Faker::Food.description
			)
		
		sample_image = open("https://loremflickr.com/320/240/food?random=#{i}")
		  
		pack.image.attach(io: sample_image, filename: "sample_#{i}.jpg")
		pack.save
	    end
	end
end
