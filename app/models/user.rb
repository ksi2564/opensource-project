class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, length: { minimum: 2 }
	
  has_many :carts, dependent: :destroy
  has_many :packs, through: :carts
	
  has_many :orders, dependent: :destroy
end
