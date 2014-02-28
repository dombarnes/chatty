class Room < ActiveRecord::Base
	has_many :comments #, :as => :commentable

	validates :title, length: {maximum: 30}

	before_create :generate_token

	def generate_token
      begin
        self.uid = SecureRandom.hex(3).downcase
      end while self.class.exists?(uid)
      # self.token = loop do
      #   random_token = SecureRandom.urlsafe_base64(nil, false)
      #   break random_token unless Room.exists?(token: random_token)
      # end
	end
end
