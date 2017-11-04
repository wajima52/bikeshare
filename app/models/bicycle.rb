class Bicycle < ApplicationRecord
    
 mount_uploader :image, ImageUploader

 belongs_to :user
 
 validates :user_id, presence: true
end
