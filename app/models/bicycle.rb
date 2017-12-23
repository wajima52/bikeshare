class Bicycle < ApplicationRecord
    
 mount_uploader :image, ImageUploader

 belongs_to :user
 
 validates :user_id, presence: true
 
  has_many :relationships, foreign_key: "rental_bicycle"
  has_many :applicants, through: :relationships, source: :user
  
  has_many :matchings
  has_many :borrowers, through: :matchings, source: :borrower
  
  
  def applicant(user)
      self.relationships.find_by(user_id: user.id)
  end
  
  
  def applicant?(user)
      self.applicants.include?(user)
  end
  
  def borrower(user)
   self.matchings.find_by(borrower_id: user.id)
  end
  
#accepts_nested_attributes_for :matchings, allow_destroy: true

end
