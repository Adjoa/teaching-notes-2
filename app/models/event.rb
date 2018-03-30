class Event < ApplicationRecord
  belongs_to :user
  has_many :rehearsals, dependent: :destroy
  
  validates :name, :venue, presence: true
end
