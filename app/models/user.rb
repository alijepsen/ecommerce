class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :categories
  validates_presence_of :first_name, :last_name

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		name_arr = auth.info.name.split(" ")
  		user.first_name = name_arr[0]
  		user.last_name = name_arr[1]
  		user.password = Devise.friendly_token
  	end
  end

end
