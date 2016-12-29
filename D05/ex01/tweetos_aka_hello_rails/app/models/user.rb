class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :cuicuis
  validates :email, format:
  { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :id, presence: true
end
