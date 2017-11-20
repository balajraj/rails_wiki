class Article < ActiveRecord::Base
	belongs_to :user 
	validates :title, presence:true,
	          length: { maximum: 100}
	validates :language , presence:true,
	          length: { maximum: 20 }
	validates :content, presence:true,
	          length: {maximum: 2147483647}                    
end
