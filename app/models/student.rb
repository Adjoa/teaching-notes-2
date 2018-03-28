class Student < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :attendances
  has_many :rehearsals, through: :attendances
  
  validates :name, :email, presence: true
  
  def rehearsals_attending
    self.attendances.going.collect do |attendance|
      Rehearsal.find(attendance.rehearsal_id)
    end
  end
  
  def count_rehearsals
    self.rehearsals_attending.count
  end
end
