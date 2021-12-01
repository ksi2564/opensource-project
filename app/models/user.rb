class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, length: { minimum: 2 }
  validates :phone, length: { is: 11 }
  validates :post_code, length: { is: 5 }, allow_nil: true
end
