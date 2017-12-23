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
        
         has_many :matchings,foreign_key: 'borrower_id'
         has_many :demandings, through: :matchings, source: :bicycle
        # has_many :reverces_of_matching, class_name: 'Matching', foreign_key: 'renter_id'
         
         
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
         
         def demand(bicycle)
             self.matchings.find_or_create_by(bicycle_id: bicycle.id)
         end
         
         def undemand(bicycle)
             matching = self.matchings.find_or_create_by(bicycle_id: bicycle.id)
             matching.destroy if matching
         end
         
         def demand?(bicycle)
             self.matchings.include?(bicycle)
         end
         
         
         def answer(other_user)
             self.matchings.find_or_create_by(borrower_id: other_user.id)
         end
         
         
end
