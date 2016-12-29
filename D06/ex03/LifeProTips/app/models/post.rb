class Post < ActiveRecord::Base
	belongs_to :user
	validates_associated :user
	validates :title, uniqueness: true, length: {minimum: 3}
end
