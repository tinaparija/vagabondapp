class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true
	validates :password, length: {minimum: 6}

	has_many :posts, dependent: :destroy
	has_many :cities, through: :posts

	has_secure_password

	def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  	end

end
