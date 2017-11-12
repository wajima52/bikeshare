class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :rental_bicycle, class_name: 'Bicycle'
  
  validates :user_id, presence: true
  validates :rental_bicycle_id, presence: true
end
