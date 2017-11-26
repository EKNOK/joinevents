class Event < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: {maximum: 24}
  validates :content, presence: true, length: { maximum: 255 }
  # validates :image, presence: true
  validates :pick, presence: true
  # validates :term, presence: true
  validates :user_id, presence: true
end

