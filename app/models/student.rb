class Student < ApplicationRecord
  belongs_to :teacher
  has_many :attendances
  has_many :rehearsals, through: :attendances
end
