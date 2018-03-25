class Entry < ApplicationRecord
  belongs_to :student
  
  delegate :user, :to => :student, :allow_nil => true
  
  validates :title, :content, presence: true
end
