class Matching < ApplicationRecord
  belongs_to :renter, class_name: 'User', optional: true
  belongs_to :borrower, class_name: 'User', optional: true
  
  belongs_to :bicycle
  
  validates :borrower_id, presence: true
  validates :bicycle_id, presence: true
  validates :return_message, length: { maximum: 30}
end
