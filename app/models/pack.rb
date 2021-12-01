class Pack < ApplicationRecord
	has_one_attached :image
	
	validates :product_name, :company_name, :price, presence: true
	validates :is_publish, inclusion: [true, false]
	
	scope :published, -> {Pack.where(is_publish: true)}
	scope :unpublished, -> {Pack.where(is_publish: false)}
	
	has_many :carts, dependent: :destroy
	has_many :users, through: :carts
	
	def self.set_dummy_datas
	  20.times do
		Pack.create(
			product_name: Faker::Food.unique.dish,
			company_name: Faker::Company.unique.name,
			price: Faker::Commerce.price(range: 5000..50000, as_string: true),
			desc: Faker::Food.description
			)
	    end
	end
end
