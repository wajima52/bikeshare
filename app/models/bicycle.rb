class Bicycle < ApplicationRecord
    
 mount_uploader :image, ImageUploader

 belongs_to :user
 
 validates :user_id, presence: true
 
  has_many :relationships
  has_many :applicants, through: :relationships, source: :user
  
  def applicant(user)
      self.relationships.find_or_create_by(user.id)
  end
         
         
  def applicant?(user)
      self.applicants.include?(user)
  end

end
