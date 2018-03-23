class Student < ApplicationRecord
  belongs_to :teacher
  has_many :entries
  has_many :attendances
  has_many :rehearsals, through: :attendances
end
