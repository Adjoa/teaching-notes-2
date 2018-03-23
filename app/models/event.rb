class Event < ApplicationRecord
  belongs_to :teacher
  has_many :rehearsals
  
  validates :name, presence: true
end
