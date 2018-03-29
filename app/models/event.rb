class Event < ApplicationRecord
  belongs_to :user
  has_many :rehearsals
  
  validates :name, :venue, presence: true
end
