class Event < ApplicationRecord
  belongs_to :user
  has_many :rehearsals
  
  validates :name, presence: true
end
