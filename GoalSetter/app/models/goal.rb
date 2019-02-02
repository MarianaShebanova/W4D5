class Goal < ApplicationRecord

  validates :user_id, presence: true, uniqueness: true 
  validates :body, presence: true 

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 
  
end
