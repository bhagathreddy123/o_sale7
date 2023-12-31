class User < ApplicationRecord
	validates :first_name, :last_name, :email,  presence: true
	validates :email,
	  uniqueness: { case_sensitive: false },
	  format: {
	  	with: /\A[A-Z0-9#-_~!$&'()*+,;=:.]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	  }

	has_secure_password
	has_many :products, dependent: :destroy
	has_many :comments, dependent: :destroy
	before_save :downcase_email
	
	def fullname
		"#{first_name} #{last_name}"
	end

	private

	def downcase_email
		self.email.downcase!
	end
end
