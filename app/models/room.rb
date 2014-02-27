class Room < ActiveRecord::Base
	has_many :comments #, :as => :commentable

	validates :title, length: {maximum: 30}
end
