class Camper < ApplicationRecord
   
    has_many :signups
    has_many :activities, through: :signups

    validates :name,:age , presence: true
    validates :age, inclusion: 8..18
    
end
