class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness:true
	def password=(value)
		self.password_digest = Encypter.encrypt(value)
	end
end
