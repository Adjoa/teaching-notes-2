class Rehearsal < ApplicationRecord
  belongs_to :event
  has_many :attendances
  has_many :students, through: :attendances
  delegate :user, :to => :event, :allow_nil => true
  
  def students_attending
    self.attendances.going.collect do |attendance|
      Student.find(attendance.student_id)
    end
  end
end
