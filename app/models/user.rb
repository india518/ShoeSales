class User < ActiveRecord::Base
	CRAZY_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	has_many :products, :foreign_key => "seller_id"
	has_many :purchases, :class_name => "Product", :foreign_key => "buyer_id"

	validates :first_name, :last_name,
							:presence		=> true,
							:length			=> { :within => 1..50 }
	validates :email,
							:presence	=> true,
							:format => {
								:with	=> CRAZY_EMAIL_REGEX,
								:message	=> "Incorrect email format." },
							:uniqueness	=> {
								:case_sensitive => false }
	validates :password,
							:presence	=> true,
							:length		=> { :within => 6..40 }

	before_save { self.email = email.downcase } 
	has_secure_password

	def name
		"#{self.first_name} #{self.last_name}"
	end

	def sales
		self.products.where("buyer_id IS NOT NULL")
	end

	def available
		self.products.where(:buyer_id => nil)
	end

end
