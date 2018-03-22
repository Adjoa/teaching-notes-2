class Rehearsal < ApplicationRecord
  belongs_to :event
  
  delegate :teacher, :to => :event, :allow_nil => true
end
