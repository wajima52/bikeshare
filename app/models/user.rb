class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable
         #:omniauthable, omniauth_providers: [:twitter]
         
         has_many :bicycles
         
         has_many :relationships
         has_many :wantings, through: :relationships, source: :rental_bicycle
         
         
         
         def wanting(bicycle)
             self.relationships.find_or_create_by(rental_bicycle_id: bicycle.id)
         end
         
         def unwanting(bicycle)
             relationship = self.relationships.find_by(rental_bicycle_id: bicycle.id)
             relationship.destroy if relationship
         end
         
         def wanting?(bicycle)
             self.wantings.include?(bicycle)
         end
         
end
