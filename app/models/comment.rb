class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :rehearsal
  
  validates :content, presence: true
end
