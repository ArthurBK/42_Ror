class Cuicui < ActiveRecord::Base
  has_many :likes
  has_many :comments
  belongs_to :user, required: true
  has_many :users, through: :comments
  validates_uniqueness_of :user_id, scope: [:content]
  validates :id, presence: true, numericality: { only_integer: true }
  validates :content, presence: true
end
