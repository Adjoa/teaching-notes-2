class Rehearsal < ApplicationRecord
  belongs_to :event
  has_many :attendances
  has_many :students, through: :attendances
  delegate :user, :to => :event, :allow_nil => true
end
