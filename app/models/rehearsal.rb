class Rehearsal < ApplicationRecord
  belongs_to :event
  has_many :attendances
  delegate :user, :to => :event, :allow_nil => true
end
