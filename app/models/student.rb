class Student < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :rehearsals, through: :attendances
  
  validates :name, presence: true
  validates :email, 
            :presence => true, 
            :uniqueness => true, 
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
            
  def rehearsals_attending
    self.attendances.going.collect do |attendance|
      Rehearsal.find(attendance.rehearsal_id)
    end
  end
  
  def count_rehearsals
    self.rehearsals_attending.count
  end
end
