class Employee < ApplicationRecord
  belongs_to :user
 
  belongs_to :department
  belongs_to :position
 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  
  before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :empid, presence: true, length: { maximum: 5 }
    validates :doj, presence: true, length: { maximum: 15 }
    validates :department_id, presence: true, length: { maximum: 25 }
    validates :position_id, presence: true, length: { maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
end
