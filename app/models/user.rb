class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false }

  # has_one :shopping_cart, dependent: :destroy
  # has_many :shopping_lists, dependent: :destroy
  # has_many :transactions, dependent: :destroy

end
