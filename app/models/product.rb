class Product < ActiveRecord::Base
	belongs_to :seller, :class_name => "User"
	belongs_to :buyer, :class_name => "User"

	validates :model,	:brand,	:amount,		:presence	=> true

	def name
		"#{self.model} #{self.brand}"
	end
end
