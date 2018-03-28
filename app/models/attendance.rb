class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :rehearsal
  
  scope :going, -> { where(going: true) }
  scope :went, -> {  where(went: true) }
end
