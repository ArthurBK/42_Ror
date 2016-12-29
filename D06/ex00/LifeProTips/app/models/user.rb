class User < ActiveRecord::Base
	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true, length: {minimum: 8}
	validates_confirmation_of :password_digest
	
	def self.authentificate(email, password_digest)
		user = find_by_email(email)
		if user && user.password_digest == password_digest
			user			
		end
	end

end
