class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook], authentication_keys: [:login]

  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :telephone, presence: true

  has_one :shopping_cart, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :transactions, dependent: :destroy

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.first_name = auth.info.name
     #  user.name = auth.info.name   # assuming the user model has a name
     #  user.image = auth.info.image # assuming the user model has an image
     # If you are using confirmable and the provider(s) you use validate emails,
     # uncomment the line below to skip the confirmation emails.
     # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.provider = "facebook"
        user.uid = data["id"] if user.uid.blank?
        user.email = data["email"] if user.email.blank?
        user.first_name = data["name"] if user.first_name.blank?
      end
    end
  end
end
