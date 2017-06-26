class User < ApplicationRecord
	has_secure_password
	has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
	has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
	has_many :unread_messages, -> {where(read_at: nil)}
	validates :email, presence: true, uniqueness:true
	#def password=(value)
	#	self.password_digest = Encypter.encrypt(value)
	#end
	def to_s
		email
	end
	def received_messages
		Message.where(sender_id: id)
	end
	def unread_messages
		received_messages.where(read_at: nil)
	end
end
