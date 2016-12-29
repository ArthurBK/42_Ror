class Comment < ActiveRecord::Base
  validates :id, presence: true, numericality: { only_integer: true }
  belongs_to :user, required: true
  belongs_to :cuicui, required: true
  validates :content, presence: true
  validates_uniqueness_of :user_id, scope: [:cuicui_id]
end
