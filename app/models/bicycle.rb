class Bicycle < ApplicationRecord
    
 mount_uploader :image, ImageUploader

 belongs_to :user
 
 validates :user_id, presence: true
 
  has_many :relationships, foreign_key: "rental_bicycle"
  has_many :applicants, through: :relationships, source: :user
  
  has_many :matchings
  has_many :borrowers, through: :matchings, source: :borrower
  has_many :renters, through: :matchings, source: :renter
  has_many :return_messages, through: :matchings, source: :return_message
  has_many :reverce_of_matchings, class_name: 'Matchings', foreign_key: 'bicycle_id'
  
  
  def applicant(user)
      self.relationships.find_by(user_id: user.id)
  end
  
  
  def applicant?(user)
      self.applicants.include?(user)
  end
  
  def borrower(user)
   self.matchings.find_by(borrower_id: user.id)
  end

  def borrowing?
    self.borrower.include?(current_user)
  end
#accepts_nested_attributes_for :matchings, allow_destroy: true

end
