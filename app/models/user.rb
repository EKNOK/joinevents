class User < ApplicationRecord
  validates :name, presence: {message: "入力してください"}, length: { maximum: 50 }
  validates :email, presence: {message: "入力してください"}, length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :events
  
  has_many :joins
  has_many :events, through: :joins
  has_many :goes 
  has_many :go_events, through: :goes, class_name: 'Event', source: :event
  
  
  def go(event)
    self.goes.find_or_create_by(event_id: event.id)
  end
  
  def ungo(event)
    go = self.goes.find_by(event_id: event.id)
    go.destroy if event
  end
  
  def go?(event)
    self.go_events.include?(event)
  end
end
