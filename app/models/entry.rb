class Entry < ApplicationRecord
  belongs_to :student
  
  delegate :teacher, :to => :student, :allow_nil => false
end
