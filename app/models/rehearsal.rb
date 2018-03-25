class Rehearsal < ApplicationRecord
  belongs_to :event
  
  delegate :user, :to => :event, :allow_nil => true
end
