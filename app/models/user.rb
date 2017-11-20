class User < ActiveRecord::Base 
	has_many :article
	validates :password, presence: true,
	           length:  { minimum: 8 }
	validates :email, presence: true
	validates :firstname, presence:true
	validates :lastname, presence:true           
end
