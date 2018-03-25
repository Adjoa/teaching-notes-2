class Student < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :attendances
  has_many :rehearsals, through: :attendances
  
  validates :name, :email, presence: true
end
