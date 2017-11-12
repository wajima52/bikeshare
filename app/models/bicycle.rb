class Bicycle < ApplicationRecord
    
 mount_uploader :image, ImageUploader

 belongs_to :user
 
 validates :user_id, presence: true
 
  has_many :relationships, foreign_key: "rental_bicycle"
  has_many :applicants, through: :relationships, source: :user
  
  def applicant(user)
      self.relationships.find_by(user_id: user.id)
  end
  
  
  def applicant?(user)
      self.applicants.include?(user)
  end

end
