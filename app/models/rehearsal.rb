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
  
  def count_attending
    self.students_attending.count
  end
  
  def students_attended
    self.attendances.went.collect do |attendance|
      Student.find(attendance.student_id)
    end
  end
  
  def count_attended
    self.students_went.count
  end
end
