class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :trackable, :validatable

  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false }

  has_one :shopping_cart, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :transactions, dependent: :destroy

=======
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook], authentication_keys: [:login]

   def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.first_name = auth.info.first_name
     user.last_name = auth.info.last_name
     #  user.name = auth.info.name   # assuming the user model has a name
     #  user.image = auth.info.image # assuming the user model has an image
     # If you are using confirmable and the provider(s) you use validate emails,
     # uncomment the line below to skip the confirmation emails.
     # user.skip_confirmation!
     end
   end
>>>>>>> Add facebook omniauth
end
